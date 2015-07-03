/**
 * Created by jonybang on 03.07.15.
 */
'use strict';

var app = angular.module('app');

app.controller('ProjectIndexController', ['$scope', 'Project', function($scope, Project) {
    //Grab all forums from the server
    $scope.items = Project.query();

    //Destroy method for deleting a forum
    $scope.destroy = function(index) {

        //Tell the server to remove the object
        Project.remove({id: $scope.items[index].id}, function() {
            //If successful, remove it from our collection
            $scope.items.splice(index, 1);
        });
    }
}]);

app.controller('ProjectCreateController', ['$scope', '$location', 'Project', function($scope, $location, Project) {
    //The save method which is called when the user wants to submit their data
    $scope.save = function() {

        //Create the forum object to send to the back-end
        var project = new Project($scope.project);

        //Save the forum object
        project.$save(function() {

            //Redirect us back to the main page
            $location.path('/');

        }, function(response) {

            //Post response objects to the view
            $scope.errors = response.data.errors;
        });
    }
}]);

//A controller to show the forum and all it's glory
app.controller('ProjectShowController', ['$scope', 'Project', 'ProjectTask', '$routeParams', function($scope, Project, ProjectTask, $routeParams) {
    //Grab the forum from the server
    $scope.project = Project.get({id: $routeParams.id})
}]);
