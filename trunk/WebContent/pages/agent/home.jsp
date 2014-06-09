<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		$("#save").jqxButton({
			width : "100px",
			theme : theme
		});
		$("#clear").jqxButton({
			width : "100px",
			theme : theme
		});

		// update the edited row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#membershipTypeForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#membershipTypeForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/agent/ajxAddOrUpdate',
					data : formInput,
					success : function(data) {
						var dataAdapter = new $.jqx.dataAdapter(source);
						$("#jqxgrid").jqxGrid({
							source : dataAdapter
						});
					}
				});
				clearText();
			}
		});

		$("#clear").click(function() {
			clearText();
		});

		$("#popupDelete").jqxWindow({
			width : 400,
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelDelete"),
			modalOpacity : 0.5,
			showAnimationDuration : 500,
			animationType : 'fade'
		});

		// Prepare the data
		var url = "/hotel/agent/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'agentId',
				type : 'int'
			}, {
				name : 'firstName',
				type : 'String'
			}, {
				
				name : 'lastName',
				type : 'String'
			}, {
				name : 'country',
				type : 'String'
			}, {
				name : 'emailAddress',
				type : 'String'
			}, {
			
				name : 'telephoneNumber',
				type : 'String'
			}, {
				name : 'permitNumber',
				type : 'String'
			}, {
				
				name : 'remarks',
				type : 'String'
			}, {
				name : 'status',
				type : 'String'
			
			
			} ],
			id : 'agentId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '50%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [
							{
								text : 'firstName',
								datafield : 'firstName',
								align : 'left'
							},
							{
								text : 'LastName',
								datafield : 'lastName',
								align : 'left'
							},
							{
								text : 'country',
								datafield : 'country',
								align : 'left'
							},
							{
								text : 'emailAddress',
								datafield : 'emailAddress',
								align : 'left'
							},
							{
								text : 'telephoneNumber',
								datafield : 'telephoneNumber',
								align : 'left'
							
							},
							{
								text : 'permitNumber',
								datafield : 'permitNumber',
								align : 'left'
							},
							{
								text : 'remarks',
								datafield : 'remarks',
								align : 'left'
							},
							{
								text : 'status',
								datafield : 'status',
								align : 'left'
							},
							
							{
								text : 'Edit',
								datafield : 'Edit',
								columntype : 'button',
								width : 100,
								align : 'center',
								cellsrenderer : function() {
									return "Edit";
								},
								buttonclick : function(row) {
									//get the clicked row's data and initialize the input fields.
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipType").val(
											dataRecord.membershipType);
								}
							},
							{
								text : 'Delete',
								datafield : 'Delete',
								columntype : 'button',
								width : 100,
								align : 'center',
								cellsrenderer : function() {
									return "Delete";
								},
								buttonclick : function(row) {
									//get the clicked row's data and initialize the input fields.
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									$("#agentIdDelete").val(dataRecord.agentId);
																				
									$("#firstNameDelete").val(dataRecord.firstName);
											
									$("#LastNameDelete").val(dataRecord.lastName);
											
									$("#countryDelete").val(dataRecord.country);
											
									$("#emailAddressDelete").val(dataRecord.emailAddress);
											
									$("#telephoneNumberDelete").val(dataRecord.telephoneNumber);
											
									$("#permitNumberDelete").val(dataRecord.permitNumber);
											
									$("#remarksDelete").val(dataRecord.remarks);
											
									$("#statusDelete").val(dataRecord.status);
											
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

		$('#membershipTypeForm').jqxValidator({
			rules : [ {
				input : '#firstName',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

		$("#cancelDelete").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelDelete").click(function() {
			$("#popupDelete").jqxWindow('hide');
		});

		$("#delete").jqxButton({
			width : "100px",
			theme : theme
		});
		// delete row when the user clicks the 'Delete' button.
		$("#delete").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#membershipTypeDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/agent/ajxDelete',
				data : formInput,
				success : function(data) {
					var dataAdapter = new $.jqx.dataAdapter(source);
					$("#jqxgrid").jqxGrid({
						source : dataAdapter
					});
				}
			});
			$("#popupDelete").jqxWindow('hide');
		});

		clearText();
	}

	function clearText() {
		$("#membershipTypeId").val('');
		$("#membershipType").val('');
		$('#membershipTypeForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="membershipTypeForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Agent</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="agentId" name="agentId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><input type="text" id="title" name="title"
					class="text-input" title="title" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" id="country" name="country"
					class="text-input" title="country " /></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress " /></td>
			</tr>
			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber " /></td>
			</tr>
			<tr>
				<td>Permit Number</td>
				<td><input type="text" id="permitNumber" name="permitNumber"
					class="text-input" title="permitNumber" /></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks " /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status " /></td>
			</tr>



			<tr>
				<td>&nbsp;</td>
				<td style="padding-top: 10px;"><input type="button" id="save"
					value="Save" style="margin-right: 5px;" /> <input id="clear"
					type="button" value="Clear" /></td>
			</tr>
		</table>
	</form>
</div>

<div id="popupDelete">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="membershipTypeDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>

				
				<tr>
					
					<td colspan="2"><input type="hidden" id="agentIdDelete" name="agentId"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>First Name :</td>
					<td><input type="text" id="firstNameDelete" name="firstName"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Last Name :</td>
					<td><input type="text" id="LastNameDelete" name="lastName"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Country:</td>
					<td><input type="text" id="countryDelete" name="country"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Email Address :</td>
					<td><input type="text" id="emailAddressDelete"
						name="emailAddress" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Telephone Number :</td>
					<td><input type="text" id="telephoneNumberDelete"
						name="telephoneNumber" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Permit Number:</td>
					<td><input type="text" id="permitNumberDelete"
						name="permitNumber" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Remarks :</td>
					<td><input type="text" id="remarksDelete" name="remarks"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Status :</td>
					<td><input type="text" id="remarksDelete" name="status"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="delete"
						value="Delete" /><input id="cancelDelete" type="button"
						value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>

