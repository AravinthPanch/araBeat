// This file is required by the index.html file and will
// be executed in the renderer process for that window.
// All of the Node.js APIs are available in this process.

window.$ = window.jQuery = require('jquery');
const Smoothie = require('smoothie');

var random = new Smoothie.TimeSeries();

setInterval(
  function() {
    random.append(new Date().getTime(), Math.random() * 10000);
  },
  500);

function createTimeline() {

  var chart = new Smoothie.SmoothieChart({
    scrollBackwards: true,
    tooltip: true
  });

  chart.addTimeSeries(random, {
    strokeStyle: 'rgba(0, 255, 0, 1)',
    lineWidth: 2
  });

  chart.streamTo(document.getElementById("chart"), 500);
}



// DOM Ready
$(document).ready(function() {
  createTimeline();
})
