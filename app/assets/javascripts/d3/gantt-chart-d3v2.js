/**
 * @author Dimitry Kudrayvtsev
 * @version 2.0
 */

d3.gantt = function() {
    var FIT_TIME_DOMAIN_MODE = "fit";
    var FIXED_TIME_DOMAIN_MODE = "fixed";

    var margin = {
        top : 20,
        right : 0,
        bottom : 20,
        left : 120
    };
    var yAxisPaddingRightLeft = 70;
    var containerId = 'svg-gantt';
    var timeDomainStart = d3.time.day.offset(new Date(),-3);
    var timeDomainEnd = d3.time.hour.offset(new Date(),+3);
    var timeDomainMode = FIT_TIME_DOMAIN_MODE;// fixed or fit
    var taskTypes = [];
    var taskStatus = [];
    var height = document.body.clientHeight - margin.top - margin.bottom-5;
    var width = document.body.clientWidth - margin.right - margin.left-5;

    var tickFormat = "%H:%M";

    window.calcTextWrapWidth = getWidth;

    var keyFunction = function(d) {
        return d.startDate + d.taskName + d.endDate;
    };

    var rectTransform = function(d) {
        return "translate(" + x(d.startDate) + "," + y(d.taskName) + ")";
    };

    function getWidth(d){
        return (x(d.endDate) - x(d.startDate));
    }
    function getText(d) {
        return d.title;
    }

    var initTimeDomain = function(tasks) {
        if (timeDomainMode === FIT_TIME_DOMAIN_MODE) {
            if (tasks === undefined || tasks.length < 1) {
                timeDomainStart = d3.time.day.offset(new Date(), -3);
                timeDomainEnd = d3.time.hour.offset(new Date(), +3);
                return;
            }
            var tasksToSort = [];
            angular.copy(tasks, tasksToSort);
            function compareDates(a, b, field){
                var firstDate, secondDate;
                if(Object.prototype.toString.call(a[field]) === '[object Date]'){
                    firstDate = a[field].getTime();
                    secondDate = b[field].getTime();
                } else {
                    firstDate = a[field];
                    secondDate = b[field];
                }
                return firstDate - secondDate;
            }
            tasksToSort.sort(function(a, b) {
                return compareDates(a, b, 'endDate');
            });
            timeDomainEnd = tasksToSort[tasksToSort.length - 1].endDate;
            tasksToSort.sort(function(a, b) {
                return compareDates(a, b, 'startDate');
            });
            timeDomainStart = tasksToSort[0].startDate;
        }
    };

    var x, y, xAxis, yAxis;
    var initAxis = function() {
        x = d3.time
            .scale()
            .domain([ timeDomainStart, timeDomainEnd ])
            .range([ 0, width ])
            .clamp(true);

        y = d3.scale
            .ordinal()
            .domain(taskTypes)
            .rangeRoundBands([ 0, height - margin.top - margin.bottom ], .1, .3);

        xAxis = d3.svg
            .axis()
            .scale(x)
            .orient("bottom")
            .tickFormat(d3.time.format(tickFormat))
            .tickSubdivide(true)
            .tickSize(8)
            .tickPadding(8);

        yAxis = d3.svg
            .axis()
            .scale(y)
            .orient("left")
            .ticks(8, "%");
    };

    function gantt(tasks, _containerId) {
        if(_containerId)
            containerId = _containerId;

        initTimeDomain(tasks);
        initAxis();

        var svg = d3.select("#"+containerId)
            .append("svg")
            .attr("class", "chart")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("class", "gantt-chart")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .attr("transform", "translate(" + margin.left + ", " + margin.top + ")");

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0, " + (height - margin.top - margin.bottom) + ")")
            .transition()
            .call(xAxis);

        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis);

        if(tasks && tasks.length){
            gantt.redraw(tasks);
        }

        return gantt;
    }


    function confGTasks(task){
        task.attr("transform", rectTransform)
            .attr("height", function(d) { return y.rangeBand(); })
            .attr("width", getWidth);
    }
    function confRect(rect){
        rect.attr("height", function(d) { return y.rangeBand(); })
            .attr("width", getWidth)
            .attr("rx", 5)
            .attr("ry", 5)
            .attr("fill", function(d){
                if(taskStatus[d.status] == null){ return "grey";}
                return taskStatus[d.status];
            });
    }

    function confText(text){
        text.attr("x", 0)
            .attr("y", y.rangeBand() / 4)
            .attr("dy", ".35em")
            .style("visibility", function(d) {
                return x(d.startDate) == 0 ? "hidden" : "visible";
            });
    }

    gantt.redraw = function(tasks) {

        initTimeDomain(tasks);
        initAxis();

        var svg = d3.select("svg");
        var gTasks = svg.select(".gantt-chart")
            .selectAll(".task")
            .data(tasks, keyFunction);

        svg.select(".gantt-chart")
            .selectAll(".task")
            .selectAll("*")
            .data(tasks, keyFunction)
            .exit()
            .attr('width', 0).remove();

        gTasks.exit().remove();

        gTasks.enter()
            .insert("g", ":first-child")
            .attr('class', 'task')
            .attr("y", 0)
            .transition()
            .call(confGTasks);

        gTasks.exit().remove();

        var gRect = gTasks.insert("rect",":first-child")
            .transition()
            .call(confRect);

        //FIXME, code for redraw stuck blocks
        svg.select(".gantt-chart")
            .selectAll(".task")
            .selectAll("*")
            .data(tasks, keyFunction)
            .exit()
            .transition()
            .attr('width', 0).remove();

        var gText = gTasks.append("text")
            .call(confText)
            .text(getText)
            .call(d3TextWrap, false);

        gTasks.transition()
            .call(confGTasks);

        gRect.transition()
            .call(confRect);

        gText.transition()
            .call(confText);

        gTasks.exit().remove();

        svg.select(".x")
            .transition()
            .call(xAxis);

        svg.select(".y")
            .transition()
            .call(yAxis)
            .selectAll(".tick text")
            .call(d3TextWrap, margin.left, yAxisPaddingRightLeft);

        return gantt;
    };

    gantt.containerId = function(strId){
        containerId = strId;
        return gantt;
    };

    gantt.margin = function(value) {
        if (!arguments.length)
            return margin;
        margin = value;
        return gantt;
    };

    gantt.timeDomain = function(value) {
        if (!arguments.length)
            return [ timeDomainStart, timeDomainEnd ];
        timeDomainStart = +value[0], timeDomainEnd = +value[1];
        return gantt;
    };

    /**
     * @param {string}
     *                vale The value can be "fit" - the domain fits the data or
     *                "fixed" - fixed domain.
     */
    gantt.timeDomainMode = function(value) {
        if (!arguments.length)
            return timeDomainMode;
        timeDomainMode = value;
        return gantt;
    };

    gantt.taskTypes = function(value) {
        if (!arguments.length)
            return taskTypes;
        taskTypes = value;
        return gantt;
    };

    gantt.taskStatus = function(value) {
        if (!arguments.length)
            return taskStatus;
        taskStatus = value;
        return gantt;
    };

    gantt.width = function(value) {
        if (!arguments.length)
            return width;
        width = +value;
        return gantt;
    };

    gantt.height = function(value) {
        if (!arguments.length)
            return height;
        height = +value;
        return gantt;
    };

    gantt.tickFormat = function(value) {
        if (!arguments.length)
            return tickFormat;
        tickFormat = value;
        return gantt;
    };

    return gantt;
};