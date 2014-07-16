<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		$("#jqxButton").on('click', function() {
			window.location.replace("/hotel/department/insert");
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
		var url = "/hotel/department/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'departmentId',
				type : 'int'
			}, {
				name : 'departmentCode',
				type : 'String'
			}, {
				name : 'departmentName',
				type : 'String'
			}, {

				name : 'telephoneNumber',
				type : 'String'
			}, {
				name : 'firstName',
				type : 'String',
				map : 'employee>firstName'

			} ],
			id : 'departmentId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid({
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
			columns : [ {
				text : 'Department Code',
				datafield : 'departmentCode',
				align : 'left'
			}, {
				text : 'Department Name',
				datafield : 'departmentName',
				align : 'left'
			}, {
				text : 'Telephone Number',
				datafield : 'telephoneNumber',
				align : 'left'
			}, {
				text : 'Manager',
				datafield : 'firstName',
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
					$("#departmentIdEdit").val(dataRecord.departmentId);
					$("#departmentCodeEdit").val(dataRecord.departmentCode);
					$("#departmentNameEdit").val(dataRecord.departmentName);
					$("#telephoneNumberEdit").val(dataRecord.telephoneNumber);
					$("#employeeConvertEdit").val(dataRecord.firstName);

					$("#popupEdit").jqxWindow('open');
				}
			}, {
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
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					// 									var name = $("#firstNameView").val(dataRecord.firstName);
					// 									$("#fname").val(name);
					// 									$("#fname:text").val(dataRecord.firstName);

					$("#departmentIdView").val(dataRecord.departmentId);

					$("#departmentCodeView").val(dataRecord.departmentCode);

					$("#departmentNameView").val(dataRecord.departmentName);

					$("#telephoneNumberView").val(dataRecord.telephoneNumber);

					$("#employeeConvertView").val(dataRecord.firstName);

					$("#popupView").jqxWindow('open');
				}
			} ]
		});

		// 		$('#departmentEditForm').jqxValidator({
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

			// 				            var onSuccess = $('#departmentEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#departmentEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/department/ajxAddOrUpdate',
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
	<input type="button" value=" New Department" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="departmentEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Department</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="departmentIdEdit" name="departmentId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Department Code</td>
							<td><input type="text" id="departmentCodeEdit"
								name="departmentCode" class="text-input" title="departmentCode" /></td>
						</tr>
						<tr>
							<td>Department Name</td>
							<td><input type="text" id="departmentNameEdit"
								name="departmentName" class="text-input" title="departmentName" /></td>
						</tr>
						<tr>
							<td>Telephone Number</td>
							<td><input type="text" id="telephoneNumberEdit"
								name="telephoneNumber" class="text-input"
								title="telephoneNumber" /></td>
						</tr>

						<tr>
							<td>Manager</td>
							<td><input type="text" id="employeeConvertEdit"
								name="employeeConvert" class="text-input"
								title="employeeConvert" /></td>
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
				<form method="post" action="" id="departmentViewForm">
					<table>
						<tr>

							<td colspan="2"><input type="hidden" id="departmentIdView"
								name="departmentId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Department Code :</td>
							<td><input type="text" id="departmentCodeView"
								name="departmentCode" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Department Name :</td>
							<td><input type="text" id="departmentNameView"
								name="departmentName" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Telephone Number :</td>
							<td><input type="text" id="telephoneNumberView"
								name="telephoneNumber" class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Manager</td>
							<td><input type="text" id="employeeConvertView"
								name="employeeConvert" class="text-input" readonly="readonly" /></td>
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