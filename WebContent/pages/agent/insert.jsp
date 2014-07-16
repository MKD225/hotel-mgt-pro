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

		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#agentForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#agentForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/agent/ajxAddOrUpdate',
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

		$('#agentForm').jqxValidator({
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
		$("#title").val('');
		$("#firstName").val('');
		$("#lastName").val('');
		$("#country").val('');
		$("#emailAddress").val('');
		$("#telephoneNumber").val('');
		$("#permitNumber").val('');
		$("#remarks").val('');
		$("#status").val('');

		$('#agentForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="agentForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Agent</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="agentId" name="agentId" readonly="readonly" /></td>
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
				<td>Country:</td>
				<td>
					<div id="country"></div>
				</td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress " /></td>
			</tr>
			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber " /></td>
			</tr>
			<tr>
				<td>Permit Number</td>
				<td><input type="text" id="permitNumber" name="permitNumber"
					class="text-input" title="permitNumber" /></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks " /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status " /></td>
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