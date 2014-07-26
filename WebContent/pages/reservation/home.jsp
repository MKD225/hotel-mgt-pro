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
			window.location.replace("/hotel/reservation/insert");
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
		var url = "/hotel/employee/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'reservationId',
				type : 'int'
			}, {
				name : 'title',
				type : 'String'
			}, {
				name : 'reservedFirstName',
				type : 'String'
			}, {

				name : 'reservedLastName',
				type : 'String'
			}, {
				name : 'numberOfAdults',
				type : 'String',
				
			}, {
				name : 'numberOfChildren',
				type : 'String'
			}, {

				name : 'numberOfRooms',
				type : 'String'
			}, {
				name : 'reservedDate',
				type : 'String'
			}, {

				name : 'arrivalDateTime',
				type : 'String'
			}, {
				name : 'departureDateTime',
				type : 'String'
			}, {
				name : 'allocationDateTime',
				type : 'String'
			}, {
				name : 'country',
				type : 'String'
			}, {
				name : 'reservationTypeName',
				type : 'String',
				map : 'resevationtype>reservationTypeName'
			}, {
				name : 'paymentType',
				type : 'String'
			}, {
				name : 'creditCardType',
				type : 'String',
				map : 'creditcardtype>creditCardType'
			}, {
				name : 'creditCardNumber',
				type : 'String'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'agent>firstName'
			}, {
				name : 'remarks',
				type : 'String'
			}, {

				name : 'status',
				type : 'String'
			}, {
				name : 'telephoneNumber',
				type : 'String',
				
			}, {
				name : 'emailAddress',
				type : 'String'
			}, {	
				name : 'passportNumber',
				type : 'String'
			}, {

				name : 'flightnumber',
				type : 'String'
			}, {
				name : 'pickUpTime',
				type : 'String'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'employee>firstName'
			}, {
				name : 'name',
				type : 'String',
				map : 'externaldriver>name'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'employee>firstName'
			}, {
				name : 'name',
				type : 'String',
				map : 'externaldriver>name'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'guest>firstName'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'employee>firstName'
			}, {
				name : 'type',
				type : 'String',
				map : 'discount>type'
			} ],
			id : 'reservationId',
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
				text : 'reservedFirstName',
				datafield : 'reservedFirstName',
				align : 'left'
			}, {
				text : 'reservedLastName',
				datafield : 'reservedLastName',
				align : 'left'
			}, {
				text : 'numberOfAdults',
				datafield : 'numberOfAdults',
				align : 'left'
			}, {
				text : 'numberOfChildren',
				datafield : 'numberOfChildren',
				align : 'left'
			}, {
				text : 'numberOfRooms',
				datafield : 'numberOfRooms',
				align : 'left'
			}, {
				text : 'reservedDate',
				datafield : 'reservedDate',
				align : 'left'
			}, {
				text : 'arrivalDateTime',
				datafield : 'arrivalDateTime',
				align : 'left'
			}, {
				text : 'departureDateTime',
				datafield : 'departureDateTime',
				align : 'left'
			}, {
				text : 'allocationDateTime',
				datafield : 'allocationDateTime',
				align : 'left'
			}, {
			
				text : 'country',
				datafield : 'country',
				align : 'left'
			}, {
				text : 'reservationTypeName',
				datafield : 'reservationTypeName',
				align : 'left'
			
			}, {
				text : 'paymentType',
				datafield : 'paymentType',
				align : 'left'
			}, {
				text : 'creditCardType',
				datafield : 'creditCardType',
				align : 'left'
			}, {
				text : 'creditCardNumber',
				datafield : 'creditCardNumber',
				align : 'left'
			}, {
				text : 'departmentName',
				datafield : 'departmentName',
				align : 'left'
			}, {
				text : 'email',
				datafield : 'email',
				align : 'left'
			}, {
				text : 'mobile',
				datafield : 'mobile',
				align : 'left'
			}, {
				text : 'home',
				datafield : 'home',
				align : 'left'
			}, {
				text : 'address',
				datafield : 'address',
				align : 'left'
			}, {
				text : 'nicNumber',
				datafield : 'nicNumber',
				align : 'left'
			}, {
				text : 'password',
				datafield : 'password',
				align : 'left'
			}, {
				text : 'userName',
				datafield : 'userName',
				align : 'left'
			}, {
				text : 'privilegeType',
				datafield : 'privilegeType',
				align : 'left'
			}, {
				text : 'description',
				datafield : 'description',
				align : 'left'
			}, {
				text : 'address',
				datafield : 'address',
				align : 'left'
			}, {
				text : 'nicNumber',
				datafield : 'nicNumber',
				align : 'left'
			}, {
				text : 'password',
				datafield : 'password',
				align : 'left'
			}, {
				text : 'userName',
				datafield : 'userName',
				align : 'left'
			}, {
				text : 'privilegeType',
				datafield : 'privilegeType',
				align : 'left'
			}, {
				text : 'description',
				datafield : 'description',
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
					$("#reservationIdEdit").val(dataRecord.reservationId);
					$("#titleEdit").val(dataRecord.title);
					$("#reservedFirstNameEdit").val(dataRecord.reservedFirstName);
					$("#reservedLastNameEdit").val(dataRecord.reservedLastName);
					$("#numberOfAdultsEdit").val(dataRecord.numberOfAdults);
					$("#numberOfChildrenEdit").val(dataRecord.numberOfChildren);
					$("#numberOfRoomsEdit").val(dataRecord.numberOfRooms);
					$("#reservedDateEdit").val(dataRecord.reservedDate);
					$("#arrivalDateTimeEdit").val(dataRecord.arrivalDateTime);
					$("#departureDateTimeEdit").val(dataRecord.departureDateTime);
					$("#allocationDateTimeEdit").val(dataRecord.allocationDateTime);
					$("#countryEdit").val(dataRecord.country);
					$("#reservationTypeNameEdit").val(dataRecord.reservationTypeName);
					$("#paymentTypeEdit").val(dataRecord.paymentType);
					$("#creditCardTypeEdit").val(dataRecord.creditCardType);
					$("#creditCardNumberEdit").val(dataRecord.creditCardNumber);
					$("#titleEdit").val(dataRecord.title);
					$("#reservedFirstNameEdit").val(dataRecord.reservedFirstName);
					$("#reservedLastNameEdit").val(dataRecord.reservedLastName);
					$("#numberOfAdultsEdit").val(dataRecord.numberOfAdults);
					$("#numberOfChildrenEdit").val(dataRecord.numberOfChildren);
					$("#numberOfRoomsEdit").val(dataRecord.numberOfRooms);
					$("#reservedDateEdit").val(dataRecord.reservedDate);
					$("#arrivalDateTimeEdit").val(dataRecord.arrivalDateTime);
					$("#departureDateTimeEdit").val(dataRecord.departureDateTime);
					$("#allocationDateTimeEdit").val(dataRecord.allocationDateTime);
					$("#countryEdit").val(dataRecord.country);
					$("#reservationTypeNameEdit").val(dataRecord.reservationTypeName);
					$("#paymentTypeEdit").val(dataRecord.paymentType);
					$("#descriptionEdit").val(dataRecord.description);
					$("#descriptionEdit").val(dataRecord.description);

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

					$("#reservationIdView").val(dataRecord.reservationId);
					$("#titleView").val(dataRecord.title);
					$("#reservedFirstNameView").val(dataRecord.reservedFirstName);
					$("#reservedLastNameView").val(dataRecord.reservedLastName);
					$("#numberOfAdultsView").val(dataRecord.numberOfAdults);
					$("#numberOfChildrenView").val(dataRecord.numberOfChildren);
					$("#numberOfRoomsView").val(dataRecord.numberOfRooms);
					$("#reservedDateView").val(dataRecord.reservedDate);
					$("#arrivalDateTimeView").val(dataRecord.arrivalDateTime);
					$("#departureDateTimeView").val(dataRecord.departureDateTime);
					$("#allocationDateTimeView").val(dataRecord.allocationDateTime);
					$("#countryView").val(dataRecord.country);
					$("#reservationTypeNameView").val(dataRecord.reservationTypeName);
					$("#paymentTypeView").val(dataRecord.paymentType);
					$("#creditCardTypeView").val(dataRecord.creditCardType);
					$("#creditCardNumberView").val(dataRecord.creditCardNumber);
					$("#reservationIdView").val(dataRecord.reservationId);
					$("#titleView").val(dataRecord.title);
					$("#reservedFirstNameView").val(dataRecord.reservedFirstName);
					$("#reservedLastNameView").val(dataRecord.reservedLastName);
					$("#numberOfAdultsView").val(dataRecord.numberOfAdults);
					$("#numberOfChildrenView").val(dataRecord.numberOfChildren);
					$("#numberOfRoomsView").val(dataRecord.numberOfRooms);
					$("#reservedDateView").val(dataRecord.reservedDate);
					$("#arrivalDateTimeView").val(dataRecord.arrivalDateTime);
					$("#departureDateTimeView").val(dataRecord.departureDateTime);
					$("#allocationDateTimeView").val(dataRecord.allocationDateTime);
					$("#countryView").val(dataRecord.country);
					$("#reservationTypeNameView").val(dataRecord.reservationTypeName);
					$("#paymentTypeView").val(dataRecord.paymentType);
					$("#privilegeView").val(dataRecord.privilegeType);
					$("#descriptionView").val(dataRecord.description);
					$("#descriptionView").val(dataRecord.description);


					$("#popupView").jqxWindow('open');
				}
			} ]
		});

		// 		$('#employeeEditForm').jqxValidator({
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

			// 				            var onSuccess = $('#employeeEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#employeeEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/employee/ajxAddOrUpdate',
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
	<input type="button" value="Add Employee" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="employeeEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="reservationIdEdit" name="reservationId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>title</td>
							<td><input type="text" id="titleEdit" name="title"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>reservedFirstName</td>
							<td><input type="text" id="reservedFirstNameEdit" name="reservedFirstName"
								class="text-input" title="firstName" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" id="reservedLastNameEdit" name="reservedLastName"
								class="text-input" title="reservedLastName" /></td>
						</tr>

						<tr>
							<td>numberOfAdults</td>
							<td><input type="text" id="numberOfAdultsEdit" name="numberOfAdults"
								class="text-input" title="numberOfAdults" /></td>
						</tr>

						<tr>
							<td>numberOfChildren</td>
							<td><input type="text" id="numberOfChildrenEdit" name="numberOfChildren"
								class="text-input" title="numberOfChildren " /></td>
						</tr>
						<tr>
							<td>numberOfRooms</td>
							<td><input type="text" id="numberOfRoomsEdit" name="numberOfRooms"
								class="text-input" title="numberOfRooms " /></td>
						</tr>
						<tr>
							<td>reservedDate</td>
							<td><input type="text" id="reservedDateEdit" name="reservedDate"
								class="text-input" title="reservedDate" /></td>
						</tr>
						<tr>
							<td>arrivalDateTime</td>
							<td><input type="text" id="arrivalDateTimeEdit" name="arrivalDateTime"
								class="text-input" title="arrivalDateTime " /></td>
						</tr>
						<tr>
							<td>departureDateTime</td>
							<td><input type="text" id="departureDateTimeEdit" name="departureDateTime"
								class="text-input" title="departureDateTime " /></td>
						</tr>
						<tr>
							<td>allocationDateTime</td>
							<td><input type="text" id="allocationDateTimeEdit" name="allocationDateTime"
								class="text-input" title="password " /></td>
						</tr>
						<tr>
							<td>country</td>
							<td><input type="text" id="countryEdit" name="country"
								class="text-input" title="country " /></td>
						</tr>
						<tr>
							<td>reservationTypeName</td>
							<td><input type="text" id="reservationTypeNameEdit" name="reservationTypeName"
								class="text-input" title="reservationTypeName" /></td>
						</tr>
						
						<tr>
							<td>paymentType</td>
							<td><input type="text" id="paymentTypeEdit"
								name="paymentType" class="text-input" title="paymentType " /></td>
						</tr>
							<tr>
							<td>creditCardType</td>
							<td><input type="text" id="creditCardTypeEdit" name="creditCardType"
								class="text-input" title="creditCardType" /></td>
						</tr>
						<tr>
							<td>creditCardNumber</td>
							<td><input type="text" id="creditCardNumberEdit" name="creditCardNumber"
								class="text-input" title="firstNcreditCardNumberame" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" id="reservedLastNameEdit" name="reservedLastName"
								class="text-input" title="reservedLastName" /></td>
						</tr>

						<tr>
							<td>numberOfAdults</td>
							<td><input type="text" id="numberOfAdultsEdit" name="numberOfAdults"
								class="text-input" title="numberOfAdults" /></td>
						</tr>

						<tr>
							<td>numberOfChildren</td>
							<td><input type="text" id="numberOfChildrenEdit" name="numberOfChildren"
								class="text-input" title="numberOfChildren " /></td>
						</tr>
						<tr>
							<td>numberOfRooms</td>
							<td><input type="text" id="numberOfRoomsEdit" name="numberOfRooms"
								class="text-input" title="numberOfRooms " /></td>
						</tr>
						<tr>
							<td>reservedDate</td>
							<td><input type="text" id="reservedDateEdit" name="reservedDate"
								class="text-input" title="reservedDate" /></td>
						</tr>
						<tr>
							<td>arrivalDateTime</td>
							<td><input type="text" id="arrivalDateTimeEdit" name="arrivalDateTime"
								class="text-input" title="arrivalDateTime " /></td>
						</tr>
						<tr>
							<td>departureDateTime</td>
							<td><input type="text" id="departureDateTimeEdit" name="departureDateTime"
								class="text-input" title="departureDateTime " /></td>
						</tr>
						<tr>
							<td>allocationDateTime</td>
							<td><input type="text" id="allocationDateTimeEdit" name="allocationDateTime"
								class="text-input" title="password " /></td>
						</tr>
						<tr>
							<td>country</td>
							<td><input type="text" id="countryEdit" name="country"
								class="text-input" title="country " /></td>
						</tr>
						<tr>
							<td>reservationTypeName</td>
							<td><input type="text" id="reservationTypeNameEdit" name="reservationTypeName"
								class="text-input" title="reservationTypeName" /></td>
						</tr>
						
						<tr>
							<td>paymentType</td>
							<td><input type="text" id="paymentTypeEdit"
								name="paymentType" class="text-input" title="paymentType " /></td>
						</tr>



						<tr>
							<td>&nbsp;</td>
							<td style="padding-top: 10px;"><input type="button"
								id="edit" value="Save" style="margin-right: 5px;" /> <input
								id="cancelEdit" type="button" value="Cancel" /></td>
						</tr>
						
							<tr>
							<td>departureDateTime</td>
							<td><input type="text" id="departureDateTimeEdit" name="departureDateTime"
								class="text-input" title="departureDateTime " /></td>
						</tr>
						<tr>
							<td>allocationDateTime</td>
							<td><input type="text" id="allocationDateTimeEdit" name="allocationDateTime"
								class="text-input" title="password " /></td>
						</tr>
						<tr>
							<td>country</td>
							<td><input type="text" id="countryEdit" name="country"
								class="text-input" title="country " /></td>
						</tr>
						<tr>
							<td>reservationTypeName</td>
							<td><input type="text" id="reservationTypeNameEdit" name="reservationTypeName"
								class="text-input" title="reservationTypeName" /></td>
						</tr>
						
						<tr>
							<td>paymentType</td>
							<td><input type="text" id="paymentTypeEdit"
								name="paymentType" class="text-input" title="paymentType " /></td>
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
				<form method="post" action="" id=employeeViewForm>
					<table>



						<tr>

							<td colspan="2"><input type="hidden" id="reservationIdView"
								name="reservationId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>title :</td>
							<td><input type="text" id="titleView" name="title"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservedFirstName :</td>
							<td><input type="text" id="reservedFirstNameView" name="reservedFirstName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Last Name :</td>
							<td><input type="text" id="reservedLastNameView" name="reservedLastName"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>numberOfAdults</td>
							<td><input type="text" id="numberOfAdultsView" name="numberOfAdults"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfChildren:</td>
							<td><input type="text" id="numberOfChildrenView" name="numberOfChildren"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfRooms :</td>
							<td><input type="text" id="numberOfRoomsView" name="numberOfRooms"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservedDate:</td>
							<td><input type="text" id="reservedDateView" name="reservedDate"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>arrivalDateTime :</td>
							<td><input type="text" id="arrivalDateTimeView" name="arrivalDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>departureDateTime :</td>
							<td><input type="text" id="departureDateTimeView" name="departureDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>allocationDateTime:</td>
							<td><input type="text" id="allocationDateTimeView" name="allocationDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>country :</td>
							<td><input type="text" id="countryView"
								name="country" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservationTypeName :</td>
							<td><input type="text" id="reservationTypeNameView" name="reservationTypeName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>paymentType :</td>
							<td><input type="text" id="paymentTypeView"
								name="paymentType" class="text-input" readonly="readonly" /></td>
						</tr>
						
						<tr>
							<td>creditCardType :</td>
							<td><input type="text" id="creditCardTypeView" name="creditCardType"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>creditCardNumber :</td>
							<td><input type="text" id="creditCardNumberView" name="creditCardNumber"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Last Name :</td>
							<td><input type="text" id="reservedLastNameView" name="reservedLastName"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>numberOfAdults</td>
							<td><input type="text" id="numberOfAdultsView" name="numberOfAdults"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfChildren:</td>
							<td><input type="text" id="numberOfChildrenView" name="numberOfChildren"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfRooms :</td>
							<td><input type="text" id="numberOfRoomsView" name="numberOfRooms"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservedDate:</td>
							<td><input type="text" id="reservedDateView" name="reservedDate"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>arrivalDateTime :</td>
							<td><input type="text" id="arrivalDateTimeView" name="arrivalDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>departureDateTime :</td>
							<td><input type="text" id="departureDateTimeView" name="departureDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>allocationDateTime:</td>
							<td><input type="text" id="allocationDateTimeView" name="allocationDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>country :</td>
							<td><input type="text" id="countryView"
								name="country" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservationTypeName :</td>
							<td><input type="text" id="reservationTypeNameView" name="reservationTypeName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>paymentType :</td>
							<td><input type="text" id="paymentTypeView"
								name="paymentType" class="text-input" readonly="readonly" /></td>
						</tr>
							<tr>
							<td>allocationDateTime:</td>
							<td><input type="text" id="allocationDateTimeView" name="allocationDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>country :</td>
							<td><input type="text" id="countryView"
								name="country" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservationTypeName :</td>
							<td><input type="text" id="reservationTypeNameView" name="reservationTypeName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>paymentType :</td>
							<td><input type="text" id="paymentTypeView"
								name="paymentType" class="text-input" readonly="readonly" /></td>
						</tr>
						
						<tr>
							<td style="padding-top: 10px;" align="center" colspan="1"><input
								id="closeView" type="button" value="Close" /></td>
						</tr>
						<tr>
							<td>title :</td>
							<td><input type="text" id="titleView" name="title"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservedFirstName :</td>
							<td><input type="text" id="reservedFirstNameView" name="reservedFirstName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Last Name :</td>
							<td><input type="text" id="reservedLastNameView" name="reservedLastName"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>numberOfAdults</td>
							<td><input type="text" id="numberOfAdultsView" name="numberOfAdults"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfChildren:</td>
							<td><input type="text" id="numberOfChildrenView" name="numberOfChildren"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>numberOfRooms :</td>
							<td><input type="text" id="numberOfRoomsView" name="numberOfRooms"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservedDate:</td>
							<td><input type="text" id="reservedDateView" name="reservedDate"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>arrivalDateTime :</td>
							<td><input type="text" id="arrivalDateTimeView" name="arrivalDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>departureDateTime :</td>
							<td><input type="text" id="departureDateTimeView" name="departureDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>allocationDateTime:</td>
							<td><input type="text" id="allocationDateTimeView" name="allocationDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>country :</td>
							<td><input type="text" id="countryView"
								name="country" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservationTypeName :</td>
							<td><input type="text" id="reservationTypeNameView" name="reservationTypeName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>paymentType :</td>
							<td><input type="text" id="paymentTypeView"
								name="paymentType" class="text-input" readonly="readonly" /></td>
						</tr>
							<tr>
							<td>allocationDateTime:</td>
							<td><input type="text" id="allocationDateTimeView" name="allocationDateTime"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>country :</td>
							<td><input type="text" id="countryView"
								name="country" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>reservationTypeName :</td>
							<td><input type="text" id="reservationTypeNameView" name="reservationTypeName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>paymentType :</td>
							<td><input type="text" id="paymentTypeView"
								name="paymentType" class="text-input" readonly="readonly" /></td>
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