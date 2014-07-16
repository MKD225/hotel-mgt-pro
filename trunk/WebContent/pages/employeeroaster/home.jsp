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
			width : 250,
			height : 50,
			theme : theme
		});

		$('.text-area').addClass('jqx-rc-all');

		$("#jqxButton").on('click', function() {
			window.location.replace("/hotel/employeeroaster/insert");
		});

		$("#popupView").jqxWindow({
			width : '75%',
			resizable : false,
			theme : theme,
			isModal : true,
			autoOpen : false,
			cancelButton : $("#closeView"),
			showAnimationDuration : 1000,
			modalOpacity : 0.45
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

		// Prepare the data
		var url = "/hotel/employeeroaster/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'employeeRosterId',
				type : 'int'

			}, {
				name : 'lastName',
				type : 'String',
				map : 'employee>lastName'

			}, {
				name : 'shiftName',
				type : 'String',
				map : 'shift>shiftName'
			}, {

				name : 'roasterDate',
				type : 'String'

			}, {
				name : 'assignDate',
				type : 'String'
			}, {

				name : 'remarks',
				type : 'String'

			} ],
			id : 'employeeId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid")
				.jqxGrid(
						{
							width : '100%',
							autoheight : true,
							source : dataAdapter,
							showfilterrow : true,
							filterable : true,
							columnsresize : true,
							pageable : true,
							pagesize : 20,
							autorowheight : true,
							rowsheight : 80,
							theme : theme,
							columns : [
									{
										text : 'lastName',
										datafield : 'lastName',
										align : 'left'
									},
									{
										text : 'shiftName',
										datafield : 'shiftName',
										align : 'left'
									},
									{
										text : 'roasterDate',
										datafield : 'roasterDate',
										align : 'left'
									},
									{
										text : 'assignDate',
										datafield : 'assignDate',
										align : 'left'
									},
									{
										text : 'remarks',
										datafield : 'remarks',
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
											var dataRecord = $("#jqxgrid")
													.jqxGrid('getrowdata', row);
											$("#employeeRosterIdEdit")
													.val(
															dataRecord.employeeRosterId);
											$("#lastNameEdit").val(
													dataRecord.lastName);
											$("#shiftNameEdit").val(
													dataRecord.shiftName);
											$("#roasterDateEdit").val(
													dataRecord.roasterDate);
											$("#assignDateEdit").val(
													dataRecord.assignDate);
											$("#remarksEdit").val(
													dataRecord.remarks);

											$("#popupEdit").jqxWindow('open');
										}
									},
									{
										text : 'View',
										datafield : 'View',
										columntype : 'button',
										width : 100,
										align : 'center',
										cellsrenderer : function() {
											return "View";
										},
										buttonclick : function(row) {
											//get the clicked row's data and initialize the input fields.
											var dataRecord = $("#jqxgrid")
													.jqxGrid('getrowdata', row);
											// 									var name = $("#firstNameView").val(dataRecord.firstName);
											// 									$("#fname").val(name);
											// 									$("#fname:text").val(dataRecord.firstName);

											$("#employeeRosterIdView")
													.val(
															dataRecord.employeeRosterId);

											$("#lastNameView").val(
													dataRecord.lastName);

											$("#shiftNameView").val(
													dataRecord.shiftName);

											$("#roasterDateView").val(
													dataRecord.roasterDate);

											$("#assignDateView").val(
													dataRecord.assignDate);

											$("#remarksView").val(
													dataRecord.remarks);

											$("#popupView").jqxWindow('open');
										}
									} ]
						});

		// 		$('#employeeroasterEditForm').jqxValidator({
		// 			rules : [ {
		// 				input : '#remarks',
		// 				message : 'Membership Type is required!',
		// 				action : 'keyup, blur',
		// 				rule : 'required'
		// 			} ],
		// 			theme : theme,
		// 			scroll : false
		// 		});

		$("#cancelEdit").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#cancelEdit").click(function() {
			$("#popupEdit").jqxWindow('hide');
		});

		$("#closeView").jqxButton({
			width : "100px",
			theme : theme
		});

		$("#closeView").click(function() {
			$("#popupView").jqxWindow('hide');
		});

		// edit row when the user clicks the 'Edit' button.
		$("#edit").jqxButton({
			width : "100px",
			theme : theme
		});

		// edit row when the user clicks the 'Edit' button.

		$("#edit").click(function() {

			// 				            var onSuccess = $('#employeeroasterEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#employeeroasterEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/employeeroaster/ajxAddOrUpdate',
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
	<input type="button" value="Add Employeeroaster" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="employeeroasterEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="employeeRosterIdEdit" name="employeeRosterId"
								readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Employee Name</td>
							<td><input type="text" id="lastNameEdit" name="lastName"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>Shift Name</td>
							<td><input type="text" id="shiftNameEdit" name="shiftName"
								class="text-input" title="shiftName" /></td>
						</tr>
						<tr>
							<td>Roaster Date</td>
							<td><input type="text" id="roasterDateEdit"
								name="roasterDate" class="text-input" title="roasterDate" /></td>
						</tr>

						<tr>
							<td>Assign Date</td>
							<td><input type="text" id="assignDateEdit" name="assignDate"
								class="text-input" title="assignDate" /></td>
						</tr>

						<tr>
							<td>remarks</td>
							<td><textarea id="remarksEdit" name="remarks"
									class="text-area"></textarea></td>
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



<div id="popupView">
	<div>
		View Agent<input id=fname />
	</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id=employeeroasterViewForm>
					<table>

						<tr>

							<td colspan="2"><input type="hidden"
								id="employeeRosterIdView" name="employeeRosterId"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Employee Name :</td>
							<td><input type="text" id="lastNameView" name="lastName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>shiftName :</td>
							<td><input type="text" id="shiftNameView" name="shiftName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Roaster Date :</td>
							<td><input type="text" id="roasterDateView"
								name="roasterDate" class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Assign Date</td>
							<td><input type="text" id="assignDateView" name="assignDate"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Remarks :</td>
							<td><textarea id="remarksView" name="remarks"
									class="text-area" readonly="readonly"></textarea></td>
						</tr>

						<tr>
							<td style="padding-top: 10px;" align="center" colspan="1"><input
								id="closeView" type="button" value="Close" /></td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="clr"></div>