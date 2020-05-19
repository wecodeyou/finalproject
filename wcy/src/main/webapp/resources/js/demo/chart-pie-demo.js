// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';


var fL = Array();
var fCnt = Array();
for (var i = 0; i < 4; i++) {
	fL[i] = "non";
	fCnt[i] = "0";
}
var pieText = "?";


var chartColors = {
		  red: 'rgb(255, 99, 132)',
		  orange: 'rgb(255, 159, 64)',
		  yellow: 'rgb(255, 205, 86)',
		  green: 'rgb(75, 192, 192)',
		  blue: 'rgb(54, 162, 235)',
		  purple: 'rgb(153, 102, 255)',
		  grey: 'rgb(231,233,237)'
		};

var pieData = {
		labels : [ fL[0], fL[1], fL[2], fL[3] ],
		datasets : [ {
			label : "Total",
			backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc', '#858796'],
		    hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
		    hoverBorderColor: "rgba(234, 236, 244, 1)",
			data : [ fCnt[0], fCnt[1], fCnt[2], fCnt[3] ],
		} ]
	};

var options = {
		 maintainAspectRatio: false,
		 elements: {
			    center: {
			      text: "인터넷 검색",
			      color: '#4e73df', // Default is #000000
			      fontStyle: [ 'Arial', "bold" ],// Default is Arial
			      sidePadding: 20, // Default is 20 (as a percentage)
			      minFontSize: 25, // Default is 20 (in px), set to false and text will not wrap.
			      lineHeight: 30 // Default is 25 (in px), used for when text wraps
			    }
			  },
		 animation: {
	         animateRotate: true,
	         animateScale: false
	       },
		    tooltips: {
		      backgroundColor: "rgb(255,255,255)",
		      bodyFontColor: "#858796",
		      borderColor: '#dddfeb',
		      borderWidth: 1,
		      xPadding: 15,
		      yPadding: 15,
		      displayColors: false,
		      caretPadding: 10,
		    },
		    legend: {
		      display: false
		    },
		    cutoutPercentage: 70,
		    };


//Create Pie Chart 
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
	type: 'doughnut',
	data : pieData,
	options : options
});


var fEntries = Array();
var funnelList = Array();
var funnel = "funnel";
var fCount = "fCount";
var totalFCnt = 0;

$.ajax({
	type : 'POST',
	url : "/admin/getInterestFunnels",
	headers : {
		"Content-Type" : "application/json"
	},
	dataType : "json",
	error : function(err) {
		console.log("ajax getInterestFunnels 실행중 오류가 발생하였습니다.");
	},
	success : function(data) {
		console.log("char - pie ajax 실행됨");

		
		//entries
		fEntries = Object.entries(data);
		console.log(fEntries);
		
		for (var i = 0; i < fEntries.length; i++) {
			funnelList[i] = { funnel : fEntries[i][0], fCount : fEntries[i][1]};
		}
		console.log(funnelList);
		
		console.log("======");
		var sortingField = "fCount";
		
		funnelList.sort(function(a, b) { // 내림차순
			return b[sortingField] - a[sortingField];
		});
		
		console.log(funnelList);
		console.log(funnelList[0][funnel]);
		
		var fCnt = pieData.datasets[0].data;
		var fL = pieData.labels;
		
		
		console.log('fL.length : ' +fL.length);
		for (var i = 0; i < fL.length; i++) {
			fCnt[i] = funnelList[i][fCount];
			fL[i] = funnelList[i][funnel];
			totalCnt += count[i];
		}
		
		
		pieData.datasets[0].data = fCnt; 
		pieData.labels = fL; 
		//options.elements = pieText;
		myPieChart.update();
		
		$("#spanId1").text(fL[0]);
		$("#spanId2").text(fL[1]);
		$("#spanId3").text(fL[2]);
		$("#spanId4").text(fL[3]);
		
		
	}

});

Chart.pluginService.register({
	  beforeDraw: function(chart) {
	    if (chart.config.options.elements.center) {
	      // Get ctx from string
	      var ctx = chart.chart.ctx;

	      // Get options from the center object in options
	      var centerConfig = chart.config.options.elements.center;
	      var fontStyle = centerConfig.fontStyle || 'Arial';
	      var txt = centerConfig.text;
	      var color = centerConfig.color || '#000';
	      var maxFontSize = centerConfig.maxFontSize || 75;
	      var sidePadding = centerConfig.sidePadding || 20;
	      var sidePaddingCalculated = (sidePadding / 100) * (chart.innerRadius * 2)
	      // Start with a base font of 30px
	      ctx.font = "30px " + fontStyle;

	      // Get the width of the string and also the width of the element minus 10 to give it 5px side padding
	      var stringWidth = ctx.measureText(txt).width;
	      var elementWidth = (chart.innerRadius * 2) - sidePaddingCalculated;

	      // Find out how much the font can grow in width.
	      var widthRatio = elementWidth / stringWidth;
	      var newFontSize = Math.floor(30 * widthRatio);
	      var elementHeight = (chart.innerRadius * 2);

	      // Pick a new font size so it will not be larger than the height of label.
	      var fontSizeToUse = Math.min(newFontSize, elementHeight, maxFontSize);
	      var minFontSize = centerConfig.minFontSize;
	      var lineHeight = centerConfig.lineHeight || 25;
	      var wrapText = false;

	      if (minFontSize === undefined) {
	        minFontSize = 20;
	      }

	      if (minFontSize && fontSizeToUse < minFontSize) {
	        fontSizeToUse = minFontSize;
	        wrapText = true;
	      }

	      // Set font settings to draw it correctly.
	      ctx.textAlign = 'center';
	      ctx.textBaseline = 'middle';
	      var centerX = ((chart.chartArea.left + chart.chartArea.right) / 2);
	      var centerY = ((chart.chartArea.top + chart.chartArea.bottom) / 2);
	      ctx.font = fontSizeToUse + "px " + fontStyle;
	      ctx.fillStyle = color;

	      if (!wrapText) {
	        ctx.fillText(txt, centerX, centerY);
	        return;
	      }

	      var words = txt.split(' ');
	      var line = '';
	      var lines = [];

	      // Break words up into multiple lines if necessary
	      for (var n = 0; n < words.length; n++) {
	        var testLine = line + words[n] + ' ';
	        var metrics = ctx.measureText(testLine);
	        var testWidth = metrics.width;
	        if (testWidth > elementWidth && n > 0) {
	          lines.push(line);
	          line = words[n] + ' ';
	        } else {
	          line = testLine;
	        }
	      }

	      // Move the center up depending on line height and number of lines
	      centerY -= (lines.length / 2) * lineHeight;

	      for (var n = 0; n < lines.length; n++) {
	        ctx.fillText(lines[n], centerX, centerY);
	        centerY += lineHeight;
	      }
	      //Draw text in center
	      ctx.fillText(line, centerX, centerY);
	    }
	  }
	});




