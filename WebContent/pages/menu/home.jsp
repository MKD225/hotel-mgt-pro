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
        	width: '207px',
        	height: '50px',
            theme: theme
        });
	 
        $('.text-area').addClass('jqx-rc-all');
        

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
			var onSuccess = $('#menuForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#menuForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/menu/ajxAddOrUpdate',
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
		var url = "/hotel/menu/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'menuId',
				type : 'int'
			}, {
				name : 'name',
				type : 'String'
			}, {
				
				name : 'action',
				type : 'String'
			}, {
				name : 'description',
				type : 'String'
			
				
			} ],
			id : 'menuId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '61%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [
							
							{
								text : 'Name',
								datafield : 'name',
								align : 'left'
							},
							{
								text : 'Action',
								datafield : 'action',
								align : 'left'
							
							},
							{
								text : 'Description',
								datafield : 'description',
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
									var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
									$("#menuIdEdit").val(
											dataRecord.menuId);
									$("#nameEdit").val(
											dataRecord.name);
									$("#actionEdit").val(
											dataRecord.action);
									$("#descriptionEdit").val(
											dataRecord.description);
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
									$("#menuIdDelete").val(
											dataRecord.menuId);
									$("#nameDelete").val(
											dataRecord.name);
									$("#actionDelete").val(
											dataRecord.action);
									$("#descriptionDelete").val(
											dataRecord.description);
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

		$('#menuForm').jqxValidator({
			rules : [ {
				input : '#name',
				message : 'Name is required!',
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
		
		 $("#cancelEdit").jqxButton({
				width : "100px",
				theme : theme
			});

			$("#cancelEdit").click(function() {
				$("#popupEdit").jqxWindow('hide');
			});


		$("#delete").jqxButton({
			width : "100px",
			theme : theme
		});
		// delete row when the user clicks the 'Delete' button.
		$("#delete").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#menuDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/menu/ajxDelete',
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
	
		
	$("#edit").jqxButton({
		width : "100px",
		theme : theme
	});
	// delete row when the user clicks the 'Edit' button.
	$("#edit").click(function() {
		//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
		//             if (onSuccess) {
		var formInput = $("#menuEditForm").serialize();
		$.ajax({
			type : 'post',
			url : '/hotel/menu/ajxAddOrUpdate',
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
		$("#menuId").val('');
		$("#name").val('');
		$("#action").val('');
		$("#description").val('');
		$('#menuForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="menuForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>New Menu Item</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="menuId" name="menuId" readonly="readonly" /></td>
			</tr>
			
			<tr>
				<td> Menu Name</td>
				<td><input type="text" id="name" name="name"
					class="text-input" title="name" /></td>
			</tr>

			<tr>
				<td> Action</td>
				<td><input type="text" id="action" name="action"
					class="text-input" title="action " /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><textarea id="description" name="description" class="text-area" ></textarea></td>
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
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="menuDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				
				<tr>
				<td colspan="2"><input type="hidden"
					id="menuIdDelete" name="menuId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Menu Name</td>
				<td><input type="text" id="nameDelete" name="name"
					class="text-input" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Action</td>
				<td><input type="text" id="actionDelete" name="action"
					class="text-input" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Description</td>
				<td><textarea id="descriptionDelete" name="description" class="text-area" readonly="readonly"></textarea></td>
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
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="menuEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Edit</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				
				<tr>
				<td colspan="2"><input type="hidden"
					id="menuIdEdit" name="menuId" /></td>
			</tr>
			<tr>
				<td>Menu Name</td>
				<td><input type="text" id="nameEdit" name="name"
					class="text-input"/></td>
			</tr>
			<tr>
				<td>Action</td>
				<td><input type="text" id="actionEdit" name="action"
					class="text-input"  /></td>
			</tr>

			<tr>
				<td>Description</td>
				<td><textarea id="descriptionEdit" name="description" class="text-area"></textarea></td>
			</tr>
			
				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="edit"
						value="Edit" /><input id="cancelEdit" type="button"
						value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>
