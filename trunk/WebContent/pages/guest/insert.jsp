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
         $('#dateOfBirth').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
		
         var date = new Date();
         date.setFullYear(2000, 0, 1);
         $('#anniversary').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
		

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
        var source =
        {
            datatype: "json",
            datafields: [{ name: 'memberTitle' }],
            url: url,
            async: false
        };
        var dataAdapter = new $.jqx.dataAdapter(source);

        // Create a jqxDropDownList
        $("#title").jqxDropDownList({
            selectedIndex: -1,
            source: dataAdapter,
            displayMember: "memberTitle",
            valueMember: "memberTitle",
            promptText: "Select title...",
            autoDropDownHeight: true,
            width: 150,
            height: 25,
            theme: theme
        });
		
        var url = "/hotel/pages/sampleData/country.txt";
        // prepare the data
        var source =
        {
            datatype: "json",
            datafields: [{ name: 'name' }],
            url: url,
            async: false
        };
        var dataAdapter = new $.jqx.dataAdapter(source);
        // Create a jqxComboBox
        $("#country").jqxComboBox({ 
        	selectedIndex: -1,
        	source: dataAdapter,
        	displayMember: "name",
        	valueMember: "name",
        	promptText: "Select country...",
        	autoComplete: true,
        	width: 210,
        	height: 25,
            theme: theme
        });
		
     // update the edited row when the user clicks the 'Save' button.
		$("#save").click(function() {
			var onSuccess = $('#guestAddForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#guestAddForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/guest/ajxAddOrUpdate',
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


		
		$('#guestAddForm').jqxValidator({
			rules : [ {
				input : '#firstName',
				message : 'First Name is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

		
	}

	function clearText() {
		$("#firstName").val('');
		$("#lastName").val('');
		$("#dateOfBirth").val('');
		$("#city").val('');
		$("#country").val('');
		$("#countryCode").val('');
		$("#telephoneNumber").val('');
		$("#emailAddress").val('');
		$("#fax").val('');
		$("#mailAddress").val('');
		$("#nationality").val('');
		$("#nicNumber").val('');
		$("#passportNumber").val('');
		$("#anniversary").val('');
		$("#remarks").val('');
		$('#guestAddForm').jqxValidator('hide');
	}
</script>



<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="guestAddForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Guest</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="guestId" name="guestId" readonly="readonly" /></td>
			</tr>
			
			<tr>
				<td>Title </td>
				<td><div  id="title" ></div>
					</td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" id="firstName" name="firstName"
					class="text-input" title="firstName Type" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" id="lastName" name="lastName"
					class="text-input" title="lastName Type" /></td>
			</tr>

			<tr>
				<td>dateOfBirth </td>
				<td><div id="dateOfBirth" ></div>
					</td>
			</tr>
			<tr>
				<td>city </td>
				<td><input type="text" id="city" name="city" class="text-input"
					title="city Type" /></td>
			</tr>
			<tr>
				<td>country</td>
				<td><div id="country" ></div>
					</td>
			</tr>
			<tr>
				<td>countryCode</td>
				<td><input type="text" id="countryCode" name="countryCode"
					class="text-input" title="countryCode Type" /></td>
			</tr>

			<tr>
				<td>telephoneNumber</td>
				<td><input type="text" id="telephoneNumber"
					name="telephoneNumber" class="text-input"
					title="telephoneNumber Type" /></td>
			</tr>

			<tr>
				<td>emailAddress</td>
				<td><input type="text" id="emailAddress" name="emailAddress"
					class="text-input" title="emailAddress " /></td>
			</tr>
			<tr>
				<td>Fax No</td>
				<td><input type="text" id="fax" name="fax" class="text-input"
					title="fax Type" /></td>
			</tr>



			<tr>
				<td>Mail Address </td>
				<td><input type="text" id="mailAddress" name="mailAddress"
					class="text-input" title="mailAddress " /></td>
			</tr>
			<tr>
				<td>Nationality</td>
				<td><input type="text" id="nationality" name="nationality"
					class="text-input" title="nationality " /></td>
			</tr>
			<tr>
				<td>nicNumber</td>
				<td><input type="text" id="nicNumber" name="nicNumber"
					class="text-input" title="nicNumber " /></td>
			</tr>
			<tr>
				<td>passportNumber</td>
				<td><input type="text" id="passportNumber"
					name="passportNumber" class="text-input"
					title="passportNumber " /></td>
			</tr>

			<tr>
				<td>anniversary</td>
				<td><div id="anniversary"></div> 
					</td>
			</tr>

			<tr>
				<td>remarks</td>
				<td><input type="text" id="remarks" name="remarks"
					class="text-input" title="remarks " /></td>
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
