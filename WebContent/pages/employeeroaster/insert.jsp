<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {
	
		$('.text-area').jqxInput({
        	width: 250,
        	height: 50,
            theme: theme
        });
	 
        $('.text-area').addClass('jqx-rc-all');

        var date = new Date();
        date.setFullYear(2000, 0, 1);
        $('#roasterDate').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
        
        var date = new Date();
        date.setFullYear(2000, 0, 1);
        $('#assignDate').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
        
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
			}, {
				name : 'lastName'
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
			promptText : "Employee Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		var url = "/hotel/shift/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'shiftId'
			}, {
				name : 'shiftName'
			} ],
			id : 'shiftId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#shiftConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "shiftName",
			valueMember : "shiftId",
			promptText : "Shift Type Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});
	

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#employeeroasterForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#employeeroasterForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/employeeroaster/ajxAddOrUpdate',
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

		$('#employeeroasterForm').jqxValidator({
			rules : [ {
				input : '#remarks',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#employeeRosterId").val('');
		$("#employeeConvert").val('');
		$("#shiftConvert").val('');
		$("#roasterDate").val('');
		$("#assignDate").val('');
		$("#remarks").val('');
		
		$('#employeeroasterForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="employeeroasterForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Employee Roaster</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="employeeRosterId" name="employeeRosterId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Employee</td>
				<td>
					<div id='employeeConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Shift</td>
				<td>
					<div id='shiftConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Roaster Date</td>
				<td>
					<div id='roasterDate'></div>
				</td>
			</tr>

			<tr>
				<td>Assign Date</td>
				<td>
					<div id='assignDate'></div>
				</td>
			</tr>

			<tr>
				<td>Remarks</td>
				<td><textarea id="remarks" name="remarks" class="text-area"></textarea></td>

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