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

		var url = "/hotel/department/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'departmentId'
			}, {
				name : 'departmentName'
			} ],
			id : 'departmentId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#departmentConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "departmentName",
			valueMember : "departmentId",
			promptText : "Department Name...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		var url = "/hotel/privilege/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'privilegeId'
			}, {
				name : 'privilegeType'
			} ],
			id : 'privilegeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#privilegeConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "privilegeType",
			valueMember : "privilegeId",
			promptText : "Privileage Type Name...",
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

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#employeeForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#employeeForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/employee/ajxAddOrUpdate',
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

		$('#employeeForm').jqxValidator({
			rules : [ {
				input : '#firstName',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#email").val('');
		$("#firstName").val('');
		$("#lastName").val('');
		$("#departmentConvert").val('');
		$("#email").val('');
		$("#mobile").val('');
		$("#home").val('');
		$("#nicNumber").val('');
		$("#password").val('');
		$("#userName").val('');
		$("#privilege").val('');
		$("#address").val('');
		$("#description").val('');
		$('#employeeForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="employeeForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Employee</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="employeeId" name="employeeId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Title</td>
				<td>
					<div id='title'></div>
				</td>
			</tr>

			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName" /></td>
			</tr>

			<tr>
				<td>Department</td>
				<td>
					<div id='departmentConvert'></div>
				</td>
			</tr>

			<tr>
				<td>Email Address</td>
				<td><input type="text" id="email" name="email"
					class="text-input" title="email " /></td>
			</tr>
			<tr>
				<td>Mobile Number</td>
				<td><input type="text" id="mobile" name="mobile"
					class="text-input" title="mobile " /></td>
			</tr>
			<tr>
				<td>Land Number</td>
				<td><input type="text" id="home" name="home" class="text-input"
					title="home" /></td>
			</tr>

			<tr>
				<td>Address</td>
				<td><input type="text" id="address" name="address"
					class="text-input" title="address" /></td>
			</tr>
			<tr>
				<td>NIC Number</td>
				<td><input type="text" id="nicNumber" name="nicNumber"
					class="text-input" title="nicNumber " /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" id="password" name="password"
					class="text-input" title="password " /></td>
			</tr>
			<tr>
				<td>User Name</td>
				<td><input type="text" id="userName" name="userName"
					class="text-input" title="userName " /></td>
			</tr>
			<tr>
				<td>Privilege</td>
				<td>
					<div id='privilegeConvert'></div>
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