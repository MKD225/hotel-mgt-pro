<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');
		
		$("#jqxButton").on('click', function () {
			window.location.replace("/hotel/discount/insert");
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
							width : '100%',
							source : dataAdapter,
							theme : theme,
							autoheight : true,
							columns : [
									{
										text : 'type',
										datafield : 'type',
										align : 'left',
										width:'14%'
									},

									{
										text : 'Start Date',
										datafield : 'initializedDate',
										align : 'left',
										width:'10%'
									},
									{
										text : 'End Date',
										datafield : 'closedDate',
										align : 'left',
										width:'10%'
									},

									{
										text : 'FnB',
										datafield : 'f_bpercentage',
										align : 'left',
										width:'10%'
									},
									{
										text : 'Minibar',
										datafield : 'minibarpercentage',
										align : 'left',
										width:'10%'
									},
									{
										text : 'Room',
										datafield : 'roompercentage',
										align : 'left',
										width:'10%'
									},
									{
										text : 'Other discounts',
										datafield : 'otherDiscountPercentage',
										align : 'left',
										width:'10%'
									},
									{
										text : 'status',
										datafield : 'status',
										align : 'left',
										width:'10%'

									},
									{
										text : 'Edit',
										datafield : 'Edit',
										columntype : 'button',
										width : '8%',
										align : 'center',
										cellsrenderer : function() {
											return "Edit";
										},
										buttonclick : function(row) {
											//get the clicked row's data and initialize the input fields.
											var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
											$("#discounttIdEdit").val(
													dataRecord.discounttId);
											$("#typeEdit").val(
													dataRecord.type);
											$("#initializedDateEdit").val(
													dataRecord.initializedDate);
											$("#closedDateEdit").val(
													dataRecord.closedDate);
											$("#f_bpercentageEdit").val(
													dataRecord.f_bpercentage);
											$("#minibarpercentageEdit").val(
													dataRecord.minibarpercentage);
											$("#roompercentageEdit").val(
													dataRecord.roompercentage);
											$("#otherDiscountPercentageEdit").val(
													dataRecord.otherDiscountPercentage);
											$("#statusEdit").val(
													dataRecord.status);
											$("#popupEdit").jqxWindow('open');
										}
									},
									{
										text : 'Delete',
										datafield : 'Delete',
										columntype : 'button',
										width : '8%',
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

// 		$('#membershipTypeForm').jqxValidator({
// 			rules : [ {
// 				input : '#type',
// 				message : 'Membership Type is required!',
// 				action : 'keyup, blur',
// 				rule : 'required'
// 			} ],
// 			theme : theme,
// 			scroll : false
// 		});

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
			console.info("what");
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

		
		
		
		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});
		
		// edit row when the user clicks the 'Edit' button.
		
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

		
		}

	
</script>

<div>
	<input type="button" value="Add Discount" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


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
 <div class="clr"></div>