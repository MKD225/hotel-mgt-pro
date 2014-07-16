
/**
 * 
 * @param theme
 */
function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		 $("#startDateTime").jqxDateTimeInput({
			 //width: '300px',
			 height: '25px',
			 formatString: 'd',
			 theme: theme
		});
		 $("#endDateTime").jqxDateTimeInput({
			 //width: '300px',
			 height: '25px',
			 formatString: 'd',
			 theme: theme
		});
		 
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
				var formInput = $("#roomCalanderForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/roomcalander/ajxAddOrUpdate',
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
		
var url = "/hotel/room/ajxSearch";
        
        var sourceType = {
            datatype: "json",
            datafields: [{
                name: 'roomId'
            }, {
                name: 'roomNumber'
            }],
            id: 'roomId',
            url: url
        };
        
        var dataAdapterType = new $.jqx.dataAdapter(sourceType);
        
        $("#roomConvert").jqxDropDownList({
            selectedIndex: -1,
            source: dataAdapterType,
            displayMember: "roomNumber",
            valueMember: "roomId",
            promptText: "Room Number...",
            autoDropDownHeight: true,
            width: 250,
            height: 25,
            theme: theme
        });

		// Prepare the data
		var url = "/hotel/roomcalander/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'roomCalanderId',
				type : 'int'
			}, {
				name : 'roomNumber',
				type : 'String'
			}, {
				name : 'startDateTime',
				type : 'String'
			}, {

				name : 'endDateTime',
				type : 'String'
			}, {
				name : 'dateOfBirth',
				type : 'String'
			}, {
				name : 'status',
				type : 'String'
			}, {

				name : 'remarks',
				type : 'String'
			
			} ],
			id : 'roomCalanderId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					width : '50%',
					source : dataAdapter,
					theme : theme,
					autoheight : true,
					columns : [
							{
								text : 'room',
								datafield : 'roomNumber',
								align : 'left'
							},
							
							{
								text : 'startDate',
								datafield : 'startDateTime',
								align : 'left'
							},
							{
								text : 'endDate',
								datafield : 'endDateTime',
								align : 'left'
							},
							{
								text : 'status',
								datafield : 'status',
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
									var dataRecord = $("#jqxgrid").jqxGrid(
											'getrowdata', row);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipType").val(
											dataRecord.membershipType);
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
									$("#roomCalanderIdDelete").val(
											dataRecord.roomCalanderId);
									$("#roomConvertDelete").val(
											dataRecord.roomConvert);
									$("#startDateTimeDelete").val(
											dataRecord.startDateTime);
									$("#endDateTimeDelete").val(
											dataRecord.endDateTime);
									$("#statusDelete").val(
											dataRecord.status);
									$("#remarksDelete").val(
											dataRecord.remarks);
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});

// 		$('#roomCalanderForm').jqxValidator({
// 			rules : [ {
// 				input : '#anniversary',
// 				message : 'Membership Type is required!',
// 				action : 'keyup, blur',
// 				rule : 'required'
// 			}, {
//                 input: '#roomConvert',
//                 message: 'Please select practice type!',
//                 action: 'change, valuechanged',
//                 rule: function(input, commit) {
//                     var index = $("#roomConvert").jqxDropDownList('getSelectedIndex');
//                     return ! (index == -1);
//                 }
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

		$("#delete").jqxButton({
			width : "100px",
			theme : theme
		});
		// delete row when the user clicks the 'Delete' button.
		$("#delete").click(function() {
			//             var onSuccess = $('#admissionTypeDelete').jqxValidator('validate');
			//             if (onSuccess) {
			var formInput = $("#roomcalancerDeleteForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/roomcalander/ajxDelete',
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
		$("#roomCalanderId").val('');
		$("#roomConvert").val('');
		$("#startDateTime").val('');
		$("#endDateTime").val('');
		$("#status").val('');
		$("#remarks").val('');
		$('#roomCalanderForm').jqxValidator('hide');
	}