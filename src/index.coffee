###
index.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
angular.module('five', [
])
FiveCtrl = (scope, log)->
  scope.START = START
  scope.END = END
  scope.SELECT = SELECT
  scope.INPUT = INPUT
  scope.CHECK = CHECK
  scope.name = ''
  scope.init = ->
    scope.page = []
    for p in PAGE
      if p.type == CHECK
        p.items = p.items.sort((a, b)->
          Math.random() - 0.5
        )
      scope.page.push(p)
    scope.num = 0
    scope.error = false
  scope.init()
  scope.$watch 'num', (n, o)->
    scope.p = scope.page[n]
    if scope.p.type == END
      scope.count()
  scope.next = ->
    scope.error = false
    if scope.p.type == SELECT and not scope.p.value
      scope.error = true
      return
    else if scope.p.type == INPUT and not scope.f_name.$valid
      scope.error = true
      $('#i_name').focus()
      return
    scope.num += 1
    for i in [scope.num..scope.page.length]
      if scope.page[1].value == scope.page[scope.num].hide
        scope.num += 1
      else
        return

  scope.prev = ->
    scope.num -= 1
  scope.count = ->
    report =
      '木': 0
      '火': 0
      '土': 0
      '金': 0
      '水': 0
    for p in scope.page
      if p.type == CHECK
        for i in p.items
          if i['s']
            report[i.v] += 1
    chartConfig =
      chart:
        polar: true
      title:
        text: "#{scope.name}的五行"
      pane:
          startAngle: 0
          endAngle: 360
      xAxis:
        tickInterval: 72
        min: 0
        max: 360
        labels:
          formatter: ->
            {0:'木',72:'火',144:'土',216:'金',288:'水'}[this.value]
      tooltip:
        formatter: ->
          "#{scope.name}的#{{0:'木',72:'火',144:'土',216:'金',288:'水'}[this.x]}性得分<br/><b>#{this.y}</b>"
      plotOptions:
        series:
          pointStart: 0
          pointInterval: 72
      legend:
        enabled: false
      lang:
        printChart: '打印测试结果'
        downloadPNG: '下载PNG图片',
        downloadJPEG: '下载JPEG图片',
        downloadPDF: '下载PDF文档',
        downloadSVG: '下载SVG矢量图片',
        contextButtonTitle: '测试结果输出'
      series: [
        type: 'area'
        name: scope.name
        data: [
          report['木']
          report['火']
          report['土']
          report['金']
          report['水']
        ]
      ]
    $('#container').highcharts(chartConfig)
    $("tspan:contains('Highcharts.com')").remove()

FiveCtrl.$inject = ['$scope', '$log']
