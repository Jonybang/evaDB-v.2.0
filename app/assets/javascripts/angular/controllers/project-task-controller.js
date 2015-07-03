/**
 * Created by jonybang on 03.07.15.
 */
'use strict';

var app = angular.module('app');

app.controller('ProjectTasksController', ['$scope', 'ProjectTask', '$routeParams', function($scope, ProjectTask, $routeParams) {
    //Grab all the comments from the server
    $scope.project_tasks = ProjectTask.query({project_id: $routeParams.id});

    //Define a 'save' method which will be called from the view.
    $scope.save = function() {
        //Create the comment object to be sent to the server
        var obj = new ProjectTask({name: $scope.name, project_id: $routeParams.id});

        //Attempt a save to the back-end
        obj.$save(function(response) {

            //If we're successful then add the response (the object as the server sees it)
            // to our collection of comments
            $scope.project_tasks.unshift(response);

            //Empty the name & body
            $scope.name = "";

        }, function(response) {

            //If there's a failure set the 'errors' scope variable so it'll be reflected in the view.
            $scope.errors = response.data.errors;
        });
    }
}]);
