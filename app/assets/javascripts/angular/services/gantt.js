/**
 * Created by jonybang on 04.07.15.
 */
'use strict';

angular.module('app')
    .factory('Gantt', ['$http', function($http) {
        function ganttFactory (){
            var self = {};
            self.gantt = this.gantt = {};
            self.data = this.data = {
                tasks: [],
                taskStatuses: {},
                taskNames: []
            };
            self.options =this.options = {
                containerId: 'svg-gantt',
                timeDomainString : '6month',
                format: "%d %b"
            };
            var funcs = {
                resetData: function () {
                    self.data = {
                        tasks: [],
                        taskStatuses: {},
                        taskNames: []
                    };
                },
                getEndDate: function () {
                    var lastEndDate = Date.now();
                    if (self.data.tasks.length > 0) {
                        lastEndDate = self.data.tasks[self.data.tasks.length - 1].endDate;
                    }
                    return lastEndDate;
                },
                changeTimeDomain: function (timeDomainString) {
                    this.timeDomainString = timeDomainString;
                    var format, level, number;
                    switch (timeDomainString) {
                        case "1hr":
                            format = "%H:%M:%S";
                            level = 'hour';
                            number = -1;
                            break;
                        case "3hr":
                            format = "%H:%M";
                            level = 'hour';
                            number = -3;
                            break;

                        case "6hr":
                            format = "%H:%M";
                            level = 'hour';
                            number = -6;
                            break;

                        case "1day":
                            format = "%H:%M";
                            level = 'day';
                            number = -1;
                            break;

                        case "1week":
                            format = "%d";
                            level = 'day';
                            number = -7;
                            break;

                        case "1month":
                            format = "%d";
                            level = 'month';
                            number = -1;
                            break;

                        case "2month":
                            format = "%d %b";
                            level = 'month';
                            number = -2;
                            break;

                        case "6month":
                            format = "%d %b";
                            level = 'month';
                            number = -6;
                            break;
                        default:
                            format = "%H:%M"

                    }
                    self.gantt.timeDomain([ d3.time[level].offset(this.getEndDate(), number), this.getEndDate() ]);
                    self.gantt.tickFormat(format);
                    self.gantt.redraw(self.data.tasks);
                },
                convertTasks: function (tasks) {
                    this.resetData();

                    tasks.sort(function (a, b) {
                        if (a.begin_date < b.begin_date)
                            return -1;
                        else if (a.begin_date > b.begin_date)
                            return 1;
                        else
                            return 0;
                    });

                    self.data.tasks = tasks.map(function (item) {
                        var task = {
                            "startDate": new Date(item.begin_date),
                            "endDate": new Date(item.end_date),
                            "taskName": item.name,
                            "status": item.project_status ? item.project_status.name : '',
                            "title": item.name,
                            "description": item.description
                        };

                        function searchTaskName(task_name) {
                            return task_name == item.name;
                        }

                        if (!self.data.taskNames.some(searchTaskName)) {
                            self.data.taskNames.push(item.name);
                        }
                        if (item.project_status && !self.data.taskStatuses[item.project_status.name]) {
                            self.data.taskStatuses[item.project_status.name] = item.project_status.color;
                        }
                        return task;
                    });
                }
            };

            this.init = function (initTasks, containerId) {
                if(containerId)
                    self.options.containerId = containerId;
                //                tasks.sort(function(a, b) {
                //                    return a.endDate - b.endDate;
                //                });
                //                var maxDate = tasks[tasks.length - 1].endDate;
                //                tasks.sort(function(a, b) {
                //                    return a.startDate - b.startDate;
                //                });
                //                var minDate = tasks[0].startDate;
                funcs.convertTasks(initTasks);

                self.gantt = new d3.gantt();

                self.gantt.containerId(self.options.containerId)
                    .taskTypes(self.data.taskNames)
                    .taskStatus(self.data.taskStatuses)
                    .tickFormat(self.options.format)
                    .height(self.data.taskNames.length * 100)
                    .width(document.getElementById(self.options.containerId).offsetWidth - 120);


                self.gantt.timeDomainMode("fit");
                //    changeTimeDomain(timeDomainString);

                self.gantt(self.data.tasks);

                //funcs.changeTimeDomain(self.options.timeDomainString);

            };
            this.addTask = function (task) {

                var lastEndDate = funcs.getEndDate();
                var taskStatusKeys = Object.keys(taskStatus);
                var taskStatusName = taskStatusKeys[Math.floor(Math.random() * taskStatusKeys.length)];
                var taskName = data.taskNames[Math.floor(Math.random() * data.taskNames.length)];

                data.tasks.push({
                    "startDate" : d3.time.day.offset(lastEndDate, Math.ceil(1 * Math.random())),
                    "endDate" : d3.time.day.offset(lastEndDate, (Math.ceil(Math.random() * 5)) + 1),
                    "taskName" : taskName,
                    "status" : taskStatusName
                });

                funcs.changeTimeDomain(options.timeDomainString);
                gantt.redraw(data.tasks);
            };
            this.removeTask = function (id) {
                data.tasks.pop();
                funcs.changeTimeDomain(options.timeDomainString);
                gantt.redraw(data.tasks);
            };
            this.redraw =  function(tasks){
                if(self.gantt){
                    funcs.convertTasks(tasks);
                    self.gantt
                        .taskTypes(self.data.taskNames)
                        .taskStatus(self.data.taskStatuses)
                        .redraw(self.data.tasks);
                } else {
                    this.init(tasks);
                }
            };
        }
        return ganttFactory;
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