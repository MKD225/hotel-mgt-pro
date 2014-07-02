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
	        	width: 250,
	        	height: 50,
	            theme: theme
	        });
		 
	        $('.text-area').addClass('jqx-rc-all');
	        
		
		$("#startTime").jqxDateTimeInput({
			width: '220px', 
			height: '25px',
			formatString: 'T', 
			showCalendarButton: false,
			theme: theme });
		
		$("#endTime").jqxDateTimeInput({
			width: '220px', 
			height: '25px',
			formatString: 'T', 
			showCalendarButton: false,
			theme: theme });

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
			var onSuccess = $('#shiftForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#shiftForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/shift/ajxAddOrUpdate',
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
		var url = "/hotel/shift/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'shiftId',
				type : 'int'
			}, {
				name : 'shiftName',
				type : 'String'
			}, {
				name : 'startTime',
				type : 'String'
			}, {
				
				name : 'endTime',
				type : 'String'
			}, {
				
				
				name : 'description',
				type : 'String'
				
			} ],
			id : 'shiftId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '58%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [
							
							{
								text : 'Start Time',
								datafield : 'startTime',
								align : 'left'
							},
							{
								text : 'Shift Name',
								datafield : 'shiftName',
								align : 'left'
							},
							{
								text : 'End Time',
								datafield : 'endTime',
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
									$("#shiftIdEdit").val(
											dataRecord.shiftId);
									$("#shiftNameEdit").val(
											dataRecord.shiftName);
									$("#startTimeEdit").val(
											dataRecord.startTime);
									$("#endTimeEdit").val(
											dataRecord.endTime);									
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
									$("#shiftIdDelete").val(
											dataRecord.shiftId);
									$("#shiftNameDelete").val(
											dataRecord.shiftName);
									$("#startTimeDelete").val(
											dataRecord.startTime);
									$("#endTimeDelete").val(
											dataRecord.endTime);		
									$("#descriptionDelete").val(
											dataRecord.description);
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

		$('#shiftForm').jqxValidator({
			rules : [ {
				input : '#shiftName',
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
			var formInput = $("#shiftDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/shift/ajxDelete',
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
		var formInput = $("#shiftEditForm").serialize();
		$.ajax({
			type : 'post',
			url : '/hotel/shift/ajxAddOrUpdate',
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
		$("#shiftId").val('');
		$("#shiftName").val('');
		$("#startTime").val('');
		$("#endTime").val('');
		$("#description").val('');
		$('#shiftForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="shiftForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Reservation Type</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="shiftId" name="shiftId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Shift Name</td>
				<td><input type="text" id="shiftName" name="shiftName"
					class="text-input" title="shiftName " /></td>
			</tr>
			
			<tr>
				<td> Start Time</td>
				<td><div id="startTime" ></div>
					</td>
			</tr>

			<tr>
				<td> End Time</td>
				<td><div id="endTime" ></div>
					</td>
			</tr>
			
			<tr>
				<td>Description</td>
				<td>
				<textarea id="description" name="description" class="text-area"></textarea>
				</td>
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
		<form method="post" action="" id="shiftDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				
				<tr>
				<td colspan="2"><input type="hidden"
					id="shiftIdDelete" name="shiftId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Shift Name</td>
				<td><input type="text" id="shiftNameDelete" name="shiftName"
					class="text-input" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Start Time</td>
				<td><input type="text" id="startTimeDelete" name="startTime"
					class="text-input" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>End Time</td>
				<td><input type="text" id="endTimeDelete" name="endTime"
					class="text-input" readonly="readonly" /></td>
			</tr>

			
			<tr>
				<td>Description</td>
				<td><input type="text" id="descriptionDelete" name="description"
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
		<form method="post" action="" id="shiftEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Edit</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				
				<tr>
				<td colspan="2"><input type="hidden"
					id="shiftIdEdit" name="shiftId" /></td>
			</tr>
			<tr>
				<td>Shift Name</td>
				<td><input type="text" id="shiftNameEdit" name="shiftName"
					class="text-input"  /></td>
			</tr>
			<tr>
				<td>Start Time</td>
				<td><input type="text" id="startTimeEdit" name="startTime"
					class="text-input"/></td>
			</tr>
			<tr>
				<td>endTime</td>
				<td><input type="text" id="endTimeEdit" name="endTime"
					class="text-input"  /></td>
			</tr>

			
			<tr>
				<td>Description</td>
				<td><input type="text" id="descriptionEdit" name="description"
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
