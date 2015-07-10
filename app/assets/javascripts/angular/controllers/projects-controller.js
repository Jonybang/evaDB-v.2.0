/**
 * Created by jonybang on 03.07.15.
 */
'use strict';

var app = angular.module('app');

app.controller('ProjectsIndexCtrl', ['$scope', 'Project', 'User', function($scope, Project, User) {
    //Grab all forums from the server
    User.get_contact().then(function(result){
        $scope.contact = result;
        $scope.projects = Project.query({chief_id:result.id});
    });

    //Destroy method for deleting a forum
    $scope.destroy = function(index) {

        //Tell the server to remove the object
        Project.remove({id: $scope.projects[index].id}, function() {
            //If successful, remove it from our collection
            $scope.projects.splice(index, 1);
        });
    }
}]);

app.controller('ProjectsCreateCtrl', ['$scope', '$state', 'Project', 'User', function($scope, $state, Project, User) {
    //The save method which is called when the user wants to submit their data
    User.get_contact().then(function(result){
        $scope.contact = result;
    });
    $scope.save = function() {
        $scope.$broadcast('show-errors-check-validity');
        if (!$scope.projectForm.$valid) {
            return;
        }

        $scope.project.chief_id = $scope.contact.id;
        //Create the forum object to send to the back-end
        var project = new Project($scope.project);

        //Save the forum object
        project.$save(function() {

            //Redirect us back to the main page
            $state.go('app.projects');

        }, function(response) {

            //Post response objects to the view
            $scope.errors = response.data.errors;
        });
    }
}]);

//A controller to show the forum and all it's glory
app.controller('ProjectsShowCtrl', ['$scope', 'Project', 'ProjectTask', '$routeParams', function($scope, Project, ProjectTask, $routeParams) {
    //Grab the forum from the server
    $scope.project = Project.get({id: $routeParams.id})
}]);
