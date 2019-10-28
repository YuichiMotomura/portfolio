document.addEventListener('turbolinks:load', function () {
  if(gon.data != null) {
    for ( var i = 0; i < gon.data.length; i++ ) {
      var ctx = document.getElementById(`myChart${i}`);
      
      var options  = {
        scale: {
          ticks: {
            min: 0,
            max: 5,
            stepSize: 1,
            display: false
          }
        },
        legend: {
          display: false
        }
      }
      var myRadarChart = new Chart(ctx, {
        type: 'radar',
        data: {
          labels: ['レトロ', '珍しい', 'インスタ映え', 'エモい', 'かわいい'],
          datasets: [{
          data: gon.data[i]
        }]
        },
        options: options
      });
    }
  }
});