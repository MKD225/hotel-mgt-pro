<%@ page contentType="text/html; charset=UTF-8"%>

<script type="text/javascript" src="/hotel/dev-js/roomCalanderJs.js"></script>


<div id="jqxgrid" style="float: left;"></div>
<div style="overflow: hidden; position: relative;">
	<form method="post" action="" id="roomCalanderForm"
		style="margin-left: 80px; margin-top: 20px;">
		<table>
			<tr>
				<td colspan="2" align="center"><b>Room Calander</b></td>
			</tr>
			<tr>
				<td colspan="2" align="center">&nbsp;<input type="hidden"
					id="roomCalanderId" name="roomCalanderId" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Room</td>
				<td><div id="roomConvert"></div></td>
			</tr>
			<tr>
				<td>Start Date</td>
				<td><div id='startDateTime'></div></td>
			</tr>
			<tr>
				<td>End Date</td>
				<td><div id='endDateTime'></div></td>

			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" id="status" name="status"
					class="text-input" title="status" /></td>
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
	<div>Delete Room Calender</div>
	<div style="overflow: hidden;">
		<form method="post" action="" id="roomcalancerDeleteForm">
			<table>
				<tr>
					<td colspan="2">Do you really want to <b>Delete</b> following
						<b>Membership Type</b>?
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">&nbsp;<input type="hidden"
						id="roomCalanderIdDelete" name="roomCalanderId"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Room</td>
					<td><input type="text" id="roomConvertDelete"
						name="roomConvert" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Start Date</td>
					<td><input type="text" id="startDateTimeDelete"
						name="startDateTime" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>End Date</td>
					<td><input type="text" id="endDateTimeDelete"
						name="endDateTime" class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Status</td>
					<td><input type="text" id="statusDelete" name="status"
						class="text-input" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Remarks</td>
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

