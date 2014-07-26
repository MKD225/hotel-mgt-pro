<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>YYYYYYYYYYYYYYYYYYY</title>

    <link rel="stylesheet" href="/hotel/css/style.css" type="text/css" />
    <link rel="stylesheet" href="/hotel/jqwidgets/styles/jqx.base.css" type="text/css" />
    <link rel="stylesheet" href="/hotel/jqwidgets/styles/jqx.web.css" type="text/css" />
    <script type="text/javascript" src="/hotel/scripts/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="/hotel/jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="/hotel/jqwidgets/jqx-all.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            var theme = "web";

			createMenu(theme);            
            var centerItems = function () {
                var firstItem = $($("#jqxMenu ul:first").children()[0]);
                firstItem.css('margin-left', 0);
                var width = 0;
                var borderOffset = 2;
                $.each($("#jqxMenu ul:first").children(), function () {
                    width += $(this).outerWidth(true) + borderOffset;
                });
                var menuWidth = $("#jqxMenu").outerWidth();
                firstItem.css('margin-left', (menuWidth / 2) - (width / 2));
            }
            centerItems();
            $(window).resize(function () {
                centerItems();
            });

            var source = [
                "Shine Gray",
                "Light Blue",
                "Dark Balck",
                "Green",
            ];

            // Create a jqxDropDownList
            $("#themeMenu").jqxDropDownList({
                source: source,
                selectedIndex: 0,
                width: '160',
                height: '20',
                dropDownHeight: 50,
                //disabled: true,
                theme: theme
            });
            
            initialize(theme);
        });
    </script>
</head>

<body class='jqx-widget'>
    <div class="main" id='contents'>
		<div class="header_resize">
            <div class="header">
            	<tiles:insertAttribute name="header" />
                <div class="title">
                    <h2><tiles:insertAttribute name="title" /></h2>
                    <h4><s:property value="#session.username"></s:property></h4>
                </div>
                <div class="clr"></div>
                <div class="clr"></div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="header_blog2">
        	<tiles:insertAttribute name="menu" />
            <div class="clr"></div>
        </div>
        <div class="clr"></div>
        <div class="body">
            <div class="body_resize">
                <div class="full">
                    <div id="main_content">
                        <tiles:insertAttribute name="body" />
					</div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
		<tiles:insertAttribute name="footer" />
    </div>
    <div align=center class="company">
    	<p><a href="#"></a></p>
    </div>
</body>
</html>