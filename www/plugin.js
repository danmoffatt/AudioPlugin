
var exec = require('cordova/exec');

var PLUGIN_NAME = ‘AudioPlugin’;

var AudioPlugin = {
  play: function(phrase, cb) {
    exec(cb, null, PLUGIN_NAME, ‘play’, [phrase]);
  },
  stop: function(cb) {
    exec(cb, null, PLUGIN_NAME, ‘stop’, []);
  }
};

module.exports = AudioPlugin;
