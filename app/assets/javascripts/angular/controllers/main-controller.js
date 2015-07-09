/**
 * Created by jonybang on 10.07.15.
 */
angular.module('app').controller('MainCtrl', ['$scope', 'ProjectTask',
    function($scope, ProjectTask) {
        $scope.last_tasks = ProjectTask.query({sort: 'created_at DESC', limit: 3});
    }]);