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

		// update the edited row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#creditCardTypeForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#creditCardTypeForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/creditcardtype/ajxAddOrUpdate',
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

		$("#popupDelete").jqxWindow({
			width : 400,
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelDelete"),
			modalOpacity : 0.5,
			showAnimationDuration : 500,
			animationType : 'fade'
		});

		$("#popupEdit").jqxWindow({
			width : 400,
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelEdit"),
			modalOpacity : 0.5,
			showAnimationDuration : 500,
			animationType : 'fade'
		});
		// Prepare the data
		var url = "/hotel/creditcardtype/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'creditCardTypeId',
				type : 'int'
			}, {
				name : 'creditCardType',
				type : 'String'
			
			
			} ],
			id : 'creditCardTypeId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '58%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [

							{
								text : 'Credit Card Type',
								datafield : 'creditCardType',
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
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									$("#creditCardTypeIdEdit").val(
											dataRecord.creditCardTypeId);
									$("#creditCardTypeEdit").val(
											dataRecord.creditCardType);
									
									$("#popupEdit").jqxWindow('open');
								}
							},
							{
								text : 'Delete',
								datafield : 'Delete',
								columntype : 'button',
								width : 100,
								align : 'center',
								cellsrenderer : function() {
									return "Delete";
								},
								buttonclick : function(row) {
									//get the clicked row's data and initialize the input fields.
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									$("#creditCardTypeIdDelete").val(
											dataRecord.creditCardTypeId);
									$("#creditCardTypeDelete").val(
											dataRecord.creditCardType);
									
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

		$('#creditCardTypeForm').jqxValidator({
			rules : [ {
				input : '#creditCardType',
				message : 'Credit Card Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

		$("#cancelDelete").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelDelete").click(function() {
			$("#popupDelete").jqxWindow('hide');
		});

		$("#delete").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelEdit").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelEdit").click(function() {
			$("#popupEdit").jqxWindow('hide');
		});

		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});

		// delete row when the user clicks the 'Delete' button.
		$("#delete").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#creditCardTypeDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/creditcardtype/ajxDelete',
				data : formInput,
				success : function(data) {
					var dataAdapter = new $.jqx.dataAdapter(source);
					$("#jqxgrid").jqxGrid({
						source : dataAdapter
					});
				}
			});
			$("#popupDelete").jqxWindow('hide');
		});

		clearText();

		// delete row when the user clicks the 'Edit' button.
		$("#edit").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#creditCardTypeEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/creditcardtype/ajxAddOrUpdate',
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

		clearText();
	}

	function clearText() {
		$("#creditCardTypeId").val('');
		$("#creditCardType").val('');
		
		$('#creditCardTypeForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="creditCardTypeForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Credit Card Type</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="creditCardTypeId" name="creditCardTypeId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Credit Card Type</td>
				<td><input type="text" id="creditCardType"
					name="creditCardType" class="text-input"
					title="creditCardType" /></td>
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

<div id="popupDelete">
	<div>Delete Credit Card Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="creditCardTypeDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Credit Card Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden"
						id="creditCardTypeIdDelete" name="creditCardTypeId"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Credit Card Type</td>
					<td><input type="text" id="descriptionDelete"
						name="description" class="text-input" readonly="readonly" /></td>
				</tr>
				

				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="delete"
						value="Delete" /><input id="cancelDelete" type="button"
						value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>

<div id="popupEdit">
	<div>Delete Credit Card Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="creditCardTypeEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Edit</b> following <b>Credit Card
							Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden" id="creditCardTypeIdEdit"
						name="creditCardTypeIdId" /></td>
				</tr>
				<tr>
					<td>Credit Card Type</td>
					<td><input type="text" id="creditCardTypeEdit" name="creditCardType"
						class="text-input" /></td>
				</tr>
				

				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="edit" value="Edit" /><input
						id="cancelEdit" type="button" value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>
