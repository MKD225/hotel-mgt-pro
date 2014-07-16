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
			window.location.replace("/hotel/guest/insert");
		});

		$("#popupView").jqxWindow({
			width : 400,
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelView"),
			modalOpacity : 0.5,
			showAnimationDuration : 500,
			animationType : 'fade'
		});

		$("#popupEdit").jqxWindow({
			width : 400,
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelEdit"),
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
				name : 'title',
				type : 'String'
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
				text : 'Title',
				datafield : 'title',
				align : 'left'
			}, {
				text : 'FirstName',
				datafield : 'firstName',
				align : 'left'
			}, {
				text : 'LastName',
				datafield : 'lastName',
				align : 'left'
			}, {
				text : 'DateOfBirth',
				datafield : 'dateOfBirth',
				align : 'left'
			}, {
				text : 'City',
				datafield : 'city',
				align : 'left'
			}, {
				text : 'Country',
				datafield : 'country',
				align : 'left'
			}, {
				text : 'CountryCode',
				datafield : 'countryCode',
				align : 'left'
			}, {
				text : 'TelephoneNumber',
				datafield : 'telephoneNumber',
				align : 'left'
			}, {
				text : 'EmailAddress',
				datafield : 'emailAddress',
				align : 'left'
			}, {
				text : 'Fax',
				datafield : 'fax',
				align : 'left'
			}, {
				text : 'MailAddress',
				datafield : 'mailAddress',
				align : 'left'
			}, {
				text : 'Nationality',
				datafield : 'nationality',
				align : 'left'
			}, {
				text : 'NicNumber',
				datafield : 'nicNumber',
				align : 'left'
			}, {
				text : 'PassportNumber',
				datafield : 'passportNumber',
				align : 'left'
			}, {
				text : 'Remarks',
				datafield : 'remarks',
				align : 'left'
			}, {
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
					$("#guestIdEdit").val(dataRecord.guestId);
					$("#titleEdit").val(dataRecord.title);
					$("#firstNameEdit").val(dataRecord.firstName);
					$("#lastNameEdit").val(dataRecord.lastName);
					$("#dateOfBirthEdit").val(dataRecord.dateOfBirth);
					$("#cityEdit").val(dataRecord.city);
					$("#countryEdit").val(dataRecord.country);
					$("#countryCodeEdit").val(dataRecord.countryCode);
					$("#telephoneNumberEdit").val(dataRecord.telephoneNumber);
					$("#emailAddressEdit").val(dataRecord.emailAddress);
					$("#faxEdit").val(dataRecord.fax);
					$("#mailAddressEdit").val(dataRecord.mailAddress);
					$("#nationalityEdit").val(dataRecord.nationality);
					$("#nicNumberEdit").val(dataRecord.nicNumber);
					$("#passportNumberEdit").val(dataRecord.passportNumber);
					$("#anniversaryDelete").val(dataRecord.anniversary);
					$("#remarksEdit").val(dataRecord.remarks);
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
					$("#guestIdView").val(dataRecord.guestId);
					$("#titleView").val(dataRecord.title);
					$("#firstNameView").val(dataRecord.firstName);
					$("#lastNameView").val(dataRecord.lastName);
					$("#dateOfBirthView").val(dataRecord.dateOfBirth);
					$("#cityView").val(dataRecord.city);
					$("#countryView").val(dataRecord.country);
					$("#countryCodeView").val(dataRecord.countryCode);
					$("#telephoneNumberView").val(dataRecord.telephoneNumber);
					$("#emailAddressView").val(dataRecord.emailAddress);
					$("#faxView").val(dataRecord.fax);
					$("#mailAddressView").val(dataRecord.mailAddress);
					$("#nationalityView").val(dataRecord.nationality);
					$("#nicNumberView").val(dataRecord.nicNumber);
					$("#passportNumberView").val(dataRecord.passportNumber);
					$("#anniversaryView").val(dataRecord.anniversary);
					$("#remarksView").val(dataRecord.remarks);
					$("#popupView").jqxWindow('open');
				}
			} ]
		});

		// 		$('#membershipTypeForm').jqxValidator({
		// 			rules : [ {
		// 				input : '#type',
		// 				message : 'Membership Type is required!',
		// 				action : 'keyup, blur',
		// 				rule : 'required'
		// 			} ],
		// 			theme : theme,
		// 			scroll : false
		// 		});

		$("#cancelView").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelView").click(function() {
			$("#popupView").jqxWindow('hide');
		});

		$("#cancelEdit").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelEdit").click(function() {
			$("#popupEdit").jqxWindow('hide');
		});

		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});

		// 		$("#delete").jqxButton({
		// 			width : "100px",
		// 			theme : theme
		// 		});
		// 		// delete row when the user clicks the 'Delete' button.
		// 		$("#delete").click(function() {
		// 			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
		// 			//             if (onSuccess) {
		// 			var formInput = $("#guestDeleteForm").serialize();
		// 			console.info("what");
		// 			$.ajax({
		// 				type : 'post',
		// 				url : '/hotel/guest/ajxDelete',
		// 				data : formInput,
		// 				success : function(data) {
		// 					var dataAdapter = new $.jqx.dataAdapter(source);
		// 					$("#jqxgrid").jqxGrid({
		// 						source : dataAdapter
		// 					});
		// 				}
		// 			});
		// 			$("#popupDelete").jqxWindow('hide');
		// 		});

		// edit row when the user clicks the 'Edit' button.

		$("#edit").click(function() {

			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#guestEditForm").serialize();
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
			$("#popupEdit").jqxWindow('hide');
		});

	}
