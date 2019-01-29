var random = new TimeSeries();

setInterval(
  function() {
    random.append(new Date().getTime(), Math.random() * 10000);
  },
  500);

function createTimeline() {

  var chart = new SmoothieChart({
    scrollBackwards: true,
    tooltip: true
  });

  chart.addTimeSeries(random, {
    strokeStyle: 'rgba(0, 255, 0, 1)',
    lineWidth: 2
  });

  chart.streamTo(document.getElementById("chart"), 500);
}
