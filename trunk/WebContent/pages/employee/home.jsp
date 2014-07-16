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
			window.location.replace("/hotel/employee/insert");
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
		var url = "/hotel/employee/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'employeeId',
				type : 'int'
			}, {
				name : 'title',
				type : 'String'
			}, {
				name : 'firstName',
				type : 'String'
			}, {

				name : 'lastName',
				type : 'String'
			}, {
				name : 'departmentName',
				type : 'String',
				map : 'department>departmentName'
			}, {
				name : 'email',
				type : 'String'
			}, {

				name : 'mobile',
				type : 'String'
			}, {
				name : 'home',
				type : 'String'
			}, {

				name : 'address',
				type : 'String'
			}, {
				name : 'nicNumber',
				type : 'String'
			}, {
				name : 'password',
				type : 'String'
			}, {
				name : 'userName',
				type : 'String'
			}, {
				name : 'privilegeType',
				type : 'String',
				map : 'privilege>privilegeType'
			}, {
				name : 'description',
				type : 'String'
			} ],
			id : 'employeeId',
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
				text : 'title',
				datafield : 'title',
				align : 'left'
			}, {
				text : 'firstName',
				datafield : 'firstName',
				align : 'left'
			}, {
				text : 'lastName',
				datafield : 'lastName',
				align : 'left'
			}, {
				text : 'departmentName',
				datafield : 'departmentName',
				align : 'left'
			}, {
				text : 'email',
				datafield : 'email',
				align : 'left'
			}, {
				text : 'mobile',
				datafield : 'mobile',
				align : 'left'
			}, {
				text : 'home',
				datafield : 'home',
				align : 'left'
			}, {
				text : 'address',
				datafield : 'address',
				align : 'left'
			}, {
				text : 'nicNumber',
				datafield : 'nicNumber',
				align : 'left'
			}, {
				text : 'password',
				datafield : 'password',
				align : 'left'
			}, {
				text : 'userName',
				datafield : 'userName',
				align : 'left'
			}, {
				text : 'privilegeType',
				datafield : 'privilegeType',
				align : 'left'
			}, {
				text : 'description',
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
					$("#employeeIdEdit").val(dataRecord.employeeId);
					$("#titleEdit").val(dataRecord.title);
					$("#firstNameEdit").val(dataRecord.firstName);
					$("#lastNameEdit").val(dataRecord.lastName);
					$("#departmentEdit").val(dataRecord.departmentName);
					$("#emailEdit").val(dataRecord.email);
					$("#mobileEdit").val(dataRecord.mobile);
					$("#homeEdit").val(dataRecord.home);
					$("#addressEdit").val(dataRecord.address);
					$("#nicNumberEdit").val(dataRecord.nicNumber);
					$("#passwordEdit").val(dataRecord.password);
					$("#userNameEdit").val(dataRecord.userName);
					$("#privilegeEdit").val(dataRecord.privilegeType);
					$("#descriptionEdit").val(dataRecord.description);

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

					$("#employeeIdView").val(dataRecord.employeeId);

					$("#titleView").val(dataRecord.title);

					$("#firstNameView").val(dataRecord.firstName);

					$("#LastNameView").val(dataRecord.lastName);

					$("#departmentView").val(dataRecord.departmentName);

					$("#emailView").val(dataRecord.email);

					$("#mobileView").val(dataRecord.mobile);

					$("#homeView").val(dataRecord.home);

					$("#addressView").val(dataRecord.address);

					$("#nicNumberView").val(dataRecord.nicNumber);

					$("#passwordView").val(dataRecord.password);

					$("#userNameView").val(dataRecord.userName);

					$("#privilegeView").val(dataRecord.privilegeType);

					$("#descriptionView").val(dataRecord.description);

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

			// 				            var onSuccess = $('#employeeEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#employeeEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/employee/ajxAddOrUpdate',
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
	<input type="button" value="Add Employee" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="employeeEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="employeeIdEdit" name="employeeId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="titleEdit" name="title"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type="text" id="firstNameEdit" name="firstName"
								class="text-input" title="firstName" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" id="lastNameEdit" name="lastName"
								class="text-input" title="lastName" /></td>
						</tr>

						<tr>
							<td>Department</td>
							<td><input type="text" id="departmentEdit" name="department"
								class="text-input" title="country" /></td>
						</tr>

						<tr>
							<td>Email Address</td>
							<td><input type="text" id="emailEdit" name="email"
								class="text-input" title="emailAddress " /></td>
						</tr>
						<tr>
							<td>Mobile</td>
							<td><input type="text" id="mobileEdit" name="mobile"
								class="text-input" title="mobile " /></td>
						</tr>
						<tr>
							<td>Home</td>
							<td><input type="text" id="homeEdit" name="home"
								class="text-input" title="home" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" id="addressEdit" name="address"
								class="text-input" title="address " /></td>
						</tr>
						<tr>
							<td>NIC Number</td>
							<td><input type="text" id="nicNumberEdit" name="nicNumber"
								class="text-input" title="nicNumber " /></td>
						</tr>
						<tr>
							<td>Password</td>
							<td><input type="text" id="passwordEdit" name="password"
								class="text-input" title="password " /></td>
						</tr>
						<tr>
							<td>User Name</td>
							<td><input type="text" id="userNameEdit" name="userName"
								class="text-input" title="userName" /></td>
						</tr>
						<tr>
							<td>Privilege</td>
							<td><input type="text" id="privilegeEdit" name="privilege"
								class="text-input" title="privilege " /></td>
						</tr>
						<tr>
							<td>Description</td>
							<td><input type="text" id="descriptionEdit"
								name="description" class="text-input" title="description " /></td>
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
				<form method="post" action="" id=employeeViewForm>
					<table>



						<tr>

							<td colspan="2"><input type="hidden" id="employeeIdView"
								name="employeeId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Title :</td>
							<td><input type="text" id="titleView" name="title"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>First Name :</td>
							<td><input type="text" id="firstNameView" name="firstName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Last Name :</td>
							<td><input type="text" id="LastNameView" name="lastName"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Department</td>
							<td><input type="text" id="departmentView" name="department"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Email Address :</td>
							<td><input type="text" id="emailView" name="email"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Mobile :</td>
							<td><input type="text" id="mobileView" name="mobile"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Home:</td>
							<td><input type="text" id="homeView" name="home"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Address :</td>
							<td><input type="text" id="addressView" name="address"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Password :</td>
							<td><input type="text" id="passwordView" name="password"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>User Name:</td>
							<td><input type="text" id="userNameView" name="userName"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Privilege :</td>
							<td><input type="text" id="privilegeView" name="privilege"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>description :</td>
							<td><input type="text" id="descriptionView"
								name="description" class="text-input" readonly="readonly" /></td>
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