'use strict';

function parseResponseDates(response) {
    var data = response.resource, key, value;
    for (key in data) {
        if(Object.prototype.toString.call(data[key]) === '[object Date]')
            data[key] = data[key].getFullYear() +'-'+ (data[key].getMonth()+1) +'-'+ data[key].getDate();
    }
    return response;
}

var app = angular.module('app');
app.factory('Project', ['$resource', function($resource) {
    return $resource('/api/projects/:id', {id: '@id'}, {'update': {method: 'PUT'}});
}]);

app.factory('ProjectTask', ['$resource', function($resource) {
    return $resource('/api/projects/:project_id/project_tasks/:id',
        {project_id: '@project_id', id: '@id'},
        {'update': {
            method: 'PUT',
            interceptor: {response: parseResponseDates}
        }});
}]);