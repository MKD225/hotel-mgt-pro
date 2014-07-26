<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$("#allocateDateTime").jqxDateTimeInput({
			width : '300px',
			height : '25px',
			theme : theme,
			formatString : 'F'
		});
		$("#deallocateDateTime").jqxDateTimeInput({
			width : '300px',
			height : '25px',
			theme : theme,
			formatString : 'F'
		});

		$("#save").jqxButton({
			width : "100px",
			theme : theme
		});
		$("#clear").jqxButton({
			width : "100px",
			theme : theme
		});

		var url = "/hotel/pages/sampleData/extrabeds.txt";
		// prepare the data
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'numberOfBeds'
			} ],
			url : url,
			async : false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create a jqxDropDownList
		$("#extraBeds").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapter,
			displayMember : "numberOfBeds",
			valueMember : "numberOfBeds",
			promptText : "Select number of beds...",
			autoDropDownHeight : true,
			width : 150,
			height : 25,
			theme : theme
		});

		var url = "/hotel/room/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'roomId'
			}, {
				name : 'roomNumber'
			} ],
			id : 'roomId',
			url : url
		};
		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#roomConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "roomNumber",
			valueMember : "roomId",
			promptText : "Select room...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		var url = "/hotel/reservation/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'reservationId'
			}, {
				name : 'reservedFirstName'
			} ],
			id : 'reservationId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#reservationConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "reservationId",
			valueMember : "reservationId",
			promptText : "Select reservation...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		var url = "/hotel/guest/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'guestId'
			}, {
				name : 'firstName'
			} ],
			id : 'guestId',
			url : url
		};
		//
		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#guestConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "guestId",
			promptText : "Select Guest Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		//

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = true;
			if (onSuccess) {
				var formInput = $("#allocationroomForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/allocationroom/ajxAddOrUpdate',
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

		$('#allocationroomForm').jqxValidator({
			rules : [ {
				input : '#extraBeds',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#roomConvert").val('');
		$("#guestConvert").val('');
		$("#reservationConvert").val('');
		$("#allocateDateTime").val('');
		$("#deallocateDateTime").val('');
		$("#extraBeds").val('');

		$("#status").val('');

		$('#allocationroomForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="allocationroomForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Allocate room</b></td>
			</tr>

			<tr>
				<td>Room</td>
				<td>
					<div id='roomConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Reservation</td>
				<td>
					<div id='reservationConvert'></div>
				</td>
			</tr>
			<tr>
				<td>Guest</td>
				<td>
					<div id='guestConvert'></div>
				</td>
			</tr>

			<tr>
				<td>allocateDateTime:</td>
				<td>
					<div id="allocateDateTime"></div>
				</td>
			</tr>
			<tr>
				<td>deallocateDateTime:</td>
				<td>
					<div id="deallocateDateTime"></div>
				</td>
			</tr>
			<tr>
				<td>extraBeds:</td>
				<td>
					<div id="extraBeds"></div>
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