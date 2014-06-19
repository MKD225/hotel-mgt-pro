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
		
		
		// save row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#ExternaldriverForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#ExternaldriverForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/externaldriver/ajxAddOrUpdate',
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

		

		

		$('#ExternaldriverForm').jqxValidator({
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
		$("#externalDriverId").val('');
		$("#name").val('');
		$("#licenceNo").val('');
		$("#address").val('');
		$("#emailAddress").val('');
		$("#telephoneNumber").val('');
		
		
		$('#ExternaldriverForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="ExternaldriverForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>External Driver</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="externalDriverId" name="externalDriverId" readonly="readonly" /></td>
			</tr>
			
			<tr>
				<td>Name</td>
				<td><input type="text" id="name" name="name"
					class="text-input" title="name" /></td>
			</tr>
			<tr>
				<td>Licence No</td>
				<td><input type="text" id="licenceNo" name="licenceNo"
					class="text-input" title="licenceNo" /></td>
			</tr>

			
			<tr>
				<td>Mail Address</td>
				<td><input type="text" id="address" name="address"
					class="text-input" title="address " /></td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAddress"
					name="emailAddress" class="text-input" title="emailAddress " /></td>
			</tr>
			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber" name="telephoneNumber"
					class="text-input" title="telephoneNumber" /></td>
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