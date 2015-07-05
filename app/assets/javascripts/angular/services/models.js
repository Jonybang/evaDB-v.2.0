'use strict';

function parseResponseDates(response) {
    var data = response.resource, key, value;
    for (key in data) {
        if(Object.prototype.toString.call(data[key]) === '[object Date]')
            data[key] = data[key].getFullYear() +'-'+ ("0" + (data[key].getMonth() + 1)).slice(-2) +'-'+ ("0" + data[key].getDate()).slice(-2);
    }
    return response;
}

var app = angular.module('app');
app.factory('Project', ['$resource', function($resource) {
    return $resource('/api/projects/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('ProjectStatus', ['$resource', function($resource) {
    return $resource('/api/project_statuses/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('ProjectTask', ['$resource', function($resource) {
    return $resource('/api/projects/:project_id/project_tasks/:id',
        {project_id: '@project_id', id: '@id'},
        {'update': {
            method: 'PUT',
            interceptor: {response: parseResponseDates}
        }});
}]);