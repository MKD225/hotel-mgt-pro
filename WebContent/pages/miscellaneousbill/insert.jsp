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

		$("#employeeConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",
			valueMember : "employeeId",
			promptText : "Manager Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
		
var url = "/hotel/room/ajxSearch";
        
        var sourceType = {
            datatype: "json",
            datafields: [{
                name: 'roomId'
            }, {
                name: 'roomNumber'
            }],
            id: 'roomId',
            url: url
        };
        
        var dataAdapterType = new $.jqx.dataAdapter(sourceType);
        
        $("#roomConvert").jqxDropDownList({
            selectedIndex: -1,
            source: dataAdapterType,
            displayMember: "roomNumber",
            valueMember: "roomId",
            promptText: "Room Number...",
            autoDropDownHeight: true,
            width: 250,
            height: 25,
            theme: theme
        });


		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#miscellaneousBillForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#miscellaneousBillForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/miscellaneousbill/ajxAddOrUpdate',
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

		$('#miscellaneousBillForm').jqxValidator({
			rules : [ {
				input : '#amount',
				message : 'Amount required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#miscellaneousBillId").val('');
		$("#employeeConvert").val('');
		$("#roomConvert").val('');
		$("#reservationId").val('');
		$("#amount").val('');
		$("#dateTime").val('');
		$("#description").val('');
		
		$('#miscellaneousBillForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="miscellaneousBillForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Employee</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="miscellaneousBillId" name="miscellaneousBillId"
					readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Employee</td>
				<td>
					<div id='employeeConvert'></div>
				</td>
			</tr>
			<tr>
				<td>Room Number</td>
				<td>
					<div id='roomConvert'></div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="reservationId" name="reservationId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Amount</td>
				<td><input type="text" id="amount" name="amount"
					class="text-input" title="amount" /></td>
			</tr>

			<tr>
				<td>Date</td>
				<td>
					<div id='dateTime'></div>
				</td>
			</tr>

			<tr>
				<td>Description</td>
				<td><input type="text" id="description" name="description"
					class="text-input" title="description " /></td>
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