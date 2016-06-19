<%@page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.model.*" %>
<html> 
  <meta charset="UTF-8">
  <head>
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
    <script src="https://www.amcharts.com/lib/3/pie.js"></script>
    <script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
  </head>
  <body>
	<%
	Event e = new Event();
	out.println(e.getIntroduction());
	out.print("<img src='"+e.getImgPath()+"'>");
	%>
	<hr size="5" align="center" noshade width="90%" color="0000ff">
	<%
	int total = (int)request.getAttribute("event");
	out.print("reg num:" + total);
	%>
	<script type="text/javascript">
	// 以下的code...
	<h1>圓餅圖之資料呈現</h1> 
	var dataset = <%=(int[])request.getAttribute("sexRadio");%> 
	var chart = AmCharts.makeChart( "chartdiv", {
  "type": "pie",
  "theme": "light",
  "dataProvider": [ {
    "sex": "Male",
    "value": dataset[0];
  }, {
    "sex": "Female",
    "value": dataset[1];
  }],
  "valueField": "value",
  "titleField": "sex",
  "outlineAlpha": 0.4,
  "depth3D": 15,
  "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
  "angle": 30,
  "export": {
    "enabled": true
  }
} );
jQuery( '.chart-input' ).off().on( 'input change', function() {
  var property = jQuery( this ).data( 'property' );
  var target = chart;
  var value = Number( this.value );
  chart.startDuration = 0;

  if ( property == 'innerRadius' ) {
    value += "%";
  }

  target[ property ] = value;
  chart.validateNow();
} );
    </script>
	
	<input type="button" value="報名" onclick="applyform.jsp'">
	
  </body>
</html>  