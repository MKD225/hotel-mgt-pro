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
					url : '/hotel/discount/ajxAddOrUpdate',
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
		var url = "/hotel/discount/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'discounttId',
				type : 'int'
			}, {
				name : 'type',
				type : 'String'
			}, {
				name : 'initializedDate',
				type : 'String'
			}, {

				name : 'closedDate',
				type : 'String'

			}, {
				name : 'f_bpercentage',
				type : 'String'
			}, {

				name : 'minibarpercentage',
				type : 'String'
			}, {

				name : 'roompercentage',
				type : 'String'
			}, {
				name : 'otherDiscountPercentage',
				type : 'String'
			}, {
				name : 'status',
				type : 'String'

			} ],
			id : 'discounttId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid")
				.jqxGrid(
						{
							width : '50%',
							source : dataAdapter,
							theme : theme,
							autoheight : true,
							columns : [
									{
										text : 'type',
										datafield : 'type',
										align : 'left'
									},

									{
										text : 'initializedDate',
										datafield : 'initializedDate',
										align : 'left'
									},
									{
										text : 'closedDate',
										datafield : 'closedDate',
										align : 'left'
									},

									{
										text : 'f_bpercentage',
										datafield : 'f_bpercentage',
										align : 'left'
									},
									{
										text : 'minibarpercentage',
										datafield : 'minibarpercentage',
										align : 'left'
									},
									{
										text : 'roompercentage',
										datafield : 'roompercentage',
										align : 'left'
									},
									{
										text : 'otherDiscountPercentage',
										datafield : 'otherDiscountPercentage',
										align : 'left'
									},
									{
										text : 'status',
										datafield : 'status',
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
											$("#discounttIdEdit").val(dataRecord.discounttId);
											$("#typeEdit").val(dataRecord.type);
											$("#initializedDateEdit").val(dataRecord.initializedDate);
											$("#closedDateEdit").val(dataRecord.closedDate);
											$("f_bpercentageEdit").val(dataRecord.f_bpercentage);
											$("#minibarpercentageEdit").val(dataRecord.minibarpercentage);
											$("#roompercentageEdit").val(dataRecord.roompercentage);
											$("#otherDiscountPercentageEdit").val(dataRecord.otherDiscountPercentage);
											$("#statusEdit").val(dataRecord.status);
											
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
											var dataRecord = $("#jqxgrid")
													.jqxGrid('getrowdata', row);
											$("#discounttIdDelete").val(
													dataRecord.discounttId);
											$("#typeDelete").val(
													dataRecord.type);
											$("#initializedDateDelete").val(
													dataRecord.initializedDate);
											$("#closedDateDelete").val(
													dataRecord.closedDate);
											$("#f_bpercentageDelete").val(
													dataRecord.f_bpercentage);
											$("#minibarpercentageDelete").val(											
															dataRecord.minibarpercentage);
											$("#roompercentageDelete").val(
													dataRecord.roompercentage);
											$("#otherDiscountPercentageDelete").val(							
															dataRecord.otherDiscountPercentage);
											$("#statusDelete").val(
													dataRecord.status);

											$("#popupDelete").jqxWindow('open');
										}
									} ]
						});

		$('#membershipTypeForm').jqxValidator({
			rules : [ {
				input : '#type',
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
			var formInput = $("#discountDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/discount/ajxDelete',
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
			var formInput = $("#discountEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/discount/ajxAddOrUpdate',
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
				<td colspan="2" align="center"><b>Discount</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="discounttId" name="discounttId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>type</td>
				<td><input type="text" id="type" name="type" class="text-input"
					title="type" /></td>
			</tr>
			<tr>
				<td>Initialized Date</td>
				<td><input type="text" id="initializedDate"
					name="initializedDate" class="text-input" title="initializedDate" /></td>
			</tr>
			<tr>
				<td>Closed Date</td>
				<td><input type="text" id="closedDate" name="closedDate"
					class="text-input" title="closedDate" /></td>
			</tr>

			<tr>
				<td>F n B percentage</td>
				<td><input type="text" id="f_bpercentage" name="f_bpercentage"
					class="text-input" title="f_bpercentage" /></td>
			</tr>


			<tr>
				<td>Minibar percentage</td>
				<td><input type="text" id="minibarpercentage"
					name="minibarpercentage" class="text-input"
					title="minibarpercentage" /></td>
			</tr>
			<tr>
				<td>Room percentage</td>
				<td><input type="text" id="roompercentage"
					name="roompercentage" class="text-input" title="Room percentage" /></td>
			</tr>
			<tr>
				<td>Other Discount Percentage</td>
				<td><input type="text" id="otherDiscountPercentage"
					name="otherDiscountPercentage" class="text-input"
					title="otherDiscountPercentage" /></td>
			</tr>

			<tr>
				<td>status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status Type" /></td>
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

<div id="popupEdit">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="discountEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Edit</b> following
						<b>Discount Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden" id="discounttIdEdit"
						name="discounttId" class="text-input"  /></td>
				</tr>
				<tr>
					<td>type</td>
					<td><input type="text" id="typeEdit" name="type"
						class="text-input"  /></td>
				</tr>
				<tr>
					<td>Initialized Date</td>
					<td><input type="text" id="initializedDateEdit"
						name="initializedDate" class="text-input"  /></td>
				</tr>
				<tr>
					<td>Closed Date</td>
					<td><input type="text" id="closedDateEdit" name="closedDate"
						class="text-input"  /></td>
				</tr>

				<tr>
					<td>F n B percentage</td>
					<td><input type="text" id="f_bpercentageEdit"
						name="f_bpercentage" class="text-input"  /></td>
				</tr>


				<tr>
					<td>Minibar percentage</td>
					<td><input type="text" id="minibarpercentageEdit"
						name="minibarpercentage" class="text-input"  /></td>
				</tr>
				<tr>
					<td>Room percentage</td>
					<td><input type="text" id="roompercentageEdit"
						name="roompercentage" class="text-input"  /></td>
				</tr>
				<tr>
					<td>Other Discount Percentage</td>
					<td><input type="text" id="otherDiscountPercentageEdit"
						name="otherDiscountPercentage" class="text-input"
						 /></td>
				</tr>

				<tr>
					<td>status</td>
					<td><input type="text" id="statusEdit" name="status"
						class="text-input"  /></td>
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

<div id="popupDelete">
	<div>Delete Membership Type</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="discountDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Discount Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden" id="discounttIdDelete"
						name="discounttId" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>type</td>
					<td><input type="text" id="typeDelete" name="type"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Initialized Date</td>
					<td><input type="text" id="initializedDateDelete"
						name="initializedDate" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Closed Date</td>
					<td><input type="text" id="closedDateDelete" name="closedDate"
						class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>F n B percentage</td>
					<td><input type="text" id="f_bpercentageDelete"
						name="f_bpercentage" class="text-input" readonly="readonly" /></td>
				</tr>


				<tr>
					<td>Minibar percentage</td>
					<td><input type="text" id="minibarpercentageDelete"
						name="minibarpercentage" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room percentage</td>
					<td><input type="text" id="roompercentageDelete"
						name="roompercentage" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Other Discount Percentage</td>
					<td><input type="text" id="otherDiscountPercentageDelete"
						name="otherDiscountPercentage" class="text-input"
						readonly="readonly" /></td>
				</tr>

				<tr>
					<td>status</td>
					<td><input type="text" id="statusDelete" name="status"
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