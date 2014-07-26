<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');
		
		$('.text-area').jqxInput({
        	width: 250,
        	height: 50,
            theme: theme
        });
	 
        $('.text-area').addClass('jqx-rc-all');
        
        var date = new Date();
        date.setFullYear(2000, 0, 1);
        $('#reservedDate').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
        
        $("#arrivalDateTime").jqxDateTimeInput({ width: '300px', height: '25px', theme: theme, formatString: 'F' });
        $("#departureDateTime").jqxDateTimeInput({ width: '300px', height: '25px', theme: theme, formatString: 'F' });
        $("#allocationDateTime").jqxDateTimeInput({ width: '300px', height: '25px', theme: theme, formatString: 'F' });
        

		$("#save").jqxButton({
			width : "100px",
			theme : theme
		});
		$("#clear").jqxButton({
			width : "100px",
			theme : theme
		});
		
		var url = "/hotel/pages/sampleData/memberTitles.txt";
		// prepare the data
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'memberTitle'
			} ],
			url : url,
			async : false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create a jqxDropDownList
		$("#title").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapter,
			displayMember : "memberTitle",
			valueMember : "memberTitle",
			promptText : "Select title...",
			autoDropDownHeight : true,
			width : 150,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/pages/sampleData/country.txt";
		// prepare the data
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'name'
			} ],
			url : url,
			async : false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		// Create a jqxComboBox
		$("#country").jqxComboBox({
			selectedIndex : -1,
			source : dataAdapter,
			displayMember : "name",
			valueMember : "name",
			promptText : "Select country...",
			autoComplete : true,
			width : 210,
			height : 25,
			theme : theme
		});

		var url = "/hotel/employee/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'employeeId'
			}, {
				name : 'firstName'
			} ],
			id : 'employeeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#internalArrivalDriverConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "employeeId",
			promptText : "Select arrival driver...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/employee/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'employeeId'
			}, {
				name : 'firstName'
			} ],
			id : 'employeeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#internalDepartureDriverConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "employeeId",
			promptText : "Select departure driver...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/employee/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'employeeId'
			}, {
				name : 'firstName'
			} ],
			id : 'employeeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#guestAssistantConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "employeeId",
			promptText : "Select guest asistant...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/externaldriver/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'externalDriverId'
			}, {
				name : 'name'
			} ],
			id : 'employeeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#externalArravalDriverConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "name",
			valueMember : "externalDriverId",
			promptText : "Select arrival driver...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/externaldriver/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'externalDriverId'
			}, {
				name : 'name'
			} ],
			id : 'externalDriverId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#externalDepartureDriverConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "name",
			valueMember : "externalDriverId",
			promptText : "Select departure driver...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/resevationtype/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'resevationTypeId'
			}, {
				name : 'reservationTypeName'
			} ],
			id : 'resevationTypeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#resevationtypeConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "reservationTypeName",
			valueMember : "resevationTypeId",
			promptText : "Select reservation type...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/agent/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'agentId'
			}, {
				name : 'firstName'
			} ],
			id : 'agentId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#agentConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "agentId",
			promptText : "Select agent name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/creditcardtype/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'creditCardTypeId'
			}, {
				name : 'creditCardType'
			} ],
			id : 'creditCardTypeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#creditCardTypeConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "creditCardType",
			valueMember : "creditCardTypeId",
			promptText : "Select credit card type...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/discount/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'discounttId'
			}, {
				name : 'type'
			} ],
			id : 'discounttId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#discountConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "type",
			valueMember : "discounttId",
			promptText : "Select discount type...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#reservationForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#reservationForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/reservation/ajxAddOrUpdate',
					data : formInput,
				// 					success : function(data) {
				// 						var dataAdapter = new $.jqx.dataAdapter(source);
				// 						$("#jqxgrid").jqxGrid({
				// 							source : dataAdapter
				// 						});
				// 					}
				});
				clearText();
			}
		});

		$("#clear").click(function() {
			clearText();
		});

		$('#reservationForm').jqxValidator({
			rules : [ {
				input : '#reservedFirstName',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#title").val('');
		$("#reservedFirstName").val('');
		$("#reservedLastName").val('');
		$("#numberOfAdults").val('');
		$("#numberOfChildren").val('');
		$("#numberOfRooms").val('');
		$("#reservedDate").val('');
		$("#arrivalDateTime").val('');
		$("#departureDateTime").val('');
		$("#allocationDateTime").val('');
		$("#country").val('');
		$("#resevationtypeConvert").val('');
		$("#paymentType").val('');
		$("#creditCardTypeConvert").val('');		
		$("#creditCardNumber").val('');
		$("#agentConvert").val('');
		$("#remarks").val('');
		$("#status").val('');
		$("#telephoneNumber").val('');
		$("#emailAddress").val('');
		$("#passportNumber").val('');
		$("#flightnumber").val('');
		$("#pickUpTime").val('');
		$("#internalArrivalDriverConvert").val('');
		$("#externalArravalDriverConvert").val('');
		$("#internalDepartureDriverConvert").val('');
		$("#externalDepartureDriverConvert").val('');
		$("#guestConvert").val('');	
		$("#guestAssistantConvert").val('');
		$("#discountConvert").val('');
		
		$('#reservationForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="reservationForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Reservation</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="reservationId" name="reservationId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Title</td>
				<td>
					<div id='title'></div>
				</td>
			</tr>

			<tr>
				<td>First Name</td>
				<td><input type="text" id="reservedFirstName"
					name="reservedFirstName" class="text-input"
					title="reservedFirstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="reservedLastName"
					name="reservedLastName" class="text-input" title="reservedLastName" /></td>
			</tr>

			<tr>
				<td>Number Of Adults</td>
				<td>
					<div id='numberOfAdults'></div>
				</td>
			</tr>

			<tr>
				<td>Number Of Children</td>
				<td>
					<div id='numberOfChildren'></div>
				</td>
			</tr>

			<tr>
				<td>Number Of Rooms</td>
				<td>
					<div id='numberOfRooms'></div>
				</td>
			</tr>

			<tr>
				<td>Reserved Date</td>
				<td>
					<div id='reservedDate'></div>
				</td>
			</tr>

			<tr>
				<td>Arrival Date Time</td>
				<td>
					<div id='arrivalDateTime'></div>
				</td>
			</tr>

			<tr>
				<td>Departure Date Time</td>
				<td>
					<div id='departureDateTime'></div>
				</td>
			</tr>

			<tr>
				<td>Allocation Date Time</td>
				<td>
					<div id='allocationDateTime'></div>
				</td>
			</tr>
			
			<tr>
				<td>Country</td>
				<td>
					<div id='country'></div>
				</td>
			</tr>

			<tr>
				<td>Reservation Type</td>
				<td>
					<div id='resevationtypeConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Payment Type</td>
				<td>
					<div id='paymentType'></div>
				</td>
			</tr>

			<tr>
				<td>Credit Card Type</td>
				<td>
					<div id='creditCardTypeConvert'></div>
				</td>
			</tr>


			<tr>
				<td>Credit Card Number</td>
				<td><input type="text" id="creditCardNumber"
					name="creditCardNumber" class="text-input"
					title="creditCardNumber " /></td>
			</tr>

			<tr>
				<td>Agent</td>
				<td>
					<div id='agentConvert'></div>
				</td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><textarea id="remarks" name="remarks" class="text-area"></textarea></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status" /></td>
			</tr>

			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber" /></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress " /></td>
			</tr>
			
			<tr>
				<td>Passport Number</td>
				<td><input type="text" id="passportNumber"
					name="passportNumber" class="text-input" title="passportNumber " /></td>
			</tr>

			<tr>
				<td>Flight Number</td>
				<td><input type="text" id="flightnumber" name="flightnumber"
					class="text-input" title="flightnumber " /></td>
			</tr>

			<tr>
				<td>Pick Up Time</td>
				<td>
					<div id='pickUpTime'></div>
				</td>
			</tr>

			<tr>
				<td>Internal Arrival Driver</td>
				<td>
					<div id='internalArrivalDriverConvert'></div>
				</td>
			</tr>

			<tr>
				<td>External Arrival Driver</td>
				<td>
					<div id='externalArravalDriverConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Internal Departure Driver</td>
				<td>
					<div id='internalDepartureDriverConvert'></div>
				</td>
			</tr>

			<tr>
				<td>External Departure Driver</td>
				<td>
					<div id='externalDepartureDriverConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Guest</td>
				<td>
					<div id='guestConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Guest Assistant</td>
				<td>
					<div id='guestAssistantConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Discount</td>
				<td>
					<div id='discountConvert'></div>
				</td>
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