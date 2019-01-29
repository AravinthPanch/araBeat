// required modules
window.$ = window.jQuery = require('jquery');
var SerialPort = require('serialport');
var Readline = SerialPort.parsers.Readline
var plot = require('./plot');
var port = null;
var count = 0;

// list available ports
function list_serial_ports() {
  SerialPort.list(function(err, ports) {
    ports.forEach(function(port) {
      console.log(port.comName)
    })
  });
}

// open a serial port
function open_serial_port() {
  port = new SerialPort('/dev/tty.usbserial-AJ02WUYE', {
    baudRate: 115200,
    parser: new Readline({
      delimiter: '\r\n'
    })

  });

  // Read the port data
  port.on("open", function() {

    console.log('port is open');

    port.on('data', function(serial_data) {
      for (var i = 0; i < serial_data.length; i++) {
        plot.plot_data.append(new Date().getTime(), serial_data[i]);
      }

    });
  });
}



// DOM Ready
$(document).ready(function() {
  plot.creat_chart();

  // list_serial_ports();
  open_serial_port();
});
