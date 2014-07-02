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
		var onSuccess = true;
		if (onSuccess) {
			var formInput = $("#privilegeForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/privilege/ajxAddOrUpdate',
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
	
var url = "/hotel/menu/ajxSearch";
    
    var sourceType = {
        datatype: "json",
        datafields: [{
            name: 'menuId'
        }, {
            name: 'name'
        }],
        id: 'menuId',
        url: url
    };
    
    var dataAdapterType = new $.jqx.dataAdapter(sourceType);
    
    $("#menuConvert").jqxDropDownList({
        selectedIndex: -1,
        source: dataAdapterType,
        displayMember: "name",
        valueMember: "menuId",
        promptText: "Menu type...",
        autoDropDownHeight: true,
        width: 250,
        height: 25,
        theme: theme
    });

	// Prepare the data
	var url = "/hotel/privilege/ajxSearch";
	var source = {
		datatype : "json",
		mtype : 'POST',
		datafields : [ {
			name : 'privilegeId',
			type : 'int'
		}, {
			name : 'name',
			type : 'String',
			map: 'menu>name'
		}, {
			name : 'privilegeType',
			type : 'String'
		
		} ],
		id : 'privilegeId',
		url : url,
		root : 'data'
	};
	var dataAdapter = new $.jqx.dataAdapter(source);

	// initialize jqxGrid
	$("#jqxgrid").jqxGrid(
			{
				width : '60%',
				source : dataAdapter,
				theme : theme,
				autoheight : true,
				columns : [
						{
							text : 'Menu',
							datafield : 'name',
							align : 'left',
							width : '30%' 
						},
						
						{
							text : 'Privilege Type',
							datafield : 'privilegeType',
							align : 'left',
							width : '30%' 
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
								$("#privilegeIdEdit").val(
										dataRecord.privilegeId);
								$("#menuConvertEdit").val(
										dataRecord.menuConvert);
								$("#privilegeTypeEdit").val(
										dataRecord.privilegeType);
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
								$("#privilegeIdDelete").val(
										dataRecord.privilegeId);
								$("#menuConvertDelete").val(
										dataRecord.menuConvert);
								$("#privilegeTypeDelete").val(
										dataRecord.privilegeType);
								
								$("#popupDelete").jqxWindow('open');
							}
						} ]
			});

//		$('#privilegeForm').jqxValidator({
//			rules : [ {
//				input : '#anniversary',
//				message : 'Membership Type is required!',
//				action : 'keyup, blur',
//				rule : 'required'
//			}, {
//             input: '#privilegeType',
//             message: 'Please select privilege type!',
//             action: 'change, valuechanged',
//             rule: function(input, commit) {
//                 var index = $("#roomConvert").jqxDropDownList('getSelectedIndex');
//                 return ! (index == -1);
//             }
//			} ],
//			theme : theme,
//			scroll : false
//		});

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
	// delete row when the user clicks the 'Delete' button.
	$("#delete").click(function() {
		//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
		//             if (onSuccess) {
		var formInput = $("#privilegeDeleteForm").serialize();
		$.ajax({
			type : 'post',
			url : '/hotel/privilege/ajxDelete',
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

function clearText() {
	

	$("#privilegeId").val('');
	$("#menuConvert").val('');
	$("#privilegeType").val('');
	$('#privilegeForm').jqxValidator('hide');
}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="privilegeForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Room Calander</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="privilegeId" name="privilegeId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Menu</td>
				<td><div id="menuConvert"> </div></td>
			</tr>
			<tr>
				<td>Privilege Type </td>
				<td><input type="text" id="privilegeType" name="privilegeType"
					class="text-input" title="privilegeType" /></td>
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
	<div>Delete Privilege</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="privilegeDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>privilege</b>?
					</td>
				</tr>
				<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="privilegeIdDelete" name="privilegeId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Menu Type</td>
				<td><input type="text" id="menuConvertDelete" name="menuConvert"
					class="text-input" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Privilege Type </td>
				<td><input type="text" id="privilegeTypeDelete" name="privilegeType"
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

