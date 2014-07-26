<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript">
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		var date = new Date();
		date.setFullYear(2000, 0, 1);
		$('#dateOfBirth').jqxDateTimeInput({
			theme : theme,
			height : 22,
			value : $.jqx._jqxDateTimeInput.getDateTime(date)
		});

		$("#save").jqxButton({
			width : "100px",
			theme : theme
		});
		$("#clear").jqxButton({
			width : "100px",
			theme : theme
		});
		
		var url = "/hotel/pages/sampleData/memberTitles.txt";
		// prepare the data
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'memberTitle'
			} ],
			url : url,
			async : false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// Create a jqxDropDownList
		$("#title").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapter,
			displayMember : "memberTitle",
			valueMember : "memberTitle",
			promptText : "Select title...",
			autoDropDownHeight : true,
			width : 150,
			height : 25,
			theme : theme
		});
		
		var url = "/hotel/pages/sampleData/country.txt";
		// prepare the data
		var source = {
			datatype : "json",
			datafields : [ {
				name : 'name'
			} ],
			url : url,
			async : false
		};
		var dataAdapter = new $.jqx.dataAdapter(source);
		// Create a jqxComboBox
		$("#country").jqxComboBox({
			selectedIndex : -1,
			source : dataAdapter,
			displayMember : "name",
			valueMember : "name",
			promptText : "Select country...",
			autoComplete : true,
			width : 210,
			height : 25,
			theme : theme
		});

		// update the edited row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#spouseForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#spouseForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/spouse/ajxAddOrUpdate',
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

		var url = "/hotel/guest/ajxSearch";

		var sourceType = {
			datatype : "json",
			datafields : [ {
				name : 'guestId'
			}, {
				name : 'firstName'
			}, {
				name : 'lastName'
			} ],
			id : 'guestId',
			url : url
		};

		var dataAdapterType = new $.jqx.dataAdapter(sourceType);

		$("#guestConvert").jqxDropDownList({
			selectedIndex : -1,
			source : dataAdapterType,
			displayMember : "firstName",

			valueMember : "guestId",
			promptText : "Guest...",
			autoDropDownHeight : true,
			width : 250,
			height : 25,
			theme : theme
		});

		// Prepare the data
		var url = "/hotel/spouse/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'guestId',
				type : 'int',
				map : 'guest>guestId'
			}, {
				name : 'title',
				type : 'String',

			}, {
				name : 'firstName',
				type : 'String',

			}, {
				name : 'lastName',
				type : 'String',

			}, {
				name : 'dateOfBirth',
				type : 'String',

			}, {
				name : 'passportNumber',
				type : 'String',

			}, {
				name : 'country',
				type : 'String',

			}, {
				name : 'nationality',
				type : 'String',
			}, {
				name : 'remarks',
				type : 'String',

			} ],
			id : 'guestId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid({
			width : '56%',
			source : dataAdapter,
			theme : theme,
			autoheight : true,
			columns : [ {
				text : 'title',
				datafield : 'title',
				align : 'left',
				width : '30%'
			},

			{
				text : 'First Name',
				datafield : 'firstName',
				align : 'left',
				width : '30%'
			}, {
				text : 'Last Name',
				datafield : 'lastName',
				align : 'left',
				width : '30%'
			}, {
				text : 'Date Of Birth',
				datafield : 'dateOfBirth',
				align : 'left',
				width : '30%'
			}, {
				text : 'Passport Number',
				datafield : 'passportNumber',
				align : 'left',
				width : '30%'
			}, {
				text : 'Country',
				datafield : 'country',
				align : 'left',
				width : '30%'
			}, {
				text : 'Nationality',
				datafield : 'nationality',
				align : 'left',
				width : '30%'
			}, {
				text : 'Remarks',
				datafield : 'remarks',
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
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					$("#spouseIdEdit").val(dataRecord.spouseId);
					$("#titleEdit").val(dataRecord.title);
					$("#firstNamedEdit").val(dataRecord.firstName);
					$("#lastNameEdit").val(dataRecord.lastName);
					$("#dateOfBirthEdit").val(dataRecord.dateOfBirth);
					$("#passportNumberEdit").val(dataRecord.passportNumber);
					$("#countryEdit").val(dataRecord.country);
					$("#nationalityEdit").val(dataRecord.nationality);
					$("#remarksEdit").val(dataRecord.remarks);
					$("#popupEdit").jqxWindow('open');
				}
			}, {
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
					var dataRecord = $("#jqxgrid").jqxGrid('getrowdata', row);
					$("#spouseIdDelete").val(dataRecord.spouseId);
					$("#titleDelete").val(dataRecord.title);
					$("#firstNameDelete").val(dataRecord.firstName);
					$("#lastNameDelete").val(dataRecord.lastName);
					$("#dateOfBirthDelete").val(dataRecord.dateOfBirth);
					$("#passportNumberDelete").val(dataRecord.passportNumber);
					$("#countryDelete").val(dataRecord.country);
					$("#nationalityDelete").val(dataRecord.nationality);
					$("#remarksDelete").val(dataRecord.remarks);

					$("#popupDelete").jqxWindow('open');
				}
			} ]
		});

		$('#spouseForm').jqxValidator({
			rules : [ {
				input : '#firstName',
				message : 'first Name is required!',
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
			var formInput = $("#spouseDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/spouse/ajxDelete',
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
		// delete row when the user clicks the 'Edit' button.
		$("#edit").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#spouseEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/spouse/ajxUpdate',
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
		$("#guestConvert").val('');
		$("#title").val('');
		$("#firstName").val('');
		$("#lastName").val('');
		$("#dateOfBirth").val('');
		$("#passportNumber").val('');
		$("#country").val('');
		$("#nationality").val('');
		$("#remarks").val('');
		$('#spouseForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="spouseForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Spouse</b></td>
			</tr>

			<tr>
				<td>Guest</td>
				<td><div id="guestConvert"></div></td>
			</tr>
			<tr>
				<td>Title</td>
				<td><div id="title"></div></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName " /></td>
			</tr>
			<tr>
				<td>Date Of Birth</td>
				<td><div id="dateOfBirth"></div></td>
			</tr>
			<tr>
				<td>Passport Number</td>
				<td><input type="text" id="passportNumber"
					name="passportNumber" class="text-input" title="passportNumber" /></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><div id="country" ></div></td>
			</tr>

			<tr>
				<td>Nationality</td>
				<td><input type="text" id="nationality" name="nationality"
					class="text-input" title="nationality " /></td>
			</tr>

			<tr>
				<td>Remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks" /></td>
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
		<form method="post" action="" id="spouseDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" id="spouseIdDelete"
						name="spouseId" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>title :</td>
					<td><input type="text" id="titleDelete" name="title"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>First Name :</td>
					<td><input type="text" id="firstNameDelete" name="firstName"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Last Name :</td>
					<td><input type="text" id="lastNameDelete" name="lastName"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Date Of Birth :</td>
					<td><input type="text" id="dateOfBirthDelete"
						name="dateOfBirth" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Passport Number :</td>
					<td><input type="text" id="passportNumberDelete"
						name="passportNumber" class="text-input" readonly="readonly" /></td>
				</tr>

				<tr>
					<td>Country :</td>
					<td><input type="text" id="countryDelete" name="country"
						class="text-input" readonly="readonly" /></td>
				</tr>


				<tr>
					<td>Nationality :</td>
					<td><input type="text" id="nationalityDelete"
						name="nationality" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Remarks :</td>
					<td><input type="text" id="remarksDelete" name="remarks"
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
	<div>Edit Shift</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="spouseEditForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Edit</b> following <b>Membership
							Type</b>?
					</td>
				</tr>

				<tr>
					<td colspan="2"><input type="hidden" id="spouseIdEdit"
						name="spouseId" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Title</td>
					<td><input type="text" id="titleEdit" name="title"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>First Name</td>
					<td><input type="text" id="firstNameEdit" name="firstName"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><input type="text" id="lastNameEdit" name="lastName"
						class="text-input" /></td>
				</tr>


				<tr>
					<td>Date Of Birth</td>
					<td><input type="text" id="dateOfBirthEdit" name="dateOfBirth"
						class="text-input" /></td>
				<tr>
					<td>country</td>
					<td><input type="text" id="countryEdit" name="country"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>Nationality</td>
					<td><input type="text" id="nationalityEdit" name="nationality"
						class="text-input" /></td>
				</tr>
				<tr>
					<td>Remarks</td>
					<td><input type="text" id="remarksEdit" name="remarks"
						class="text-input" /></td>
				</tr>



				<tr>
					<td style="padding-top: 10px;" align="center" colspan="2"><input
						style="margin-right: 5px;" type="button" id="edit" value="Edit" /><input
						id="cancelEdit" type="button" value="Cancel" /></td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>
		</form>
	</div>
</div>