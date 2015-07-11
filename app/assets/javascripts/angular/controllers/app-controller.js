/**
 * Created by jonybang on 10.07.15.
 */
angular.module('app').controller('AppCtrl', ['$scope', '$location', 'ProjectTask',
    function($scope, $location, ProjectTask) {
        $scope.last_tasks = ProjectTask.query({sort: 'created_at DESC', limit: 3});

        $scope.tabsData = [
            { route : 'app.tasks', heading : 'Задачи' },
            { route : '#', heading : 'Личный календарь', disabled: true },
            { route : 'app.gantt', heading : 'Диаграмма Ганта'},
            { route : 'app.projects.index', heading : 'Проекты' },
            { route : '#', heading : 'Ресурсы', disabled: true },
            { route : '#', heading : 'Бизнес процессы', disabled: true }
        ];
    }]);