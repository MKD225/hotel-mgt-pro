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
			var onSuccess = $('#membershipTypeForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#membershipTypeForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/roomtype/ajxAddOrUpdate',
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
			cancelButton : $("#cancelDelete"),
			modalOpacity : 0.5,
			showAnimationDuration : 500,
			animationType : 'fade'
		});
		
		// Prepare the data
		var url = "/hotel/roomtype/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'roomTypeId',
				type : 'int'
			}, {
				name : 'a_c',
				type : 'String'
			}, {

				name : 'description',
				type : 'String'
			}, {
				name : 'roomRate',
				type : 'String'
			}, {
				name : 'roomTypeName',
				type : 'String'
			}, {

				name : 'view',
				type : 'String'

			} ],
			id : 'roomTypeId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid({
			width : '60%',
			source : dataAdapter,
			theme : theme,
			autoheight : true,
			columns : [ {
				text : 'Name',
				datafield : 'roomTypeName',
				align : 'left',
				width: '15%',
			}, {
				text : 'a_c',
				datafield : 'a_c',
				align : 'left'
			}, {
				
				text : 'Rate',
				datafield : 'roomRate',
				align : 'left'
			},{
				text : 'View',
				datafield : 'view',
				align : 'left'
			}, {
					text : 'Description',
					datafield : 'description',
					align : 'left'
				

			}, {
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
					$("#roomTypeIdEdit").val(dataRecord.roomTypeId);
					$("#roomTypeNameEdit").val(dataRecord.roomTypeName);
					$("#a_cEdite").val(dataRecord.a_c);
					$("#viewEdit").val(dataRecord.view);
					$("#roomRateEdit").val(dataRecord.roomRate);
					$("#descriptionEdit").val(dataRecord.description);
					
					$("#popupEdit").jqxWindow('open');
				}
			}, {
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
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					$("#roomTypeIdDelete").val(dataRecord.roomTypeId);
					$("#a_cDelete").val(dataRecord.a_c);
					$("#descriptionDelete").val(dataRecord.description);
					$("#roomRateDelete").val(dataRecord.roomRate);
					$("#roomTypeNameDelete").val(dataRecord.roomTypeName);
					$("#viewDelete").val(dataRecord.view);

					$("#popupDelete").jqxWindow('open');
				}
			} ]
		});

		$('#membershipTypeForm').jqxValidator({
			rules : [ {
				input : '#roomTypeName',
				message : 'Membership Type is required!',
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
			var formInput = $("#membershipTypeDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/roomtype/ajxDelete',
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
	}
		
	$("#edit").jqxButton({
		width : "100px",
		theme : theme
	});
	// delete row when the user clicks the 'Edit' button.
	$("#edit").click(function() {
		//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
		//             if (onSuccess) {
		var formInput = $("#agentEditForm").serialize();
		$.ajax({
			type : 'post',
			url : '/hotel/roomType/ajxAddOrUpdate',
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

	function clearText() {
		$("#membershipTypeId").val('');
		$("#membershipType").val('');
		$('#membershipTypeForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="membershipTypeForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Room Type</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="roomTypeId" name="roomTypeId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Name</td>
				<td><input type="text" id="roomTypeName" name="roomTypeName"
					class="text-input" title="roomTypeName " /></td>
			</tr>
			<tr>
				<td>A/C</td>
				<td><input type="text" id="a_c" name="a_c" class="text-input"
					title="a_c " /></td>
			</tr>

			
			<tr>
				<td>Room Rate</td>
				<td><input type="text" id="roomRate" name="roomRate"
					class="text-input" title="roomRate" /></td>
			</tr>
			
			<tr>
				<td>View</td>
				<td><input type="text" id="view" name="view" class="text-input"
					title="view " /></td>
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

<div id="popupDelete">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="membershipTypeDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Room Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">&nbsp;<input type="hidden"
						id="roomTypeIdDelete" name="roomTypeId" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>A/C</td>
					<td><input type="text" id="a_cDelete" name="a_c"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Description</td>
					<td><input type="text" id="descriptionDelete"
						name="description" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room Rate</td>
					<td><input type="text" id="roomRateDelete" name="roomRate"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room Type Name</td>
					<td><input type="text" id="roomTypeNameDelete"
						name="roomTypeName" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>View</td>
					<td><input type="text" id="viewDelete" name="view"
						class="text-input" readonly="readonly" /></td>
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
		<form method="post" action="" id="membershipTypeDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Room Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2" align="center">&nbsp;<input type="hidden"
						id="roomTypeIdDelete" name="roomTypeId" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>A/C</td>
					<td><input type="text" id="a_cDelete" name="a_c"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Description</td>
					<td><input type="text" id="descriptionDelete"
						name="description" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room Rate</td>
					<td><input type="text" id="roomRateDelete" name="roomRate"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room Type Name</td>
					<td><input type="text" id="roomTypeNameDelete"
						name="roomTypeName" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>View</td>
					<td><input type="text" id="viewDelete" name="view"
						class="text-input" readonly="readonly" /></td>
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