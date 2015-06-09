var margin = {top:40, right:20, bottom:30, left:40},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;




//set x and y scales
var x = d3.scale.ordinal()
          .rangeRoundBands([0, width], 1);

var y = d3.scale.linear()
          .range([height,0]);
//set axes
var XAxis = d3.svg.axis().scale(x).orient("bottom");
var YAxis = d3.svg.axis().scale(y).orient('left').tickFormat(formatPercent);


