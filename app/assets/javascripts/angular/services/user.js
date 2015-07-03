/**
 * Created by jonybang on 04.07.15.
 */
angular.module('app')
    .factory('User', function($http, $q) {
        var service = {
            get_id: function() {
                return $http.get('/user_id')
                    .then(function(response) {
                        return service.user_id = response.data;
                    });
            }
        };
        return service;
    });