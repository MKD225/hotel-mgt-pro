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

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = true;
			;
			if (onSuccess) {
				var formInput = $("#departmentForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/department/ajxAddOrUpdate',
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

		$('#departmentForm').jqxValidator({
			rules : [ {
				input : '#name',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});
	}

	function clearText() {
		$("#departmentId").val('');
		$("#departmentCode").val('');
		$("#departmentName").val('');
		$("#telephoneNumber").val('');
		$("#employeeConvert").val('');

		$('#departmentForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="departmentForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>External Driver</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="departmentIdEdit" name="departmentId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Department Code</td>
				<td><input type="text" id="departmentCode"
					name="departmentCode" class="text-input" title="departmentCode" /></td>
			</tr>
			<tr>
				<td>Department Name</td>
				<td><input type="text" id="departmentName"
					name="departmentName" class="text-input" title="departmentName" /></td>
			</tr>
			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber" /></td>
			</tr>

			<tr>
				<td>Manager</td>
				<td><div id="employeeConvert"></div></td>
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