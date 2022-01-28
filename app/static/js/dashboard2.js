
(function ($) {
    "use strict";

    /*----------------------------------*/

    var data = {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        series: [[5, 4, 3, 7, 5, 10, 3, 4, 8, 10, 6, 8]]
    };

    var options = {
        seriesBarDistance: 10
    };

    var responsiveOptions = [
  ['screen and (max-width: 640px)', {
            seriesBarDistance: 5,
            axisX: {
                labelInterpolationFnc: function (value) {
                    return value[0];
                }
            }
  }]
];

    new Chartist.Bar('.ct-bar-chart', data, options, responsiveOptions);


})(jQuery);








