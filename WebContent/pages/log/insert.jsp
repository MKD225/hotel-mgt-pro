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

		$("#time").jqxDateTimeInput({
			width : '220px',
			height : '25px',
			formatString : 'T',
			showCalendarButton : false,
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
			promptText : "Employee Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
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
		$("#actionClass").jqxDropDownList({
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

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#logForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#logForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/log/ajxAddOrUpdate',
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

		$('#logForm').jqxValidator({
			rules : [ {
				input : '#actionMethod',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#logId").val('');
		$("#actionClass").val('');
		$("#actionMethod").val('');
		$("#objectAttributes").val('');
		$("#employeeConvert").val('');
		$("#time").val('');

		$('#logForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="logForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Employee</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="logId" name="logId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Action Class</td>
				<td>
					<div id='actionClass'></div>
				</td>
			</tr>

			<tr>
				<td>Action Method</td>
				<td><input type="text" id="actionMethod" name="actionMethod"
					class="text-input" title="actionMethod" /></td>
			</tr>
			<tr>
				<td>Object Attributes</td>
				<td><input type="text" id="objectAttributes"
					name="objectAttributes" class="text-input" title="objectAttributes" /></td>
			</tr>

			<tr>
				<td>Employee</td>
				<td>
					<div id='employeeConvert'></div>
				</td>
			</tr>
			<tr>
				<td>Time</td>
				<td>
					<div id='time'></div>
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