

var margin = {top:40, right:20, bottom:30, left:40},
    width = 600 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;




//set x and y scales
var x = d3.scale.ordinal()
          .rangeRoundBands([0, width], 1);

var y = d3.scale.linear()
          .range([height,0]);
//set axes
var XAxis = d3.svg.axis().scale(x).orient("bottom");
var YAxis = d3.svg.axis().scale(y).orient('left');



var svg = d3.select(".weekly-steps").append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append('g')
            .attr('transform','translate'+margin.left+ ","+margin.top+"_)");


d3.tsv("weekly_steps.tsv", type, function(error, data){
  x.domain(data.map(function(d){ return d.day;}));
  y.domain([0, d3.max(data, function(d){return d.steps;})]);

  svg.append('g')
    .attr('class', 'y axis')
    .call(YAxis)
    .append('text')
    .attr("transform", "rotate(-90)")
    .attr('dy', ".71em")
    .style('text-anchor', 'end')
    .text('Steps');

  svg.selectAll('.bar')
     .data(data)
     .enter().append('rect')
     .attr('class', 'bar')
     .attr('x', function(d) { return x(d.day); })
     .attr('width', x.rangeBand())
     .attr('y', function(d) { return y(d.steps); })
     .attr('height', function(d) {return height - y(d.frequency); })

});

function type(d) {
  d.steps = +d.steps;
  return d;
}




