<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		$("#jqxButton").on('click', function() {
			window.location.replace("/hotel/agent/insert");
		});

		$("#popupView").jqxWindow({
			width : '75%',
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#closeView"),
			showAnimationDuration : 1000,
			modalOpacity : 0.45
		});
		$("#popupEdit").jqxWindow({
			width : '75%',
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelEdit"),
			showAnimationDuration : 1000,
			modalOpacity : 0.45
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
				name : 'title',
				type : 'String'
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
		$("#jqxgrid").jqxGrid({
			width : '100%',
			autoheight : true,
			source : dataAdapter,
			showfilterrow : true,
			filterable : true,
			columnsresize : true,
			pageable : true,
			pagesize : 20,
			autorowheight : true,
			rowsheight : 80,
			theme : theme,
			columns : [ {
				text : 'title',
				datafield : 'title',
				align : 'left'
			}, {
				text : 'firstName',
				datafield : 'firstName',
				align : 'left'
			}, {
				text : 'LastName',
				datafield : 'lastName',
				align : 'left'
			}, {
				text : 'country',
				datafield : 'country',
				align : 'left'
			}, {
				text : 'emailAddress',
				datafield : 'emailAddress',
				align : 'left'
			}, {
				text : 'telephoneNumber',
				datafield : 'telephoneNumber',
				align : 'left'
			}, {
				text : 'permitNumber',
				datafield : 'permitNumber',
				align : 'left'
			}, {
				text : 'remarks',
				datafield : 'remarks',
				align : 'left'
			}, {
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
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					$("#agentIdEdit").val(dataRecord.agentId);
					$("#titleEdit").val(dataRecord.title);
					$("#firstNameEdit").val(dataRecord.firstName);
					$("#lastNameEdit").val(dataRecord.lastName);
					$("#countryEdit").val(dataRecord.country);
					$("#emailAddressEdit").val(dataRecord.emailAddress);
					$("#telephoneNumberEdit").val(dataRecord.telephoneNumber);
					$("#permitNumberEdit").val(dataRecord.permitNumber);
					$("#remarksEdit").val(dataRecord.remarks);
					$("#statusEdit").val(dataRecord.status);
					$("#popupEdit").jqxWindow('open');
				}
			}, {
				text : 'View',
				datafield : 'View',
				columntype : 'button',
				width : 100,
				align : 'center',
				cellsrenderer : function() {
					return "View";
				},
				buttonclick : function(row) {
					//get the clicked row's data and initialize the input fields.
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					// 									var name = $("#firstNameView").val(dataRecord.firstName);
					// 									$("#fname").val(name);
					// 									$("#fname:text").val(dataRecord.firstName);

					$("#agentIdView").val(dataRecord.agentId);

					$("#titleView").val(dataRecord.title);

					$("#firstNameView").val(dataRecord.firstName);

					$("#LastNameView").val(dataRecord.lastName);

					$("#countryView").val(dataRecord.country);

					$("#emailAddressView").val(dataRecord.emailAddress);

					$("#telephoneNumberView").val(dataRecord.telephoneNumber);

					$("#permitNumberView").val(dataRecord.permitNumber);

					$("#remarksView").val(dataRecord.remarks);

					$("#statusView").val(dataRecord.status);

					$("#popupView").jqxWindow('open');
				}
			} ]
		});

		// 		$('#agentEditForm').jqxValidator({
		// 			rules : [ {
		// 				input : '#remarks',
		// 				message : 'Membership Type is required!',
		// 				action : 'keyup, blur',
		// 				rule : 'required'
		// 			} ],
		// 			theme : theme,
		// 			scroll : false
		// 		});

		$("#cancelEdit").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelEdit").click(function() {
			$("#popupEdit").jqxWindow('hide');
		});

		$("#closeView").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#closeView").click(function() {
			$("#popupView").jqxWindow('hide');
		});

		// edit row when the user clicks the 'Edit' button.
		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});

		// edit row when the user clicks the 'Edit' button.

		$("#edit").click(function() {

			// 				            var onSuccess = $('#agentEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#agentEditForm").serialize();
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
			$("#popupEdit").jqxWindow('hide');

		});

	}
</script>

<div>
	<input type="button" value="Add Agent" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="agentEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="agentIdEdit" name="agentId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="titleEdit" name="title"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type="text" id="firstNameEdit" name="firstName"
								class="text-input" title="firstName" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" id="lastNameEdit" name="lastName"
								class="text-input" title="lastName" /></td>
						</tr>

						<tr>
							<td>Country</td>
							<td><input type="text" id="countryEdit" name="country"
								class="text-input" title="country" /></td>
						</tr>

						<tr>
							<td>Email Address</td>
							<td><input type="text" id="emailAddressEdit"
								name="emailAddress" class="text-input" title="emailAddress " /></td>
						</tr>
						<tr>
							<td>Telephone Number</td>
							<td><input type="text" id="telephoneNumberEdit"
								name="telephoneNumber" class="text-input"
								title="telephoneNumber " /></td>
						</tr>
						<tr>
							<td>Permit Number</td>
							<td><input type="text" id="permitNumberEdit"
								name="permitNumber" class="text-input" title="permitNumber" /></td>
						</tr>
						<tr>
							<td>Remarks</td>
							<td><input type="text" id="remarksEdit" name="remarks"
								class="text-input" title="remarks " /></td>
						</tr>
						<tr>
							<td>Status</td>
							<td><input type="text" id="statusEdit" name="status"
								class="text-input" title="status " /></td>
						</tr>



						<tr>
							<td>&nbsp;</td>
							<td style="padding-top: 10px;"><input type="button"
								id="edit" value="Save" style="margin-right: 5px;" /> <input
								id="cancelEdit" type="button" value="Cancel" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>



<div id="popupView">
	<div>
		View Agent<input id=fname />
	</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="membershipTypeViewForm">
					<table>



						<tr>

							<td colspan="2"><input type="hidden" id="agentIdView"
								name="agentId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Title :</td>
							<td><input type="text" id="titleView" name="title"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>First Name :</td>
							<td><input type="text" id="firstNameView" name="firstName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Last Name :</td>
							<td><input type="text" id="LastNameView" name="lastName"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Country</td>
							<td><input type="text" id="countryView" name="country"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Email Address :</td>
							<td><input type="text" id="emailAddressView"
								name="emailAddress" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Telephone Number :</td>
							<td><input type="text" id="telephoneNumberView"
								name="telephoneNumber" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Permit Number:</td>
							<td><input type="text" id="permitNumberView"
								name="permitNumber" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Remarks :</td>
							<td><input type="text" id="remarksView" name="remarks"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Status :</td>
							<td><input type="text" id="statusView" name="status"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td style="padding-top: 10px;" align="center" colspan="1"><input
								id="closeView" type="button" value="Close" /></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="clr"></div>