###
index.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
angular.module('five', [
  'ui.bootstrap'
  'highcharts-ng'
])
FiveCtrl = (scope, log)->
  scope.START = 0
  scope.END = 1
  scope.SELECT = 2
  scope.INPUT = 3
  scope.CHECK = 4
  scope.name = ''
  scope.page = [
    {
      type: scope.START
      title: '五行性理测试'
      p: '根据王善人凤仪公的《性理集成》测试五行性理'
    }
    {
      type: scope.SELECT
      title: '对谁进行测试？'
      p: '由于“医不自医”自己无法看清自己的原因，你需要选择'
      prev: true
      next: true
      items: [
        '自己'
        '亲友'
      ]
    }
    {
      type: scope.INPUT
      title: '请输入测试人的称呼'
      p: '测试结果上显示的姓名'
      prev: true
      next: true
    }
    {
      type: scope.CHECK
      title: "的面部特征有那些？"
      p: '查看一下面不特征，选择出合适的多个选项'
      prev: true
      next: true
      items: [
        {l: '长瘦', v: '木'}
        {l: '露骨', v: '木'}
        {l: '上宽下窄', v: '木'}
        {l: '上尖中宽', v: '火'}
        {l: '面丰满', v: '火'}
        {l: '面丰厚', v: '土'}
        {l: '方脸', v: '土'}
        {l: '唇厚', v: '土'}
        {l: '面长方', v: '金'}
        {l: '颧稍高', v: '金'}
        {l: '唇薄齿利', v: '金'}
        {l: '眉清目秀', v: '金'}
        {l: '面形肥', v: '水'}
        {l: '面漫团', v: '水'}
        {l: '面下稍宽', v: '水'}
        {l: '眉粗', v: '水'}
        {l: '目大', v: '水'}
      ]
    }
    {
      type: scope.END
      title: '测试结果'
      p: '本测试结果仅供参考'
      prev: true
    }
  ]
  scope.num = 0
  scope.$watch 'num', (n, o)->
    scope.p = scope.page[n]
    scope.count()
  scope.next = ->
    num += 1
  scope.count = ->
    scope.report =
      '金': 0
      '木': 0
      '水': 0
      '火': 0
      '土': 0
    for p in scope.page
      if p.type == scope.CHECK
        for i in p.items
          if i['s']
            scope.report[i.v] += 1
  scope.chartConfig =
    chart:
      polar: true
    title:
      text: '五行测试结果'
    pane:
        startAngle: 0
        endAngle: 360
    xAxis:
      tickInterval: 72
      min: 0
      max: 360
      labels:
        formatter: ->
          {0:'金',72:'木',144:'木',216:'木',288:'木'}[this.value]
    plotOptions:
      series:
        pointStart: 0
        pointInterval: 72
    series: [
      type: 'area'
      name: '五行测试'
      data: [5, 3, 7, 3, 6]
    ]
  $('#container').highcharts(scope.chartConfig)

FiveCtrl.$inject = ['$scope', '$log']
