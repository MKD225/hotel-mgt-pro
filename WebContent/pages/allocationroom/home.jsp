<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/hotel/dev-js/allocationroom/home.js"></script>

<div>
	<input type="button" value="Add Agent" id='jqxButton' />
</div>
<div class="clr" style="height: 8px; width: '100%'"></div>


<div id="jqxgrid" style="float: left;"></div>


<!-- edit form -->
<div id="popupEdit">
	<div>Edit Agent</div>
	<div style="overflow-y: scroll;">
		<div id='detailPannel'>
			<div style="overflow: hidden;">
				<form method="post" action="" id="agentEditForm"
					style="margin-left: 80px; margin-top: 20px;">
					<table>
						<tr>
							<td colspan="2" align="center"><b>Agent</b></td>
						</tr>
						<tr>
							<td colspan="2" align="center">&nbsp;<input type="hidden"
								id="agentIdEdit" name="agentId" readonly="readonly" /></td>
						</tr>

						<tr>
							<td>Title</td>
							<td><input type="text" id="titleEdit" name="title"
								class="text-input" title="title" /></td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type="text" id="firstNameEdit" name="firstName"
								class="text-input" title="firstName" /></td>
						</tr>
						<tr>
							<td>Last Name</td>
							<td><input type="text" id="lastNameEdit" name="lastName"
								class="text-input" title="lastName" /></td>
						</tr>

						<tr>
							<td>Country</td>
							<td><input type="text" id="countryEdit" name="country"
								class="text-input" title="country" /></td>
						</tr>

						<tr>
							<td>Email Address</td>
							<td><input type="text" id="emailAddressEdit"
								name="emailAddress" class="text-input" title="emailAddress " /></td>
						</tr>
						<tr>
							<td>Telephone Number</td>
							<td><input type="text" id="telephoneNumberEdit"
								name="telephoneNumber" class="text-input"
								title="telephoneNumber " /></td>
						</tr>
						<tr>
							<td>Permit Number</td>
							<td><input type="text" id="permitNumberEdit"
								name="permitNumber" class="text-input" title="permitNumber" /></td>
						</tr>
						<tr>
							<td>Remarks</td>
							<td><input type="text" id="remarksEdit" name="remarks"
								class="text-input" title="remarks " /></td>
						</tr>
						<tr>
							<td>Status</td>
							<td><input type="text" id="statusEdit" name="status"
								class="text-input" title="status " /></td>
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
				<form method="post" action="" id="membershipTypeViewForm">
					<table>



						<tr>

							<td colspan="2"><input type="hidden" id="agentIdView"
								name="agentId" class="text-input" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>Title :</td>
							<td><input type="text" id="titleView" name="title"
								class="text-input" readonly="readonly" /></td>
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