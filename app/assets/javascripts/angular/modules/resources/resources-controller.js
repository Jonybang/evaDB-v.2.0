/**
 * Created by jonybang on 07.08.15.
 */

'use strict';

var app = angular.module('app.resources');

app.controller('ResourcesIndexCtrl', ['$scope', 'Contact', 'ContactEditor', 'Helpers', function($scope, Contact, ContactEditor, Helpers) {
    $scope.tabsData = [
        { route : 'app.resources.all', heading : 'Все' },
        { route : 'app.resources.contacts', heading : 'Контакты' },
        { route : 'app.resources.equips', heading : 'Оборудование' }
    ];
}]);
app.controller('ResourcesAllCtrl', ['$scope', 'Resoursable', 'ContactEditor', 'Helpers', function($scope, Resoursable, ContactEditor, Helpers) {
    function getResources(){
        Resoursable.query().then(function(resources){
            $scope.resources = resources;
        });
    }
    getResources();
}]);
app.controller('ResourcesContactsCtrl', ['$scope', 'Contact', 'ContactEditor', 'Helpers', function($scope, Contact, ContactEditor, Helpers) {
    function getContacts(){
        Contact.query().then(function(contacts){
            $scope.contacts = contacts;
        });
    }
    getContacts();

    $scope.newOrEditContact = function (contact){
        //Добавляет или редактирует контакт
        //Если контакт передан как аргумент - то редактируем его

        ContactEditor({}, contact).then(function(result){
            if(result.is_new){
                getContacts();
            } else {
                Helpers.addOrReplace($scope.contacts, result, result.id, true);
            }
        });
    };
}]);

app.controller('ResourcesEquipsCtrl', ['$scope', 'Equip', 'EquipEditor', 'Helpers', function($scope, Equip, EquipEditor, Helpers) {
    function getEquips(){
        Equip.query().then(function(equips){
            $scope.equips = equips;
        });
    }
    getEquips();

    $scope.newOrEditEquip = function (equip){
        //Добавляет или редактирует контакт
        //Если контакт передан как аргумент - то редактируем его

        EquipEditor({}, equip).then(function(result){
            if(result.is_new){
                getEquips();
            } else {
                Helpers.addOrReplace($scope.equips, result, result.id, true);
            }
        });
    };
}]);

app.controller('ContactsFormCtrl', ['$scope', 'Contact', '$modalInstance', 'inputs', function($scope, Contact, $modalInstance, inputs) {
    $scope.contact = {
        contact_data : {}
    };

    if(inputs.contact_id){
        Contact.get(inputs.contact_id).then(function(contact){
            angular.extend($scope.contact, contact);
        })
    }

//    $scope.refreshResponsible = function(q, selected) {
//        return Contact.query({q: q, limit:50}).then(function(contacts){
//            if(!selected || !selected.length)
//                $scope.responsible = contacts;
//            else
//                $scope.responsible = contacts.filter(function(contact){
//                    return selected.indexOf(contact.id) == -1;
//                });
//        });
//    };

    $scope.save = function() {
        $scope.$broadcast('show-errors-check-validity');
        if (!$scope.contactForm.$valid) {
            return;
        }

        var obj;
        //если id нет - значит это новый контакт
        if(!$scope.contact.id)
            obj = new Contact($scope.contact).create();
        else
            obj = new Contact($scope.contact).update();

        obj.then(function success (result){
                var contact = result.resource ? result.resource : result;
                $modalInstance.close(contact);
            },
            function error (info){
                $scope.errors = info.data.errors;
            });
    }
}]);
app.controller('EquipsFormCtrl', ['$scope', 'Equip', '$modalInstance', 'inputs', function($scope, Equip, $modalInstance, inputs) {
    $scope.eqip = {
    };

    if(inputs.eqip_id){
        Equip.get(inputs.eqip_id).then(function(equip){
            angular.extend($scope.equip, equip);
        })
    }

//    $scope.refreshResponsible = function(q, selected) {
//        return Contact.query({q: q, limit:50}).then(function(contacts){
//            if(!selected || !selected.length)
//                $scope.responsible = contacts;
//            else
//                $scope.responsible = contacts.filter(function(contact){
//                    return selected.indexOf(contact.id) == -1;
//                });
//        });
//    };

    $scope.save = function() {
        $scope.$broadcast('show-errors-check-validity');
        if (!$scope.equipForm.$valid) {
            return;
        }

        var obj;
        //если id нет - значит это новый контакт
        if(!$scope.equip.id)
            obj = new Equip($scope.equip).create();
        else
            obj = new Equip($scope.equip).update();

        obj.then(function success (result){
                var equip = result.resource ? result.resource : result;
                $modalInstance.close(equip);
            },
            function error (info){
                $scope.errors = info.data.errors;
            });
    }
}]);