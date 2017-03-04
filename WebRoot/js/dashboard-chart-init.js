// Use Morris.Area instead of Morris.Line
Morris.Donut({
    element: 'graph-donut',
    data: [
        {value: 70, label: '4.5-5.0分', formatted: 'at 70%' },
        {value: 15, label: '4.0-4.5分', formatted: 'at 15%' },
        {value: 5, label: '3.5-4.0分', formatted: 'at 5%' },
        {value: 5, label: '3.0-3.5分', formatted: 'at 5%' },
        {value: 5, label: '<3.0分', formatted: 'at 5%' }
    ],
    backgroundColor: false,
    labelColor: '#fff',
    colors: [
        '#5ab6df','#4acacb','#6a8bc0','#fe8676','#FF7F00'
    ],
    formatter: function (x, data) { return data.formatted; }
});


$(function() {

    var d1 = [
        [1, 6200],
        [2, 4370],
        [3, 3610],
        [4, 5490],
        [5, 6180],
        [6, 5700],
        [7, 7580],
        [8, 6580],
        [9, 5380],
        [10, 4880],
        [11, 7880],
        [12, 5880],
    ];
    var d2 = [
        [1, 5200],
        [2, 3370],
        [3, 2610],
        [4, 4490],
        [5, 5180],
        [6, 4700],
        [7, 6580],
        [8, 5580],
        [9, 4380],
        [10, 3780],
        [11, 4880],
        [12, 7880],
    ];

    var data = ([{
        label: "司机 ",
        data: d1,
        lines: {
            show: true,
            fill: true,
            fillColor: {
                colors: ["rgba(255,255,255,.4)", "rgba(183,236,240,.4)"]
            }
        }
    },
        {
            label: "货主",
            data: d2,
            lines: {
                show: true,
                fill: true,
                fillColor: {
                    colors: ["rgba(255,255,255,.0)", "rgba(253,96,91,.7)"]
                }
            }
        }
    ]);

    var options = {
        grid: {
            backgroundColor:
            {
                colors: ["#ffffff", "#f4f4f6"]
            },
            hoverable: true,
            clickable: true,
            tickColor: "#eeeeee",
            borderWidth: 1,
            borderColor: "#eeeeee"
        },
        // Tooltip
        tooltip: true,
        tooltipOpts: {
            content: "%s X: %x Y: %y",
            shifts: {
                x: -60,
                y: 25
            },
            defaultTheme: false
        },
        legend: {
            labelBoxBorderColor: "#000000",
            container: $("#main-chart-legend"), //remove to show in the chart
            noColumns: 0
        },
        series: {
            stack: true,
            shadowSize: 0,
            highlightColor: 'rgba(000,000,000,.2)'
        },
//        lines: {
//            show: true,
//            fill: true
//
//        },
        points: {
            show: true,
            radius: 3,
            symbol: "circle"
        },
        colors: ["#5abcdf", "#ff8673"]
    };
    var plot = $.plot($("#main-chart #main-chart-container"), data, options);
});