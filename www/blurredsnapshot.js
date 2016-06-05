var exec = require('cordova/exec');

exports.addBlurredSnapshot = function(arg0, success, error) {
    exec(success, error, "cordova-plugin-blurred-snapshot", "addBlurredSnapshot", [arg0]);
};
exports.removeBlurredSnapshot = function(arg0, success, error) {
    exec(success, error, "cordova-plugin-blurred-snapshot", "removeBlurredSnapshot", [arg0]);
};