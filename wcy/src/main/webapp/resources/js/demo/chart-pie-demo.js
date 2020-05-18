// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';


var fL = Array();
var fCnt = Array();
for (var i = 0; i < 4; i++) {
	fL[i] = "non";
	fCnt[i] = "0";
}


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
		myPieChart.update();
		
		$("#spanId1").text(fL[0]);
		$("#spanId2").text(fL[1]);
		$("#spanId3").text(fL[2]);
		$("#spanId4").text(fL[3]);
		
		
	}

});











