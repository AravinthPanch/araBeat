// required modules
const Smoothie = require('smoothie');

// time series data setup
var plot_data = new Smoothie.TimeSeries();

// create chart
function creat_chart() {

  // setup a chart
  var chart = new Smoothie.SmoothieChart({
    // scrollBackwards: true,
    minValueScale:-0.1,
    maxValueScale:1,
    tooltip: true
  });

  // add data
  chart.addTimeSeries(plot_data, {
    strokeStyle: 'rgba(0, 255, 0, 1)',
    lineWidth: 2
  });

  // stream it to the canvan
  chart.streamTo(document.getElementById("chart"), 0);
}


exports.creat_chart = creat_chart
exports.plot_data = plot_data
