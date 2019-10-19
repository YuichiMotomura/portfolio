document.addEventListener('turbolinks:load', function () {
  
  var data = {
    labels: ['レトロ度', 'レア度', '美味度', '強烈度', '哀愁度', 'かわいい度'],
    datasets: [
      {
        label: "",
        data: [5, 3, 4, 1, 4],
        
       }
    ]
  }
  // var ctx = document.getElementsByClassName("mychart").getContext('2d');
  var ctx = document.getElementsByClassName("mychart");
  var ctx = Array.from(ctx);
  console.log(ctx);
  var options  = {
    scale: {
      ticks: {
        min: 0,
        max: 5,
        stepSize: 1
      }
    },
    legend: {
      display: false
    }
  }
  ctx.forEach(function(ele){
    var myRadarChart = new Chart(ele, {
      type: 'radar',
      data: data,
      options: options
    });
  });
});