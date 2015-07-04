'use strict';

var app = angular.module('app');
app.factory('Project', ['$resource', function($resource) {
    return $resource('/api/projects/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('ProjectTask', ['$resource', function($resource) {
    return $resource('/api/projects/:project_id/project_tasks/:id', {project_id: '@project_id', id: '@id'}, {'update': {method: 'PUT'}});
}]);