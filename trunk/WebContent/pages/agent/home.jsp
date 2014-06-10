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
									$("#agentIdDelete").val(dataRecord.agentId);
																				
									$("#firstNameDelete").val(dataRecord.firstName);
											
									$("#LastNameDelete").val(dataRecord.lastName);
											
									$("#countryDelete").val(dataRecord.country);
											
									$("#emailAddressDelete").val(dataRecord.emailAddress);
											
									$("#telephoneNumberDelete").val(dataRecord.telephoneNumber);
											
									$("#permitNumberDelete").val(dataRecord.permitNumber);
											
									$("#remarksDelete").val(dataRecord.remarks);
											
									$("#statusDelete").val(dataRecord.status);
											
									$("#popupDelete").jqxWindow('open');
								}
							} ]
				});
        
        $("#viewWindow").jqxWindow({
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
        
        $("#loginWindow").jqxWindow({
            width: 250,
            resizable: false,
            theme: theme,
            isModal: true,
            autoOpen: false,
            cancelButton: $("#cancelButton"),
            showAnimationDuration: 1000,
            modalOpacity: 0.45,
            initContent: function () {
            	$("#detailPannel").jqxPanel({
					width: '100%',
					height: 200,
					theme: theme
				});
            }
             
        });
        
        $("#loginButton").jqxButton({ 
        	theme: theme
        });
        
        $("#cancelButton").jqxButton({ 
        	theme: theme
        });
        
        $('#cancelButton').on('click', function () {
        	$('#loginWindow').jqxValidator('hide');
        });
        
        $('#loginWindow').jqxValidator({
            animationDuration: 50,
            rules: [{
                input: '#username',
                message: 'Username is required!',
                action: 'keyup, blur',
                rule: 'required'
            },{
                input: '#password',
                message: 'Password is required!',
                action: 'keyup, blur',
                rule: 'required'
            }, {
	            input: '#username',
	            message: 'Your username must be between 3 and 12 characters!',
	            action: 'keyup, blur',
	            rule: 'length=3,12'
	        }],
            theme: theme
        });
	}
</script>

<div>
	<input type="button" value="Add Member" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>
<div id="jqxgrid"></div>

<div id="viewWindow">
   <div>Member View</div>
   <div style="overflow-y: scroll;">
	   <div id='detailPannel'>
<div align="center" style="width: 300px;height: '100%';float: left;">
            <div id="upload" style="position: fixed;">
                <div class="file-preview" id="perview" style="" align="center">
                	<img alt="user" width="auto" height="auto" src="/slia/images/default-user.png"/>
                </div>
            </div>
        </div>
        <div style="overflow: hidden; margin-left: 200px;" align="left">
            <table class="register-table">
               
			<tr>
				<td>Title</td>
				<td>
					<div id='title'></div>
				</td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName" /></td>
			</tr>

			<tr>
				<td>Country:</td>
				<td>
					<div id="country"></div>
				</td>
			</tr>
			<tr>
				<td>Email Address</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress " /></td>
			</tr>
			<tr>
				<td>Telephone Number</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input" title="telephoneNumber " /></td>
			</tr>
			<tr>
				<td>Permit Number</td>
				<td><input type="text" id="permitNumber" name="permitNumber"
					class="text-input" title="permitNumber" /></td>
			</tr>
			<tr>
				<td>Remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks " /></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status " /></td>
			</tr>

                <tr>
                    <td colspan="2" style="padding: 5px;">
                        <div id="acceptInput" style="margin-left: 100px;">I accept terms</div>
                    </td>
                </tr>
                <tr>
		            <td align="right"></td>
		            <td style="padding-top: 10px;" align="right"><input id="Cancel" type="button" value="Close" /></td>
		        </tr>
            </table>
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
