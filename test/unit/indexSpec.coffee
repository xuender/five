describe 'index', ->
  it 'random', ->
    items = [
      {l: '枣核脸',       v: '火'}
      {l: '眉高瘦削',     v: '火'}
      {l: '脸部长瘦',   v: '木'}
      {l: '方脸',     v: '土'}
      {l: '眉清目秀',   v: '金'}
      {l: '面形肥',     v: '水'}
    ]
    expect(random(items).length).toEqual(5)
