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
			var onSuccess = $('#roomForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#roomForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/room/ajxAddOrUpdate',
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
			width : '75%',
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#cancelEdit"),
			showAnimationDuration : 1000,
			modalOpacity : 0.45
		});

		var url = "/hotel/roomtype/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'roomTypeId'
			}, {
				name : 'roomTypeName'
			} ],
			id : 'roomTypeId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#roomtypeConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "roomTypeName",
			valueMember : "roomTypeId",
			promptText : "Room Type Number...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		// Prepare the data
		var url = "/hotel/room/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {

				name : 'roomId',
				type : 'String'
			}, {
				name : 'roomNumber',
				type : 'String'
			}, {
				name : 'roomTypeName',
				type : 'String',
				map : 'roomtype>roomTypeName'
			}, {
				name : 'description',
				type : 'String'
			}, {

				name : 'status',
				type : 'String'
			}, {
				name : 'telephoneNumber',
				type : 'String'

			} ],
			id : 'roomId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '50%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [
							{
								text : 'roomNumber',
								datafield : 'roomNumber',
								align : 'left'

							},

							{
								text : 'Room Type',
								datafield : 'roomTypeName',
								align : 'left',

							},
							{
								text : 'Description',
								datafield : 'description',
								align : 'left'
							},
							{
								text : 'status',
								datafield : 'status',
								align : 'left'
							},
							{
								text : 'Telephone Number',
								datafield : 'telephoneNumber',
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
									$("#roomIdEdit").val(dataRecord.roomId);
									$("#roomNumberEdit").val(
											dataRecord.roomNumber);
									$("#roomTypeNameEdit").val(
											dataRecord.roomTypeName);
									$("#descriptionEdit").val(
											dataRecord.description);
									$("#statusEdit").val(dataRecord.status);
									$("#telephoneNumberEdit").val(
											dataRecord.telephoneNumber);
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
									$("#roomIdDelete").val(dataRecord.roomId);
									$("#roomTypeNameDelete").val(
											dataRecord.roomNumber);
									$("#roomTypeNameDelete").val(
											dataRecord.roomTypeName);
									$("#descriptionDelete").val(
											dataRecord.description);
									$("#statusDelete").val(dataRecord.status);
									$("#telephoneNumberDelete").val(
											dataRecord.telephoneNumber);
									$("#popupDelete").jqxWindow('open');
								}
							} ]
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

		// edit row when the user clicks the 'Edit' button.
		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});

		// edit row when the user clicks the 'Edit' button.

		$("#edit").click(function() {

			// 				            var onSuccess = $('#roomEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#roomEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/room/ajxAddOrUpdate',
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

		// delete row when the user clicks the 'Delete' button.
		$("#delete").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#roomDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/room/ajxDelete',
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

		$('#roomForm').jqxValidator({
			rules : [ {
				input : '#roomNumber',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

	}

	function clearText() {
		$("#roomId").val('');
		$("#roomNumber").val('');
		$('#roomtypeConvert').jqxValidator('hide');
		$("#description").val('');
		$("#status").val('');
		$('#telephoneNumber').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="roomForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Room</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="roomId" name="roomId" readonly="readonly" /></td>
			</tr>

			<tr>
				<td>Room Number</td>
				<td><input type="text" id="roomNumber" name="roomNumber"
					class="text-input" title="roomNumber" /></td>
			</tr>
			<tr>
				<td>Room Type Name</td>
				<td><div id="roomtypeConvert"></div></td>
			</tr>

			<tr>
				<td>Description</td>
				<td><input type="text" id="description" name="description"
					class="text-input" title="description" /></td>
			</tr>
			<tr>
				<td>status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status" /></td>
			</tr>

			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber" /></td>
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
		<form method="post" action="" id="roomDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="roomIdDelete"
						name="roomId" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room Number :</td>
					<td><input type="text" id="roomNumberDelete" name="roomNumber"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Room Type :</td>
					<td><input type="text" id="roomTypeNameDelete"
						name="roomTypeName" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Description:</td>
					<td><input type="text" id="descriptionDelete"
						name="description" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Status :</td>
					<td><input type="text" id="statusDelete" name="status"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Telephone Number :</td>
					<td><input type="text" id="telephoneNumberDelete"
						name="telephoneNumber" class="text-input" readonly="readonly" /></td>
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

<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="roomEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="roomIdEdit" name="roomId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="roomNumberEdit" name="roomNumber"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>Room Type Name</td>
							<td><input type="text" id="roomTypeNameEdit"
								name="roomTypeName" class="text-input" title="roomTypeName" /></td>
						</tr>
						<tr>
							<td>Description</td>
							<td><input type="text" id="descriptionEdit"
								name="description" class="text-input" title="description" /></td>
						</tr>

						<tr>
							<td>Status</td>
							<td><input type="text" id="statusEdit" name="status"
								class="text-input" title="status" /></td>
						</tr>

						<tr>
							<td>Telephone Number</td>
							<td><input type="text" id="telephoneNumberEdit"
								name="telephoneNumber" class="text-input"
								title="telephoneNumber " /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td style="padding-top: 10px;"><input type="button"
								id="edit" value="Save" style="margin-right: 5px;" /> <input
								id="cancelEdit" type="button" value="Cancel" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
