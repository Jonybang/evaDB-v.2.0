/*!
 @package noty - jQuery Notification Plugin
 @version version: 2.2.4
 @contributors https://github.com/needim/noty/graphs/contributors

 @documentation Examples and Documentation - http://needim.github.com/noty/

 @license Licensed under the MIT licenses: http://www.opensource.org/licenses/mit-license.php
 */
angular.module('notyModule', []).provider('$noty', function () {
//    var settings  = $.noty.defaults;
//    angular.extend(settings, {
    angular.extend($.noty.defaults, {
        theme: 'relax',
        type: 'warning',
        layout: 'topCenter',
        timeout: 4000,
        animation : {
            open  : 'animated flipInX',
            close : 'animated flipOutX'
        }
    });
    var settings  = $.noty.defaults;

    return {
        settings: settings,
        $get: function () {
            var callNoty = function (newSettings) {
                return noty(newSettings || {});
            };

            return {
                show: function (message, type) {
                    callNoty({text: message || settings.text, type: type || settings.type});
                },
                closeAll: function () {
                    return $.noty.closeAll()
                },
                clearShowQueue: function () {
                    return $.noty.clearQueue();
                }.bind(this)
            }
        }

    };
});