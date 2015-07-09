/**
 * Created by jonybang on 03.07.15.
 */
'use strict';

var app = angular.module('app');

app.controller('ProjectIndexCtrl', ['$scope', 'Project', 'User', function($scope, Project, User) {
    //Grab all forums from the server
    User.get_contact().then(function(result){
        $scope.contact = result;
        $scope.items = Project.query({chief_id:result.id});
    });

    //Destroy method for deleting a forum
    $scope.destroy = function(index) {

        //Tell the server to remove the object
        Project.remove({id: $scope.items[index].id}, function() {
            //If successful, remove it from our collection
            $scope.items.splice(index, 1);
        });
    }
}]);

app.controller('ProjectCreateCtrl', ['$scope', '$location', 'Project', 'User', function($scope, $location, Project, User) {
    //The save method which is called when the user wants to submit their data
    User.get_contact().then(function(result){
        $scope.contact = result;
    });
    $scope.save = function() {

        $scope.project.chief_id = $scope.contact.id;
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
app.controller('ProjectShowCtrl', ['$scope', 'Project', 'ProjectTask', '$routeParams', function($scope, Project, ProjectTask, $routeParams) {
    //Grab the forum from the server
    $scope.project = Project.get({id: $routeParams.id})
}]);
