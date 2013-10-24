var barGraph = {
    createBarGraph: function() {
        //Width and height
        var w = 250;
        var h = 600;

        var dataset = [ 5, 10, 13, 19, 21, 25, 22, 18, 15, 13,
              11, 12, 15, 20, 18, 17, 16, 18, 23, 25 ];

        // 1. set xScale and yScale vars

        var xScale = d3.scale.linear()
            .domain([0, d3.max(dataset)])
            .range([0, w]);

        var yScale = d3.scale.ordinal()
            .domain(d3.range(dataset.length))
            .rangeRoundBands([0, h], 0.05);

        // 2. create SVG element and give it a width and a height

        var svg = d3.select("body")
            .append("svg")
            .attr("width", w)
            .attr("height", h)
            .attr("class", "bar_graph");

        // 3. create bars using selectAll and append it to new SVG element

        svg.selectAll("rect")
            .data(dataset)
            .enter()
            .append("rect")
            .attr("x", function(d) {
                return 0;
            })
            .attr("y", function(d, i) {
                return yScale(i);
            })
            .attr("width", function(d) {
                return xScale(d);
            })
            .attr("height", yScale.rangeBand())
            .attr("fill", function(d) {
                return "rgb(" + (d * 10) + ", 0, " + (d * 10) + ")";
            })
            .on("mouseover", function() {
                d3.select(this)
                .attr("fill", "orange");
            })
            .on("mouseout", function(d) {
                d3.select(this)
                .transition()
                .duration(250)
                .attr("fill", "rgb(0, 0, " + (d * 10) + ")");
            });

        // 4. set some of it's attr's, such as the x, y, h, w

        // 5. attach events to mouseover and mouseout

        // 6. bonus! implement sorting of data

        // 7. create labels using "text"
        svg.selectAll("text")
            .data(dataset)
            .enter()
            .append("text")
            .text(function(d) {
                return d;
            })
            .attr("text-anchor", "middle")
            .attr("x", function(d) {
                return 14;
            })
            .attr("y", function(d, i) {
                return yScale(i) + yScale.rangeBand() / 2;
            })
            .attr("font-family", "sans-serif")
            .attr("font-size", "11px")
            .attr("fill", "white");
    }
};