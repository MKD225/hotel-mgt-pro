<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<script type="text/javascript">
	function initialize(theme) {
	}
</script>

<p>hgjhgjhghgjhgj</p>

<h3>
	Welcome
	<s:property value="username"></s:property>
</h3>

<%
String name= "chanuka";
Date now = new Date();


%>
<%= name %>
</br><%= now %>