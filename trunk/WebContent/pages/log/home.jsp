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
			window.location.replace("/hotel/log/insert");
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
		// 	        $("#popupEdit").jqxWindow({
		// 	            width: '75%',
		// 	            resizable: false,
		// 	            theme: theme,
		// 	            isModal: true,
		// 	            autoOpen: false,
		// 	            cancelButton: $("#cancelEdit"),
		// 	            showAnimationDuration: 1000,
		// 	            modalOpacity: 0.45           
		// 	        });

		// Prepare the data
		var url = "/hotel/log/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'logId',
				type : 'int'
			}, {
				name : 'actionClass',
				type : 'String'
			}, {
				name : 'actionMethod',
				type : 'String'
			}, {

				name : 'objectAttributes',
				type : 'String'
			}, {
				name : 'time',
				type : 'String',

			}, {
				name : 'firstName',
				type : 'String',
				map : 'employee>firstName'
			} ],
			id : 'logId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
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
								text : 'actionClass',
								datafield : 'actionClass',
								align : 'left'
							},
							{
								text : 'actionMethod',
								datafield : 'actionMethod',
								align : 'left'
							},
							{
								text : 'objectAttributes',
								datafield : 'objectAttributes',
								align : 'left'
							},
							{
								text : 'time',
								datafield : 'time',
								align : 'left'
							},
							{
								text : 'firstName',
								datafield : 'firstName',
								align : 'left'
							},

							// 							{
							// 								text : 'Edit',
							// 								datafield : 'Edit',
							// 								columntype : 'button',
							// 								width : 100,
							// 								align : 'center',
							// 								cellsrenderer : function() {
							// 									return "Edit";
							// 								},
							// 								buttonclick : function(row) {
							// 									//get the clicked row's data and initialize the input fields.
							// 									var dataRecord = $("#jqxgrid").jqxGrid(
							// 											'getrowdata', row);
							// 									$("#logIdEdit").val(dataRecord.logId);
							// 									$("#actionClassEdit").val(dataRecord.actionClass);											
							// 									$("#actionMethodEdit").val(dataRecord.actionMethod);
							// 									$("#objectAttributesEdit").val(dataRecord.objectAttributes);
							// 									$("#timeEdit").val(dataRecord.time);
							// 									$("#firstNameEdit").val(dataRecord.firstName);

							// 									$("#popupEdit").jqxWindow('open');
							// 								}
							// 							},
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
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									// 									var name = $("#firstNameView").val(dataRecord.firstName);
									// 									$("#fname").val(name);
									// 									$("#fname:text").val(dataRecord.firstName);

									$("#logIdView").val(dataRecord.logId);

									$("#actionClassView").val(
											dataRecord.actionClass);

									$("#actionMethodView").val(
											dataRecord.actionMethod);

									$("#objectAttributesView").val(
											dataRecord.objectAttributes);

									$("#timeView").val(dataRecord.time);

									$("#firstNameView").val(
											dataRecord.firstName);

									$("#popupView").jqxWindow('open');
								}
							} ]
				});

		// 		$('#employeeEditForm').jqxValidator({
		// 			rules : [ {
		// 				input : '#remarks',
		// 				message : 'Membership Type is required!',
		// 				action : 'keyup, blur',
		// 				rule : 'required'
		// 			} ],
		// 			theme : theme,
		// 			scroll : false
		// 		});

		// 		 $("#cancelEdit").jqxButton({
		// 			width : "100px",
		// 			theme : theme
		// 		});

		// 		$("#cancelEdit").click(function() {
		// 			$("#popupEdit").jqxWindow('hide');
		// 		});

		// 		  $("#closeView").jqxButton({
		// 				width : "100px",
		// 				theme : theme
		// 			});

		// 			$("#closeView").click(function() {
		// 				$("#popupView").jqxWindow('hide');
		// 			});

		// 		// edit row when the user clicks the 'Edit' button.
		// 			$("#edit").jqxButton({
		// 				width : "100px",
		// 				theme : theme
		// 			});

		// 			// edit row when the user clicks the 'Edit' button.

		// 			$("#edit").click(function() {

		// // 				            var onSuccess = $('#employeeEditForm').jqxValidator('validate');
		// // 				            if (onSuccess) {
		// 				var formInput = $("#employeeEditForm").serialize();
		// 				$.ajax({
		// 					type : 'post',
		// 					url : '/hotel/employee/ajxAddOrUpdate',
		// 					data : formInput,
		// 					success : function(data) {
		// 						var dataAdapter = new $.jqx.dataAdapter(source);
		// 						$("#jqxgrid").jqxGrid({
		// 							source : dataAdapter
		// 						});
		// 					}
		// 				});
		// 				$("#popupEdit").jqxWindow('hide');

		// 			});

	}