</script>

<div>
	<input type="button" value="Add Discount" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<div id="popupEdit">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="guestEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Guest</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="guestIdEdit"
						name="guestId" class="text-input" /></td>
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" id="titleEdit" name="title"
						class="text-input" title="title" /></td>
				</tr>

				<tr>
					<td>First Name</td>
					<td><input type="text" id="firstNameEdit" name="firstName"
						class="text-input" title="firstName Type" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" id="lastNameEdit" name="lastName"
						class="text-input" title="lastName Type" /></td>
				</tr>

				<tr>
					<td>dateOfBirth</td>
					<td><input type="text" id="dateOfBirthEdit" name="dateOfBirth"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>city</td>
					<td><input type="text" id="cityEdit" name="city"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>country</td>
					<td><input type="text" id="countryEdit" name="country"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>countryCode</td>
					<td><input type="text" id="countryCodeEdit" name="countryCode"
						class="text-input" /></td>
				</tr>

				<tr>
					<td>telephoneNumber</td>
					<td><input type="text" id="telephoneNumberEdit"
						name="telephoneNumber" class="text-input" /></td>
				</tr>

				<tr>
					<td>emailAddress</td>
					<td><input type="text" id="emailAddressEdit"
						name="emailAddress" class="text-input" /></td>
				</tr>
				<tr>
					<td>Fax No</td>
					<td><input type="text" id="faxEdit" name="fax"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>Mail Address Type</td>
					<td><input type="text" id="mailAddressEdit" name="mailAddress"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>Nationality</td>
					<td><input type="text" id="nationalityEdit" name="nationality"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>nicNumber</td>
					<td><input type="text" id="nicNumberEdit" name="nicNumber"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>passportNumber</td>
					<td><input type="text" id="passportNumberEdit"
						name="passportNumber" class="text-input" /></td>
				</tr>

				<tr>
					<td>anniversary</td>
					<td><input type="text" id="anniversaryEdit" name="anniversary"
						class="text-input" /></td>
				</tr>

				<tr>
					<td>remarks</td>
					<td><input type="text" id="remarksEdit" name="remarks"
						class="text-input" /></td>
				</tr>


				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="edit" value="Edit" /><input
						id="cancelEdit" type="button" value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div id="popupView">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="guestViewForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Guest</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="guestIdView"
						name="guestId" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" id="titleView" name="title"
						class="text-input" title="title" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>First Name</td>
					<td><input type="text" id="firstNameView" name="firstName"
						class="text-input" title="firstName Type" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" id="lastNameView" name="lastName"
						class="text-input" title="lastName Type" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>dateOfBirth</td>
					<td><input type="text" id="dateOfBirthView" name="dateOfBirth"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>city</td>
					<td><input type="text" id="cityView" name="city"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>country</td>
					<td><input type="text" id="countryView" name="country"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>countryCode</td>
					<td><input type="text" id="countryCodeView" name="countryCode"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>telephoneNumber</td>
					<td><input type="text" id="telephoneNumberView"
						name="telephoneNumber" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>emailAddress</td>
					<td><input type="text" id="emailAddressView"
						name="emailAddress" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Fax No</td>
					<td><input type="text" id="faxView" name="fax"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Mail Address Type</td>
					<td><input type="text" id="mailAddressView" name="mailAddress"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Nationality</td>
					<td><input type="text" id="nationalityView" name="nationality"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>nicNumber</td>
					<td><input type="text" id="nicNumberView" name="nicNumber"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>passportNumber</td>
					<td><input type="text" id="passportNumberView"
						name="passportNumber" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>anniversary</td>
					<td><input type="text" id="anniversaryView" name="anniversary"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>remarks</td>
					<td><input type="text" id="remarksView" name="remarks"
						class="text-input" readonly="readonly" /></td>
				</tr>


				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="view" value="View" /><input
						id="cancelView" type="button" value="Close" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div class="clr"></div>