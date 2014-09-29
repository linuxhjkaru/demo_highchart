@demo_highchart = (month, tokyo, newyork, london, berlin) ->
  $("#container").highcharts
    chart:
      type: "column"

    title:
      text: "Monthly Average Rainfall"

    xAxis:
      categories: month

    yAxis:
      min: 0
      title:
        text: "Rainfall (mm)"

    tooltip:
      headerFormat: "<span style=\"font-size:10px\">{point.key}</span><table>"
      pointFormat: "<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>" + "<td style=\"padding:0\"><b>{point.y:.1f} mm</b></td></tr>"
      footerFormat: "</table>"
      shared: true
      useHTML: true

    plotOptions:
      column:
        pointPadding: 0.2
        borderWidth: 0
      series:
        cursor: "pointer"
        point:
          events:
            click: (e) ->
              datetime = @category
              url = document.URL
              $.ajax "#{url}?month=#{datetime}",
                type: 'GET'
                dataType: 'script'
                authenticity_token: "#{@auth_token_form}"

    series: [
      {
        name: "Tokyo"
        data: tokyo
      }
      {
        name: "New York"
        data: newyork
      }
      {
        name: "London"
        data: london
      }
      {
        name: "Berlin"
        data: berlin
      }
    ]

  return

@graph_pie = (data_graph, chart_name) ->
  $("#show-month").highcharts
    chart:
      plotBackgroundColor: null,
      plotBorderWidth: null,
      plotShadow: false

    title:
      text: chart_name

    tooltip:
      pointFormat: '{series.name}: {point.percentage:.1f}%'

    plotOptions:
      allowPointSelect: true,
      cursor: 'pointer',
      dataLabels:
        enabled: true,
        format: '{point.name}: {point.percentage:.1f} %',
        style:
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'

    series: [
      type: 'pie',
      name: "訪問数",
      data: data_graph
    ]

  return