// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

var ln = Array();
var count = Array();
for (var i = 0; i < 5; i++) {
	ln[i] = "non";
	count[i] = "0";
}

console.log("ln.length " + ln.length + "개");

var chartColors = {
		  red: 'rgb(255, 99, 132)',
		  orange: 'rgb(255, 159, 64)',
		  yellow: 'rgb(255, 205, 86)',
		  green: 'rgb(75, 192, 192)',
		  blue: 'rgb(54, 162, 235)',
		  purple: 'rgb(153, 102, 255)',
		  grey: 'rgb(231,233,237)'
		};


var bardata = {
	labels : [ ln[0], ln[1], ln[2], ln[3], ln[4] ],
	datasets : [ {
		label : "Total",
		backgroundColor: [
	           chartColors.red,
	           chartColors.green,
	           chartColors.yellow,
	           chartColors.purple,
	           chartColors.blue],
		hoverBackgroundColor : chartColors.grey,
		borderColor : "#4e73df",
		data : [ count[0], count[1], count[2], count[3], count[4] ],
	} ]
};

var options = {
	maintainAspectRatio : false,
	layout : {
		padding : {
			left : 10,
			right : 25,
			top : 25,
			bottom : 0
		}
	},
	scales : {
		xAxes : [ {
			time : {
				unit : 'language'
			},
			gridLines : {
				display : false,
				drawBorder : false
			},
			ticks : {
				maxTicksLimit : 6
			},
			maxBarThickness : 25,
		} ],
		yAxes : [ {
			ticks : {
				min : 0,
				max : 10,
				maxTicksLimit : 5,
				padding : 10,

			},
			gridLines : {
				color : "rgb(234, 236, 244)",
				zeroLineColor : "rgb(234, 236, 244)",
				drawBorder : false,
				borderDash : [ 2 ],
				zeroLineBorderDash : [ 2 ]
			}
		} ],
	},
	legend : {
		display : false
	},
	tooltips : {
		titleMarginBottom : 10,
		titleFontColor : '#6e707e',
		titleFontSize : 14,
		backgroundColor : "rgb(255,255,255)",
		bodyFontColor : "#858796",
		borderColor : '#dddfeb',
		borderWidth : 1,
		xPadding : 15,
		yPadding : 15,
		displayColors : false,
		 mode: 'index',
		caretPadding : 10,
		callbacks : {
			label : function(tooltipItem, chart) {
				var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label
						|| '';
				return datasetLabel + ": " + totalCnt + " ";
			}
		}
	},
};



var ctx = document.getElementById("myBarChart");
var myBarChart = new Chart(ctx, {
	type : 'bar',
	data : bardata,
	options : options
});


var entries = Array();
var language = Array();
var lang = "lang";
var cnt = "cnt";
var totalCnt = 0;

$.ajax({
	type : 'POST',
	url : "/admin/getInterestLanguage",
	headers : {
		"Content-Type" : "application/json"
	},
	dataType : "json",
	error : function(err) {
		console.log("ajax getInterestLanguage 실행중 오류가 발생하였습니다.");
	},
	success : function(data) {
		console.log("char - bar ajax 실행됨");

		
		//entries
		entries = Object.entries(data);
		console.log(entries);
		
		for (var i = 0; i < entries.length; i++) {
			language[i] = { lang : entries[i][0], cnt : entries[i][1]};
		}
	
		var sortingField = "cnt";
		
		language.sort(function(a, b) { // 내림차순
			return b[sortingField] - a[sortingField];
		});
		console.log(language);
		
		var count = bardata.datasets[0].data;
		var ln = bardata.labels;
		
		
		
		for (var i = 0; i < ln.length; i++) {
			count[i] = language[i][cnt];
			ln[i] = language[i][lang];
			totalCnt += count[i];
		}
		
		bardata.datasets[0].data = count; 
		bardata.labels = ln; 
		myBarChart.update();
		
	}

});

