/**
 * Created by jonybang on 10.07.15.
 */
angular.module('app').controller('MainCtrl', ['$scope', '$location', 'ProjectTask',
    function($scope, $location, ProjectTask) {
        $scope.last_tasks = ProjectTask.query({sort: 'created_at DESC', limit: 3});

        $scope.tabs = [
            { link : '/', label : 'Задачи' },
            { link : '#', label : 'Личный календарь', disabled: true },
            { link : '#', label : 'Диаграмма Ганта', disabled: true },
            { link : 'projects', label : 'Проекты' },
            { link : '#', label : 'Ресурсы', disabled: true },
            { link : '#', label : 'Бизнес процессы', disabled: true }
        ];

        $scope.active_tab = $scope.tabs[0];

        $scope.tabs.some(function(object){
            if($location.path().indexOf(object.link) == 1){
                $scope.active_tab = object;
                return true;
            }
        });
    }]);