</script>

<div>
	<input type="button" value="Add Log" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- <!-- edit form -->
<!-- <div id="popupEdit"> -->
<!-- 	<div>Edit Log</div> -->
<!-- 	 <div style="overflow-y: scroll;"> -->
<!-- 	 <div id='detailPannel'> -->
<!-- 	<div style="overflow: hidden;"> -->
<!-- 	<form method="post" action="" id="employeeEditForm" -->
<!-- 		style="margin-left: 80px; margin-top: 20px;"> -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" align="center"><b>Agent</b></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2" align="center">&nbsp;<input type="hidden" -->
<!-- 					id="logIdEdit" name="logId" readonly="readonly" /></td> -->
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 				<td>Action Class</td> -->
<!-- 				<td><input type="text" id="actionClassEdit" name="actionClass" -->
<!-- 					class="text-input" title="actionClass" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Action Method</td> -->
<!-- 				<td><input type="text" id="actionMethodEdit" name="actionMethod" -->
<!-- 					class="text-input" title="actionMethod" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Object Attributes</td> -->
<!-- 				<td><input type="text" id="objectAttributesEdit" name="objectAttributes" -->
<!-- 					class="text-input" title="objectAttributes" /></td> -->
<!-- 			</tr> -->

<!-- 			<tr> -->
<!-- 					<td>Time</td> -->
<!-- 					<td><input type="text" id="timeEdit" name="time" -->
<!-- 						class="text-input" title="time" /></td> -->
<!-- 				</tr> -->

<!-- 			<tr> -->
<!-- 				<td>Employee</td> -->
<!-- 				<td><input type="text" id="employeeEdit" name="employee" -->
<!-- 					class="text-input" title="employee " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Mobile</td> -->
<!-- 				<td><input type="text" id="mobileEdit" -->
<!-- 					name="mobile" class="text-input" title="mobile " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Home</td> -->
<!-- 				<td><input type="text" id="homeEdit" name="home" -->
<!-- 					class="text-input" title="home" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Address</td> -->
<!-- 				<td><input type="text" id="addressEdit" name="address" -->
<!-- 					class="text-input" title="address " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>NIC Number</td> -->
<!-- 				<td><input type="text" id="nicNumberEdit" name="nicNumber" -->
<!-- 					class="text-input" title="nicNumber " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Password</td> -->
<!-- 				<td><input type="text" id="passwordEdit" -->
<!-- 					name="password" class="text-input" title="password " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>User Name</td> -->
<!-- 				<td><input type="text" id="userNameEdit" name="userName" -->
<!-- 					class="text-input" title="userName" /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Privilege</td> -->
<!-- 				<td><input type="text" id="privilegeEdit" name="privilege" -->
<!-- 					class="text-input" title="privilege " /></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>Description</td> -->
<!-- 				<td><input type="text" id="descriptionEdit" name="description" -->
<!-- 					class="text-input" title="description " /></td> -->
<!-- 			</tr> -->



<!-- 			<tr> -->
<!-- 				<td>&nbsp;</td> -->
<!-- 				<td style="padding-top: 10px;"><input type="button" id="edit" -->
<!-- 					value="Save" style="margin-right: 5px;" /> <input id="cancelEdit" -->
<!-- 					type="button" value="Cancel" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->



<div id="popupView">
	<div>
		View Agent<input id=fname />
	</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id=employeeViewForm>
					<table>



						<tr>

							<td colspan="2"><input type="hidden" id="logIdView"
								name="logId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Action Class :</td>
							<td><input type="text" id="actionClassView"
								name="actionClass" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Action Method:</td>
							<td><input type="text" id="actionMethodView"
								name="actionMethod" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Object Attributes :</td>
							<td><input type="text" id="objectAttributesView"
								name="objectAttributes" class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Time</td>
							<td><input type="text" id="timeView" name="time"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Employee :</td>
							<td><input type="text" id="employeeView" name="employee"
								class="text-input" readonly="readonly" /></td>
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