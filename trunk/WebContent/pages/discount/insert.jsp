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
         $('#initializedDate').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
		
         var date = new Date();
         date.setFullYear(2000, 0, 1);
         $('#closedDate').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });


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
			var onSuccess = $('#discountForm').jqxValidator('validate');
			if (onSuccess) {
				var formInput = $("#discountForm").serialize();
				$.ajax({
					type : 'post',
					url : '/hotel/discount/ajxAddOrUpdate',
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


		
		$('#discountForm').jqxValidator({
			rules : [ {
				input : '#type',
				message : 'Membership Type is required!',
				action : 'keyup, blur',
				rule : 'required'
			} ],
			theme : theme,
			scroll : false
		});

		
	}

	function clearText() {
		$("#type").val('');
		$("#initializedDate").val('');
		$("#closedDate").val('');
		$("#f_bpercentage").val('');
		$("#minibarpercentage").val('');
		$("#roompercentage").val('');
		$("#otherDiscountPercentage").val('');
		$("#status").val('');
		$('#discountForm').jqxValidator('hide');
	}
</script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="discountForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="1" align="center"><b>Discount</b></td>
			</tr>
			<tr>
				<td colspan="1" align="center">&nbsp;<input type="hidden"
					id="discounttId" name="discounttId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>type</td>
				</tr><tr>
				<td><input type="text" id="type" name="type" class="text-input"
					title="type" /></td>
			</tr>
			<tr>
				<td>Initialized Date</td>
				</tr><tr>
				<td><div id="initializedDate"></div>
					</td>
			</tr>
			<tr>
				<td>Closed Date</td>
				</tr><tr>
				<td><div id="closedDate"></div>
					</td>
			</tr>

			<tr>
				<td>F n B percentage</td>
				</tr><tr>
				<td><input type="text" id="f_bpercentage" name="f_bpercentage"
					class="text-input" title="f_bpercentage" /></td>
			</tr>


			<tr>
				<td>Minibar percentage</td>
				</tr>
				<tr>
				<td><input type="text" id="minibarpercentage"
					name="minibarpercentage" class="text-input"
					title="minibarpercentage" /></td>
					</tr>
			
			<tr>
				<td>Room percentage</td>
				</tr><tr>
				<td><input type="text" id="roompercentage"
					name="roompercentage" class="text-input" title="Room percentage" /></td>
			</tr>
			
			<tr>
				<td>Other Discount Percentage</td>
				</tr><tr>
				<td><input type="text" id="otherDiscountPercentage"
					name="otherDiscountPercentage" class="text-input"
					title="otherDiscountPercentage" /></td>
			</tr>

			<tr>
				<td>status</td>
				</tr>
				<tr>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status Type" /></td>
			</tr>

			<tr>
				<td>&nbsp;</td></tr>
				<tr>
				<td style="padding-top: 10px;"><input type="button" id="save"
					value="Save" style="margin-right: 5px;" /> <input id="clear"
					type="button" value="Clear" /></td>
			</tr>
		</table>
	</form>
</div>
