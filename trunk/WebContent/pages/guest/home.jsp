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
					url : '/hotel/guest/ajxAddOrUpdate',
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
		var url = "/hotel/guest/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'guestId',
				type : 'int'
			}, {
				name : 'firstName',
				type : 'String'
			}, {

				name : 'lastName',
				type : 'String'
			}, {
				name : 'dateOfBirth',
				type : 'String'
			}, {
				name : 'city',
				type : 'String'
			}, {

				name : 'country',
				type : 'String'
			}, {

				name : 'countryCode',
				type : 'String'
			}, {
				name : 'telephoneNumber',
				type : 'String'
			}, {
				name : 'emailAddress',
				type : 'String'
			}, {
				name : 'fax',
				type : 'String'
			}, {
				name : 'mailAddress',
				type : 'String'
			}, {
				name : 'nationality',
				type : 'String'
			}, {
				name : 'nicNumber',
				type : 'String'
			}, {
				name : 'passportNumber',
				type : 'String'
			}, {
				name : 'remarks',
				type : 'String'
			} ],
			id : 'guestId',
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
								text : 'FirstName',
								datafield : 'firstName',
								align : 'left'
							},
							{
								text : 'LastName',
								datafield : 'lastName',
								align : 'left'
							},
							{
								text : 'DateOfBirth',
								datafield : 'dateOfBirth',
								align : 'left'
							},
							{
								text : 'City',
								datafield : 'city',
								align : 'left'
							},
							{
								text : 'Country',
								datafield : 'country',
								align : 'left'
							},
							{
								text : 'CountryCode',
								datafield : 'countryCode',
								align : 'left'
							},
							{
								text : 'TelephoneNumber',
								datafield : 'telephoneNumber',
								align : 'left'
							},
							{
								text : 'EmailAddress',
								datafield : 'emailAddress',
								align : 'left'
							},
							{
								text : 'Fax',
								datafield : 'fax',
								align : 'left'
							},
							{
								text : 'MailAddress',
								datafield : 'mailAddress',
								align : 'left'
							},
							{
								text : 'Nationality',
								datafield : 'nationality',
								align : 'left'
							},
							{
								text : 'NicNumber',
								datafield : 'nicNumber',
								align : 'left'
							},
							{
								text : 'PassportNumber',
								datafield : 'passportNumber',
								align : 'left'
							},
							{
								text : 'Remarks',
								datafield : 'remarks',
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
									$("#guestIdDelete").val(
											dataRecord.guestId);
									$("#firstNameDelete").val(
											dataRecord.firstName);
									$("#lastNameDelete").val(
											dataRecord.lastName);
									$("#dateOfBirthDelete").val(
											dataRecord.dateOfBirth);
									$("#cityDelete").val(
											dataRecord.city);							
									$("#countryDelete").val(
											dataRecord.country);
									$("#countryCodeDelete").val(
											dataRecord.countryCode);
									$("#telephoneNumberDelete").val(
											dataRecord.telephoneNumber);
									$("#emailAddressDelete").val(
											dataRecord.emailAddress);
									$("#faxDelete").val(
											dataRecord.fax);
									$("#mailAddressDelete").val(
											dataRecord.mailAddress);
									$("#nationalityDelete").val(
											dataRecord.nationality);
									$("#nicNumberDelete").val(
											dataRecord.nicNumber);									
									$("#passportNumber").val(
											dataRecord.passportNumber);
									$("#anniversaryDelete").val(
											dataRecord.anniversary);
									$("#remarksDelete").val(
											dataRecord.remarks);
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

		$('#membershipTypeForm').jqxValidator({
			rules : [ {
				input : '#anniversary',
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
				url : '/hotel/guest/ajxDelete',
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
				<td colspan="2" align="center"><b>Guest</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="guestId" name="guestId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName Type" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName Type" /></td>
			</tr>

			<tr>
				<td>dateOfBirth Type</td>
				<td><input type="text" id="dateOfBirth" name="dateOfBirth"
					class="text-input" title="dateOfBirth Type" /></td>
			</tr>
			<tr>
				<td>city Type</td>
				<td><input type="text" id="city" name="city" class="text-input"
					title="city Type" /></td>
			</tr>
			<tr>
				<td>country</td>
				<td><input type="text" id="country" name="country"
					class="text-input" title="country Type" /></td>
			</tr>
			<tr>
				<td>countryCode</td>
				<td><input type="text" id="countryCode" name="countryCode"
					class="text-input" title="countryCode Type" /></td>
			</tr>

			<tr>
				<td>telephoneNumber</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input"
					title="telephoneNumber Type" /></td>
			</tr>

			<tr>
				<td>emailAddress</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress Type" /></td>
			</tr>
			<tr>
				<td>Fax No</td>
				<td><input type="text" id="fax" name="fax" class="text-input"
					title="fax Type" /></td>
			</tr>



			<tr>
				<td>Mail Address Type</td>
				<td><input type="text" id="mailAddress" name="mailAddress"
					class="text-input" title="mailAddress Type" /></td>
			</tr>
			<tr>
				<td>Nationality</td>
				<td><input type="text" id="nationality" name="nationality"
					class="text-input" title="nationality Type" /></td>
			</tr>
			<tr>
				<td>nicNumber</td>
				<td><input type="text" id="nicNumber" name="nicNumber"
					class="text-input" title="nicNumber Type" /></td>
			</tr>
			<tr>
				<td>passportNumber</td>
				<td><input type="text" id="passportNumber"
					name="passportNumber" class="text-input"
					title="passportNumber Type" /></td>
			</tr>

			<tr>
				<td>anniversary</td>
				<td><input type="text" id="anniversary" name="anniversary"
					class="text-input" title="anniversary Type" /></td>
			</tr>

			<tr>
				<td>remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks Type" /></td>
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
						<b>Guest</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="guestIdDelete"
						name="guestId" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>First Name</td>
					<td><input type="text" id="firstNameDelete" name="firstName"
						class="text-input" title="firstName Type" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" id="lastNameDelete" name="lastName"
						class="text-input" title="lastName Type" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>dateOfBirth</td>
					<td><input type="text" id="dateOfBirthDelete"
						name="dateOfBirth" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>city</td>
					<td><input type="text" id="cityDelete" name="city"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>country</td>
					<td><input type="text" id="countryDelete" name="country"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>countryCode</td>
					<td><input type="text" id="countryCodeDelete"
						name="countryCode" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>telephoneNumber</td>
					<td><input type="text" id="telephoneNumberDelete"
						name="telephoneNumber" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>emailAddress</td>
					<td><input type="text" id="emailAddressDelete"
						name="emailAddress" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Fax No</td>
					<td><input type="text" id="faxDelete" name="fax"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Mail Address Type</td>
					<td><input type="text" id="mailAddressDelete" name="mailAddress"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Nationality</td>
					<td><input type="text" id="nationalityDelete" name="nationality"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>nicNumber</td>
					<td><input type="text" id="nicNumberDelete" name="nicNumber"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>passportNumber</td>
					<td><input type="text" id="passportNumberDelete"
						name="passportNumber" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>anniversary</td>
					<td><input type="text" id="anniversaryDelete" name="anniversary"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>remarks</td>
					<td><input type="text" id="remarksDelete" name="remarks"
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

