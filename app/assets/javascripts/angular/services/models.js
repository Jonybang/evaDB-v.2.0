'use strict';

var app = angular.module('app');
app.factory('Contact', ['$resource', function($resource) {
    return $resource('/api/contacts/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('Project', ['$resource', function($resource) {
    return $resource('/api/projects/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('ProjectStatus', ['$resource', function($resource) {
    return $resource('/api/project_statuses/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

//app.factory('ProjectTask', ['$resource', 'Helpers', function($resource, Helpers) {
//    return $resource('/api/project_tasks/:id',
//        {id: '@id'},
//        {'update': {
//            method: 'PUT'
//        }});
//}]);
app.factory('ProjectTask', ['railsResourceFactory', 'railsSerializer', function (railsResourceFactory, railsSerializer) {
    return railsResourceFactory({
        url: '/api/project_tasks',
        name: 'project_task',
        serializer: railsSerializer(function () {
            this.exclude('performers');
            this.exclude('project_status');
            this.exclude('project');
            //this.nestedAttribute('performers');
            this.exclude('contact');
            //this.resource('performers', 'Contact');
        })
    });
}]);