/**
 * Created by jonybang on 09.08.15.
 */
angular.module('app').directive('animatedButton', ['$animate', 'debounce', function($animate, debounce) {
    return {
        restrict: 'E',
        template: '<button type="button" ng-hide="notChanged && hideBeforeChange" class="btn btn-primary {{classes}}">{{text}}</button>',
        scope: {
            //require
            ngModel: '=',
            text: '@',
            //sub
            classes: '@',
            hideBeforeChange: '='
        },
        link: function (scope, element) {

            function addAndRemoveAnimate(){
                $animate.addClass(element.find('.btn'), 'animated bounce').then(function(){
                    $animate.removeClass(element.find('.btn'), 'animated bounce');
                });
            }
            var debounceAnimate = debounce(500, addAndRemoveAnimate);

            scope.notChanged = true;
            var isFirst = true;

            scope.$watch('ngModel', function(){
                if(isFirst){
                    isFirst = false;
                    return;
                }

                if(scope.notChanged)
                    addAndRemoveAnimate();
                else
                    debounceAnimate();

                scope.notChanged = false;
            });
        }
    };
}]);