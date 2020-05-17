// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}


var eL = Array();
var eL2 = Array();
for (var i = 0; i < 12; i++) {
	eL[i] = 0;
	eL2[i] = 0;
}


var dataVar = {
	labels : [ "Jan", "Feb", "Mar", "Apr", "May", "Jun"/* , "Jul", "Aug",
			"Sep", "Oct", "Nov", "Dec"  */],
	datasets : [ {
		data : [eL[0], eL[1], eL[2], eL[3], eL[4], eL[5], eL[6],
			eL[7], eL[8], eL[9], eL[10], eL[11] ],
		label : "2020",
		lineTension : 0.5,
		borderColor: 'rgba(75, 192, 192, 1)',
        backgroundColor: 'rgba(75, 192, 192, 0.2)',
		pointRadius : 2,
		pointBackgroundColor : "rgba(85, 77, 255, 1)",
		pointBorderColor : "rgba(85, 77, 255, 1)",
		pointHoverRadius : 3,
		pointHoverBackgroundColor : "rgba(143, 195, 255, 1)",
		pointHoverBorderColor : "rgba(143, 195, 255, 1)",
		pointHitRadius : 15,
		pointBorderWidth : 0,
		//fill: false,
	}/* ,{
		label: '2019',
		lineTension : 0.5,
		backgroundColor: 'rgba(255, 99, 132, 1)',
		borderColor: 'rgba(255, 99, 132, 1)',
		pointRadius : 3,
		pointBackgroundColor : "rgba(78, 115, 223, 1)",
		pointBorderColor : "rgba(78, 115, 223, 1)",
		pointHoverRadius : 3,
		pointHoverBackgroundColor : "rgba(78, 115, 223, 1)",
		pointHoverBorderColor : "rgba(78, 115, 223, 1)",
		pointHitRadius : 10,
		pointBorderWidth : 2,
		fill: false,
		data: [
			eL2[0], eL2[1], eL2[2], eL2[3], eL2[4], eL2[5], eL2[6],
			eL2[7], eL2[8], eL2[9], eL2[10], eL2[11]
		],
	} */]
};

var options = {
	maintainAspectRatio: false,
	layout: {
		 padding: {
		 left: 10,
		 right: 20,
		 top: 0,
		 bottom: 10
		 }
	},
	title : {
		display : true,
		text: '실시간 수익을 반영합니다.'
	},
	 tooltips: {
		 backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      titleMarginBottom: 5,
	      titleFontColor: '#6e707e',
	      titleFontSize: 20,
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      intersect: false,
	      mode: 'index',
	      caretPadding: 10
	 },
	 scales: {
         yAxes: [{
             ticks: {
                 beginAtZero: true,
                 callback: function(value, index, values) {
                     return float2dollar(value);
                 }
             }
         }]                
     }
};

function float2dollar(value){
    return "￦ "+(value).toFixed(1).replace(/\d(?=(\d{3})+\.)/g, '$&,');
}

var ctx = document.getElementById("myChart").getContext('2d');                                           
var myLineChart = new Chart(ctx, {
    type: 'line',
    data: dataVar, 
    options: options
});



//결과 값
var earningList = Array();
var test = Array();

//start Ajax 
$.ajax({
	type : 'POST',
	url : "/admin/getMonthlyEarning",
	headers : {
		"Content-Type" : "application/json"
	},
	dataType : "text",
	error : function(err) {
		console.log("ajax getMonthlyReport 실행중 오류가 발생하였습니다.");
	},
	success : function(data) {
		earningList = data;
		console.log("chart - line ajax 실행됨");
		var result = JSON.parse(data);
		var e = result.earningList;
		
		var eL = dataVar.datasets[0].data;
		
		for (var i = 0; i < eL.length; i++) {
            eL[i] = result[i]; 
        }
        dataVar.datasets[0].data = eL; 
        myLineChart.update();
	}

});

