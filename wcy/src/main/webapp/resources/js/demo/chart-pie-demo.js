// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

$.ajax({
	type : 'POST',
	url : "/admin/getInterestLanguage",
	headers : {
		"Content-Type" : "application/json"
	},
	dataType : "text",
	error : function(err) {
		console.log("ajax getMonthlyReport 실행중 오류가 발생하였습니다.");
	},
	success : function(data) {
		earningList = data;
		console.log("ajax 실행됨");
		var result = JSON.parse(data);
		var e = result.earningList;
		console.log("result : " + result);
		
		var eL = dataVar.datasets[0].data;
		console.log("eL.length : " + eL.length);
		
		for (var i = 0; i < eL.length; i++) {
            eL[i] = result[i]; 
			console.log("eL[" + i + "] : " +  eL[i] + " = " + "result[" + i + "] : " + result[i]);
        }
        dataVar.datasets[0].data = eL; 
        myBarChart.update();
	}

});

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Direct", "Referral", "Social"],
    datasets: [{
      data: [55, 30, 15],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
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
    cutoutPercentage: 80,
  },
});
