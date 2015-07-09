/**
 * Created by jonybang on 08.07.15.
 */
angular.module('app')
    .factory('Helpers', ['$http', function($http) {

        var service = {
            addOrReplace: function (array, object, id){
                //Добавляет в массив или обновляет в нем объект, в зависимости от того:
                //задано ли поле id(тоесть существует ли уже объект с таким id)
                if(!id)
                    array.unshift(object);
                else {
                    array.some(function(obj, index){
                        if(obj.id == id){
                            angular.extend(array[index], object);
                        }
                        return obj.id == id;
                    })
                }
            },
            removeById: function(array, id){
                //Ищет объект в массиве по id и удаляет его
                array.some(function(obj, index){
                    if(obj.id == id){
                        array.splice(index, 1);
                    }
                    return obj.id == id;
                });
            },
            addItemToParentObjectInArrayById: function(array, item, id, fieldInObj){
                //Ищет объект в массиве по id и добавляет в массив найденного объекта
                //параметр item в поле объекта fieldInObj, которое должно являться массивом
                array.some(function(obj, index){
                    if(obj.id == id){
                        //Если не массив или пустой или нет такого поля - просто пересоздаем массив
                        if(!obj[fieldInObj] || !obj[fieldInObj].length)
                            obj[fieldInObj] = [];

                        obj[fieldInObj].push(item);
                    }
                    return obj.id == id;
                });
            },
            parseDatesToStr: function (object) {
                var key;
                var data = object.resource ? object.resource : object;
                for (key in data) {
                    if(Object.prototype.toString.call(data[key]) === '[object Date]')
                        data[key] = data[key].getFullYear() +'-'+ ("0" + (data[key].getMonth() + 1)).slice(-2) +'-'+ ("0" + data[key].getDate()).slice(-2);
                }
                return object;
            }
        };
        return service;
    }]);

//    var tasks = [
//        {"startDate":new Date("Sun Dec 09 01:36:45 EST 2012"),"endDate":new Date("Sun Dec 09 02:36:45 EST 2012"),"taskName":"E Job","status":"RUNNING"}];


//    var taskStatus = {
//        "SUCCEEDED" : "bar",
//        "FAILED" : "bar-failed",
//        "RUNNING" : "bar-running",
//        "KILLED" : "bar-killed"
//    };
//
//    var taskNames = [ "D Job", "P Job", "E Job", "A Job", "N Job" ];