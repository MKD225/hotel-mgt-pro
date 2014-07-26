
	function initialize(theme) {

		$('.text-input').jqxInput({
			height : '25px',
			width : '207px',
			theme : theme
		});
		$('.text-input').addClass('jqx-rc-all');

		$("#jqxButton").on('click', function() {
			window.location.replace("/hotel/allocationroom/insert");
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
		var url = "/hotel/agent/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'room',
				type : 'String'
			}, {	
				name : 'reservation',
				type : 'int'
			}, {
				name : 'guest',
				type : 'String'
			}, {

				name : 'allocateDateTime',
				type : 'String'
			}, {
				name : 'deallocateDateTime',
				type : 'String'
			}, {
				name : 'extraBeds',
				type : 'String'
			

			} ],
			id : 'room',
			
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
				text : 'LastName',
				datafield : 'lastName',
				align : 'left'
			}, {
				text : 'country',
				datafield : 'country',
				align : 'left'
			}, {
				text : 'emailAddress',
				datafield : 'emailAddress',
				align : 'left'
			}, {
				text : 'telephoneNumber',
				datafield : 'telephoneNumber',
				align : 'left'
			}, {
				text : 'permitNumber',
				datafield : 'permitNumber',
				align : 'left'
			}, {
				text : 'remarks',
				datafield : 'remarks',
				align : 'left'
			}, {
				text : 'status',
				datafield : 'status',
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
					$("#agentIdEdit").val(dataRecord.agentId);
					$("#titleEdit").val(dataRecord.title);
					$("#firstNameEdit").val(dataRecord.firstName);
					$("#lastNameEdit").val(dataRecord.lastName);
					$("#countryEdit").val(dataRecord.country);
					$("#emailAddressEdit").val(dataRecord.emailAddress);
					$("#telephoneNumberEdit").val(dataRecord.telephoneNumber);
					$("#permitNumberEdit").val(dataRecord.permitNumber);
					$("#remarksEdit").val(dataRecord.remarks);
					$("#statusEdit").val(dataRecord.status);
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

					$("#agentIdView").val(dataRecord.agentId);

					$("#titleView").val(dataRecord.title);

					$("#firstNameView").val(dataRecord.firstName);

					$("#LastNameView").val(dataRecord.lastName);

					$("#countryView").val(dataRecord.country);

					$("#emailAddressView").val(dataRecord.emailAddress);

					$("#telephoneNumberView").val(dataRecord.telephoneNumber);

					$("#permitNumberView").val(dataRecord.permitNumber);

					$("#remarksView").val(dataRecord.remarks);

					$("#statusView").val(dataRecord.status);

					$("#popupView").jqxWindow('open');
				}
			} ]
		});

		// 		$('#agentEditForm').jqxValidator({
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

			// 				            var onSuccess = $('#agentEditForm').jqxValidator('validate');
			// 				            if (onSuccess) {
			var formInput = $("#agentEditForm").serialize();
			$.ajax({
				type : 'post',
				url : '/hotel/agent/ajxAddOrUpdate',
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
