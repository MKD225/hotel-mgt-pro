<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	function initialize(theme){
		$("#jqxButton").jqxButton({ width: '150', theme: theme });
		
		$("#jqxButton").on('click', function () {
			window.location.replace("/slia/Member/insert");
        });
		
		$('.text-log').jqxInput({ height: '25px',theme: theme });
		$('.text-log').addClass('jqx-rc-all');
		

		// Prepare the data
		var url = "/hotel/agent/ajxSearch";
		var source = {
			datatype : "json",
			mtype : 'POST',
			datafields : [ {
				name : 'agentId',
				type : 'int'
			}, {
				name : 'firstName',
				type : 'String'
			}, {
				
				name : 'lastName',
				type : 'String'
			}, {
				name : 'country',
				type : 'String'
			}, {
				name : 'emailAddress',
				type : 'String'
			}, {
			
				name : 'telephoneNumber',
				type : 'String'
			}, {
				name : 'permitNumber',
				type : 'String'
			}, {
				
				name : 'remarks',
				type : 'String'
			}, {
				name : 'status',
				type : 'String'
			
			
			} ],
			id : 'agentId',
			url : url,
			root : 'data'
		};
		var dataAdapter = new $.jqx.dataAdapter(source);

		// initialize jqxGrid
		$("#jqxgrid").jqxGrid(
				{
					 width: '100%',
			            autoheight: true,
			            source: dataAdapter,
			            showfilterrow: true,
			            filterable: true,
			            columnsresize: true,
			            pageable: true,
			            pagesize: 20,
			            autorowheight: true,
			            rowsheight: 80,
			            theme: theme,
					columns : [
							{text : 'firstName',datafield : 'firstName',align : 'left'},
							{text : 'LastName',datafield : 'lastName',align : 'left'},
							{text : 'country',datafield : 'country',align : 'left'},
							{text : 'emailAddress',datafield : 'emailAddress',align : 'left'},
							{text : 'telephoneNumber',datafield : 'telephoneNumber',align : 'left'},
							{text : 'permitNumber',datafield : 'permitNumber',align : 'left'},
							{text : 'remarks',datafield : 'remarks',align : 'left'},
							{text : 'status',datafield : 'status',align : 'left'
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
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipTypeId").val(
											dataRecord.membershipTypeId);
									$("#membershipType").val(
											dataRecord.membershipType);
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
									$("#fname:text").val(dataRecord.firstName);
									$("#agentIdView").val(dataRecord.agentId);
																				
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
        
        $("#popupView").jqxWindow({
            width: '75%',
            resizable: false,
            theme: theme,
            isModal: true,
            autoOpen: false,
            cancelButton: $("#Cancel"),
            showAnimationDuration: 1000,
            modalOpacity: 0.45           
        });
        
        $("#Cancel").jqxButton({ 
        	theme: theme
        });
        
//         $("#loginWindow").jqxWindow({
//             width: 250,
//             resizable: false,
//             theme: theme,
//             isModal: true,
//             autoOpen: false,
//             cancelButton: $("#cancelButton"),
//             showAnimationDuration: 1000,
//             modalOpacity: 0.45,
//             initContent: function () {
//             	$("#detailPannel").jqxPanel({
// 					width: '100%',
// 					height: 200,
// 					theme: theme
// 				});
//             }
             
//         });
        
//         $("#loginButton").jqxButton({ 
//         	theme: theme
//         });
        
//         $("#cancelButton").jqxButton({ 
//         	theme: theme
//         });
        
//         $('#cancelButton').on('click', function () {
//         	$('#loginWindow').jqxValidator('hide');
//         });
        
//         $('#loginWindow').jqxValidator({
//             animationDuration: 50,
//             rules: [{
//                 input: '#username',
//                 message: 'Username is required!',
//                 action: 'keyup, blur',
//                 rule: 'required'
//             },{
//                 input: '#password',
//                 message: 'Password is required!',
//                 action: 'keyup, blur',
//                 rule: 'required'
//             }, {
// 	            input: '#username',
// 	            message: 'Your username must be between 3 and 12 characters!',
// 	            action: 'keyup, blur',
// 	            rule: 'length=3,12'
// 	        }],
//             theme: theme
//         });
	}
</script>

<div>
	<input type="button" value="Add Agent" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>
<div id="jqxgrid"></div>

<div id="popupView">
	<div>View Agent<input id=fname/></div>
	 <div style="overflow-y: scroll;">
	 <div id='detailPannel'>
	<div style="overflow: hidden;">
		<form method="post" action="" id="membershipTypeDeleteForm">
			<table>
				


				<tr>

					<td colspan="2"><input type="hidden" id="agentIdView"
						name="agentId" class="text-input" readonly="readonly" /></td>
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
					<td>Country</td>
					<td><input type="text" id="countryView" name="country"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Email Address :</td>
					<td><input type="text" id="emailAddressView"
						name="emailAddress" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Telephone Number :</td>
					<td><input type="text" id="telephoneNumberView"
						name="telephoneNumber" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Permit Number:</td>
					<td><input type="text" id="permitNumberView"
						name="permitNumber" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Remarks :</td>
					<td><input type="text" id="remarksView" name="remarks"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Status :</td>
					<td><input type="text" id="statusView" name="status"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td style="padding-top: 10px;" align="center" colspan="1">
					<input id="Cancel" type="button"
						value="Close" /></td>
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


<div id="loginWindow">
   <div>Login</div>
   <div style="overflow: hidden;">
        <table>
            <tr>
                <td>Username :</td>
                <td>
                    <input type="text" placeHolder="Username" id="username" name="username" title="user-name" class="text-log"/>
                </td>
            </tr>
            <tr>
                <td>Password :</td>
                <td>
                    <input type="password" placeHolder="Password" id="password" name="password" title="password" class="text-log"/>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-top: 10px;">
                    <input type="submit" value="Login" style="margin-bottom: 5px;" id="loginButton" />
                    <input type="button" value="Cancel" id="cancelButton" />
                </td>
            </tr>
        </table>
   </div>
</div>
