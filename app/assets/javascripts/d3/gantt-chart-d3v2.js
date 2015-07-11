/**
 * @author Dimitry Kudrayvtsev
 * @version 2.0
 */

d3.gantt = function() {
    var self = this;
    this.gantt = function (tasks, _containerId) {
        if(_containerId)
            self._containerId = _containerId;

        var svg = d3.select("#"+self._containerId)
            .append("svg")
            .attr("class", "chart")
            .attr("width", self._width + self._margin.left + self._margin.right)
            .attr("height", self._height + self._margin.top + self._margin.bottom)
            .append("g")
            .attr("class", "gantt-chart")
            .attr("width", self._width + self._margin.left + self._margin.right)
            .attr("height", self._height + self._margin.top + self._margin.bottom)
            .attr("transform", "translate(" + self._margin.left + ", " + self._margin.top + ")");

        self.initTimeDomain(tasks);
        self.initAxis();

        svg.append("g")
            .attr("class", "x axis")
            //.attr("transform", "translate(0, " + (self._height - self._margin.top - self._margin.bottom) + ")")
            .transition()
            .call(self.xAxis);

        svg.append("g")
            .attr("class", "y axis")
            .call(self.yAxis);

        if(tasks && tasks.length){
            self.gantt.redraw(tasks);
        }

        return self.gantt;
    };
    this.FIT_TIME_DOMAIN_MODE = "fit";
    this.FIXED_TIME_DOMAIN_MODE = "fixed";

    this._margin = {
        top : 40,
        right : 0,
        bottom : 20,
        left : 120
    };
    this.yAxisPaddingRightLeft = 70;
    this._containerId = 'svg-gantt';
    this.timeDomainStart = d3.time.day.offset(new Date(),-3);
    this.timeDomainEnd = d3.time.hour.offset(new Date(),+3);
    this._timeDomainMode = this.FIT_TIME_DOMAIN_MODE;// fixed or fit
    this._taskTypes = [];
    this._taskStatus = [];
    this._height = document.body.clientHeight - this._margin.top - this._margin.bottom-5;
    this._width = document.body.clientWidth - this._margin.right - this._margin.left-5;

    this._tickFormat = "%H:%M";


    function keyFunction (d) {
        return d.startDate + d.taskName + d.endDate;
    }
    function getText(d) {
        return d.title;
    }
    this.rectTransform = function (d) {
        return "translate(" + self.x(d.startDate) + "," + self.y(d.taskName) + ")";
    };
    this.getWidth = function(d){
        return (self.x(d.endDate) - self.x(d.startDate));
    };

    this.initTimeDomain = function(tasks) {
        if (self._timeDomainMode === self.FIT_TIME_DOMAIN_MODE) {
            if (tasks === undefined || tasks.length < 1) {
                self.timeDomainStart = d3.time.day.offset(new Date(), -3);
                self.timeDomainEnd = d3.time.hour.offset(new Date(), +3);
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
            self.timeDomainEnd = tasksToSort[tasksToSort.length - 1].endDate;
            tasksToSort.sort(function(a, b) {
                return compareDates(a, b, 'startDate');
            });
            self.timeDomainStart = tasksToSort[0].startDate;
        }
    };

    this.initAxis = function() {
        self.x = d3.time
            .scale()
            .domain([ self.timeDomainStart, self.timeDomainEnd ])
            .range([ 0, self._width ])
            .clamp(true);

        self.y = d3.scale
            .ordinal()
            .domain(self._taskTypes)
            .rangeRoundBands([ 0, self._height - self._margin.top - self._margin.bottom ], .1, .3);

        self.xAxis = d3.svg
            .axis()
            .scale(self.x)
            .orient("top")
            .tickFormat(d3.time.format(self._tickFormat))
            .tickSubdivide(true)
            .tickSize(8)
            .tickPadding(8);

        self.yAxis = d3.svg
            .axis()
            .scale(self.y)
            .orient("left")
            .ticks(8, "%");
    };

    this.confGTasks = function(task){
        task.attr("transform", self.rectTransform)
            .attr("height", function(d) { return self.y.rangeBand(); })
            .attr("width", self.getWidth);
    };
    this.confRect = function(rect){
        rect.attr("height", function(d) { return self.y.rangeBand(); })
            .attr("width", self.getWidth)
            .attr("rx", 5)
            .attr("ry", 5)
            .attr("fill", function(d){
                if(self._taskStatus[d.status] == null){ return "grey";}
                return self._taskStatus[d.status];
            });
    };

    this.confText = function(text){
        text.attr("x", 0)
            .attr("y", self.y.rangeBand() / 4)
            .attr("dy", ".35em")
            .style("visibility", function(d) {
                return self.x(d.startDate) == 0 ? "hidden" : "visible";
            });
    };

    this.gantt.redraw = function(tasks) {

        self.initTimeDomain(tasks);
        self.initAxis();

        var svg = d3.select("#"+self._containerId).select("svg");
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
            .call(self.confGTasks);

        gTasks.exit().remove();

        var gRect = gTasks.insert("rect",":first-child")
            .transition()
            .call(self.confRect);

        //FIXME, code for redraw stuck blocks
        svg.select(".gantt-chart")
            .selectAll(".task")
            .selectAll("*")
            .data(tasks, keyFunction)
            .exit()
            .transition()
            .attr('width', 0).remove();

        var gText = gTasks.append("text")
            .call(self.confText)
            .text(getText)
            .call(self.d3TextWrap, false);

        gTasks.transition()
            .call(self.confGTasks);

        gRect.transition()
            .call(self.confRect);

        gText.transition()
            .call(self.confText);

        gTasks.exit().remove();

        svg.select(".x")
            .transition()
            .call(self.xAxis);

        svg.select(".y")
            .transition()
            .call(self.yAxis)
            .selectAll(".tick text")
            .call(self.d3TextWrap, self._margin.left, self.yAxisPaddingRightLeft);

        return self.gantt;
    };

    this.gantt.containerId = function(strId){
        self._containerId = strId;
        return self.gantt;
    };

    this.gantt.margin = function(value) {
        if (!arguments.length)
            return self._margin;
        self._margin = value;
        return self.gantt;
    };

    this.gantt.timeDomain = function(value) {
        if (!arguments.length)
            return [ self.timeDomainStart, self.timeDomainEnd ];
        self.timeDomainStart = +value[0], self.timeDomainEnd = +value[1];
        return self.gantt;
    };

    /**
     * @param {string}
     *                vale The value can be "fit" - the domain fits the data or
     *                "fixed" - fixed domain.
     */
    this.gantt.timeDomainMode = function(value) {
        if (!arguments.length)
            return self._timeDomainMode;
        self._timeDomainMode = value;
        return self.gantt;
    };

    this.gantt.taskTypes = function(value) {
        if (!arguments.length)
            return self._taskTypes;
        self._taskTypes = value;
        return self.gantt;
    };

    this.gantt.taskStatus = function(value) {
        if (!arguments.length)
            return self._taskStatus;
        self._taskStatus = value;
        return self.gantt;
    };

    this.gantt.width = function(value) {
        if (!arguments.length)
            return self._width;
        self._width = +value;
        return self.gantt;
    };

    this.gantt.height = function(value) {
        if (!arguments.length)
            return self._height;
        self._height = +value;
        return self.gantt;
    };

    this.gantt.tickFormat = function(value) {
        if (!arguments.length)
            return self._tickFormat;
        self._tickFormat = value;
        return self.gantt;
    };
    this.d3TextWrap = function (allText, inputWidth, paddingRightLeft, paddingTopBottom) {
        paddingRightLeft = paddingRightLeft || 5; //Default padding (5px)
        paddingTopBottom = (paddingTopBottom || 5) - 2; //Default padding (5px), remove 2 pixels because of the borders

        var arrLineCreatedCount = [];
        allText.each(function(object) {
            var text = d3.select(this),
                objType = typeof object,
                words = ((objType == "string") ? object : text.text()).split(/[ \f\n\r\t\v]+/).reverse(), //Don't cut non-breaking space (\xA0), as well as the Unicode characters \u00A0 \u2028 \u2029)
                word,
                width,
                line = [],
                lineNumber = 0,
                lineHeight = 1.1, //Ems
                x,
                y = text.attr("y"),
                dy = parseFloat(text.attr("dy")),
                createdLineCount = 1, //Total line created count
                textAlign = text.style('text-anchor') || 'start'; //'start' by default (start, middle, end, inherit)

            if(self.getWidth && inputWidth == false){
                width = self.getWidth(object);
            } else {
                width = inputWidth;
            }

            var maxWidth = width; //I store the tooltip max width
            width = width - (paddingRightLeft * 2); //Take the padding into account

            //Clean the data in case <text> does not define those values
            if (isNaN(dy)) dy = 0; //Default padding (0em) : the 'dy' attribute on the first <tspan> _must_ be identical to the 'dy' specified on the <text> element, or start at '0em' if undefined

            //Offset the text position based on the text-anchor
            var wrapTickLabels = d3.select(text.node().parentNode).classed('tick'); //Don't wrap the 'normal untranslated' <text> element and the translated <g class='tick'><text></text></g> elements the same way..
            if (wrapTickLabels) {
                switch (textAlign) {
                    case 'start':
                        x = -width / 2;
                        break;
                    case 'middle':
                        x = 0;
                        break;
                    case 'end':
                        x = width / 2;
                        break;
                    default :
                }
            }
            else { //untranslated <text> elements
                switch (textAlign) {
                    case 'start':
                        x = paddingRightLeft;
                        break;
                    case 'middle':
                        x = maxWidth / 2;
                        break;
                    case 'end':
                        x = maxWidth - paddingRightLeft;
                        break;
                    default :
                }
            }
            y = +((null === y) ? paddingTopBottom : y);

            var tspan = text.text(null).append("tspan").attr("x", x).attr("y", y).attr("dy", dy + "em");
            //noinspection JSHint
            while (word = words.pop()) {
                line.push(word);
                tspan.text(line.join(" "));
                var computedTextLength = tspan.node().getComputedTextLength();
                if (computedTextLength > width && line.length > 1) {
                    line.pop();
                    tspan.text(line.join(" "));
                    line = [word];
                    tspan = text.append("tspan").attr("x", x).attr("y", y).attr("dy", ++lineNumber * lineHeight + dy + "em").text(word);
                    ++createdLineCount;
                }
            }

            arrLineCreatedCount.push(createdLineCount); //Store the line count in the array
        });
        return arrLineCreatedCount;
    };
    return this.gantt;
};