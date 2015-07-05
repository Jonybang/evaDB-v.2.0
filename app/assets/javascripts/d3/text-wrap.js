function d3TextWrap (allText, inputWidth, paddingRightLeft, paddingTopBottom) {
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

        if(calcTextWrapWidth && inputWidth == false){
            width = calcTextWrapWidth(object);
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
}