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
			window.location.replace("/hotel/externaldriver/insert");
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
		var url = "/hotel/externaldriver/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'externalDriverId',
				type : 'int'
			}, {
				name : 'name',
				type : 'String'
			}, {
				name : 'licenceNo',
				type : 'String'
			}, {

				name : 'address',
				type : 'String'
			}, {
				name : 'emailAddress',
				type : 'String'
			}, {
				name : 'telephoneNumber',
				type : 'String'

			} ],
			id : 'externalDriverId',
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
								text : 'Name',
								datafield : 'name',
								align : 'left'
							},
							{
								text : 'Licence No',
								datafield : 'licenceNo',
								align : 'left'
							},
							{
								text : 'Address',
								datafield : 'address',
								align : 'left'
							},
							{
								text : 'emailAddress',
								datafield : 'emailAddress',
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
									$("#externalDriverIdEdit").val(
											dataRecord.externalDriverId);
									$("#nameEdit").val(dataRecord.name);
									$("#licenceNoEdit").val(
											dataRecord.licenceNo);
									$("#addressEdit").val(dataRecord.address);
									$("#emailAddressEdit").val(
											dataRecord.country);
									$("#emailAddressEdit").val(
											dataRecord.emailAddress);
									$("#telephoneNumberEdit").val(
											dataRecord.telephoneNumber);

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
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									// 									var name = $("#firstNameView").val(dataRecord.firstName);
									// 									$("#fname").val(name);
									// 									$("#fname:text").val(dataRecord.firstName);

									$("#externalDriverIdView").val(
											dataRecord.externaldriverId);

									$("#nameView").val(dataRecord.name);

									$("#licenceNoView").val(
											dataRecord.licenceNo);

									$("#addressView").val(dataRecord.address);

									$("#emailAddressView").val(
											dataRecord.emailAddress);

									$("#telephoneNumberView").val(
											dataRecord.telephoneNumber);

									$("#popupView").jqxWindow('open');
								}
							} ]
				});

		// 		$('#externaldriverEditForm').jqxValidator({
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

			// 				            var onSuccess = $('#externaldriverEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#externaldriverEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/externaldriver/ajxAddOrUpdate',
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
	<input type="button" value=" New External Dirver" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="externaldriverEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>External Driver</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="externalDriverIdEdit" name="externalDriverId"
								readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Name</td>
							<td><input type="text" id="nameEdit" name="name"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>Licence No</td>
							<td><input type="text" id="licenceNoEdit" name="licenceNo"
								class="text-input" title="licenceNo" /></td>
						</tr>
						<tr>
							<td>Address</td>
							<td><input type="text" id="addressEdit" name="address"
								class="text-input" title="lastName" /></td>
						</tr>

						<tr>
							<td>Email Address</td>
							<td><input type="text" id="emailAddressEdit"
								name="emailAddress" class="text-input" title="emailAddress" /></td>
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



<div id="popupView">
	<div>
		View Agent<input id=fname />
	</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="externaldriverViewForm">
					<table>



						<tr>

							<td colspan="2"><input type="hidden"
								id="externalDriverIdView" name="externalDriverId"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Name :</td>
							<td><input type="text" id="nameView" name="name"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Licence No :</td>
							<td><input type="text" id="licenceNoView" name="licenceNo"
								class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Address :</td>
							<td><input type="text" id="addressView" name="address"
								class="text-input" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Email Address</td>
							<td><input type="text" id="emailAddressView"
								name="emailAddress" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Telephone Number :</td>
							<td><input type="text" id="telephoneNumberView"
								name="telephoneNumber" class="text-input" readonly="readonly" /></td>
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