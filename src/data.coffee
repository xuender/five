###
data.coffee
Copyright (C) 2013 ender xu <xuender@gmail.com>

Distributed under terms of the MIT license.
###
START = 0
END = 1
SELECT = 2
INPUT = 3
CHECK = 4

PAGE = [
  {
    type: START
  }
  {
    type: SELECT
    title: '对谁进行测试？'
    p: '由于“医不自医”自己无法看清自己的原因，你需要选择'
    items: [
      '自己'
      '亲友'
    ]
  }
  {
    type: SELECT
    title: '被测试人的性别？'
    p: '男女五行属性不同，测试结果也不相同'
    items: [
      '男'
      '女'
    ]
  }
  {
    type: INPUT
    title: '请输入被测试人的称呼'
    p: '测试结果上显示的称呼'
  }
  {
    type: CHECK
    title: "的面部特征有那些？"
    p: '查看以下面部特征，选择合适的，可多选'
    items: [
      {l: '头顶平',     v: '木'}
      {l: '脸少肉',     v: '木'}
      {l: '脸部长瘦',   v: '木'}
      {l: '高颧骨',     v: '木'}
      {l: '瓜子脸',     v: '木'}
      {l: '高鼻梁',     v: '木'}
      {l: '青筋暴露',   v: '木'}
      {l: '髪际窄很稀', v: '木'}
      {l: '上宽下窄',   v: '木'}

      {l: '头顶尖',       v: '火'}
      {l: '嘴巴短',       v: '火'}
      {l: '枣核脸',       v: '火'}
      {l: '眉高瘦削',     v: '火'}
      {l: '毛发稀疏',     v: '火'}
      {l: '拔顶或秃顶',   v: '火'}
      {l: '赤红面',       v: '火'}
      {l: '上尖中宽',     v: '火'}
      {l: '面丰满',       v: '火'}
      {l: '肉多横纹',     v: '火'}

      {l: '头多肉',   v: '土'}
      {l: '嘴巴方',   v: '土'}
      {l: '四方圆脸', v: '土'}
      {l: '唇厚',     v: '土'}
      {l: '蒜头鼻子', v: '土'}
      {l: '面丰厚',   v: '土'}
      {l: '耳朵大',   v: '土'}
      {l: '平头顶',   v: '土'}
      {l: '鼻头多肉', v: '土'}
      {l: '桔皮脸',   v: '土'}
      {l: '方圆脸',   v: '土'}
      {l: '口部丰满', v: '土'}

      {l: '脸皮薄',     v: '金'}
      {l: '嘴巴长方',   v: '金'}
      {l: '面长方',     v: '金'}
      {l: '颧稍高',     v: '金'}
      {l: '唇薄齿利',   v: '金'}
      {l: '眉清目秀',   v: '金'}
      {l: '皮肤白细',   v: '金'}
      {l: '齿白',       v: '金'}
      {l: '平顶细眉',   v: '金'}
      {l: '肉纹细腻',   v: '金'}

      {l: '面形肥',     v: '水'}
      {l: '嘴巴小',     v: '水'}
      {l: '脸肉下垂',   v: '水'}
      {l: '面下稍宽',   v: '水'}
      {l: '眉粗',       v: '水'}
      {l: '目大',       v: '水'}
      {l: '双下巴',     v: '水'}
      {l: '面漫团',     v: '水'}
    ]
  }
  {
    type: CHECK
    title: "发怒时是什么样的？"
    p: '看以下特征，选择合适的，单选'
    items: [
      #{l: '面带凶气', v: '木'}
      {l: '面发青或带凶气', v: '木'}

      {l: '面红耳赤', v: '火'}

      {l: '面色发黄', v: '土'}

      {l: '面色苍白', v: '金'}

      #{l: '面色发暗', v: '水'}
      {l: '面色发黑发暗', v: '水'}
    ]
  }
  {
    type: CHECK
    title: "说话特点有那些？"
    p: '查看以下语言特征，选择合适的，可多选'
    items: [
      {l: '语音直而短',     v: '木'}
      {l: '齿音重',         v: '木'}
      {l: '直硬倔强',       v: '木'}

      {l: '说话声音尖多破', v: '火'}
      {l: '舌音重',         v: '火'}

      {l: '语音宽宏',       v: '土'}
      {l: '唇音重',         v: '土'}

      {l: '声音响亮',       v: '金'}
      {l: '唇音响亮圆润',   v: '金'}

      {l: '语音慢而低',     v: '水'}
      {l: '喉音重',         v: '水'}
    ]
  }
  {
    type: CHECK
    title: "的体型及行动表现有那些？"
    p: '查看以下身体特征，选择合适的，可多选'
    items: [
      {l: '两背直而平宽',   v: '木'}
      {l: '腰细长',         v: '木'}
      {l: '四肢长',         v: '木'}
      {l: '上宽下窄如树',   v: '木'}
      {l: '身材细高',       v: '木'}
      {l: '气度轩昂',       v: '木'}
      {l: '走路高压有声',   v: '木'}
      {l: '坐立时不斜不倚', v: '木'}
      {l: '穿衣整齐',       v: '木'}
      {l: '肩背耸直',       v: '木'}
      {l: '平肩',           v: '木'}
      {l: '发板',           v: '木'}
      {l: '头晃摇',         v: '木'}
      {l: '站有站相',       v: '木'}
      {l: '坐有坐相',       v: '木'}

      {l: '肩背方圆',     v: '土'}
      {l: '背多肉',       v: '土'}
      {l: '腰宽板直',     v: '土'}
      {l: '背隆腰厚',     v: '土'}
      {l: '行动稳重',     v: '土'}
      {l: '五短身材',     v: '土'}
      {l: '肌肉发达',     v: '土'}
      {l: '不慌张',       v: '土'}
      {l: '肩厚背厚',     v: '土'}
      {l: '手背厚',       v: '土'}
      {l: '坐立沉稳',     v: '土'}
      {l: '行动重实',     v: '土'}
      {l: '气度厚重安祥', v: '土'}

      {l: '腰圆',         v: '火'}
      {l: '胸背饱满不缺', v: '火'}
      {l: '腰下宽粗',     v: '火'}
      {l: '上尖下阔',     v: '火'}
      {l: '走路摇摆',     v: '火'}
      {l: '行动急速',     v: '火'}
      {l: '坐立摇摆不安', v: '火'}
      {l: '轻举妄动',     v: '火'}
      {l: '脚步急快',     v: '火'}

      {l: '身段苗条',     v: '金'}
      {l: '举止轻灵',     v: '金'}
      {l: '气度活泼',     v: '金'}
      {l: '瞻前顾后',     v: '金'}
      {l: '行动灵活',     v: '金'}
      {l: '进退文雅',     v: '金'}
      {l: '举止做作',     v: '金'}
      {l: '身段不高',     v: '金'}
      {l: '小巧玲珑',     v: '金'}

      {l: '腰肥圆',       v: '水'}
      {l: '前胸多肉',     v: '水'}
      {l: '腿短',         v: '水'}
      {l: '行动迟缓',     v: '水'}
      {l: '坐立好依扶',   v: '水'}
      {l: '萎靡不振',     v: '水'}
      {l: '气度缓和',     v: '水'}
    ]
  }
  {
    type: CHECK
    title: "患有那些病症？"
    p: '查看以下病症特征，选择合适的，多选'
    items: [
      {l: '肝病',         v: '木'}
      {l: '头迷眼干',     v: '木'}
      {l: '四肢无力',     v: '木'}
      {l: '胸肋疼痛',     v: '木'}
      {l: '胃腹膨胀',     v: '木'}

      {l: '心跳心慌',     v: '火'}
      {l: '心热吐血',     v: '火'}
      {l: '头晕目眩',     v: '火'}
      {l: '神经错乱',     v: '火'}

      {l: '脾胃虚弱',     v: '土'}
      {l: '上吐下泻',     v: '土'}
      {l: '消化不良',     v: '土'}
      {l: '食欲不振',     v: '土'}
      {l: '大肚子病',     v: '土'}

      {l: '肺病',         v: '金'}
      {l: '咳嗽痰喘',     v: '金'}
      {l: '气不足',       v: '金'}

      {l: '腰腿痛',       v: '水'}
      {l: '偏身痛',       v: '水'}
      {l: '肾病',         v: '水'}
      {l: '腹痛',         v: '水'}
      {l: '没精神',       v: '水'}
    ]
  }
  {
    type: CHECK
    title: "性格提点有那些？"
    p: '查看以下性格特点，选择合适的，多选'
    hide: '自己'
    items: [
      {l: '直率',      v: '木'}
      {l: '能立功',    v: '木'}
      {l: '擅经营',    v: '木'}
      {l: '心直口快',  v: '木'}
      {l: '喜正直',    v: '木'}
      {l: '憎恶邪恶',  v: '木'}
      {l: '憎恶虚假',  v: '木'}


      {l: '做事爽快',       v: '火'}
      {l: '勇猛不辞劳苦',   v: '火'}
      {l: '这山望着那山高', v: '火'}
      {l: '多贪外事',       v: '火'}

      {l: '诚实',           v: '土'}
      {l: '不会欺妄',       v: '土'}
      {l: '以作到底',       v: '土'}
      {l: '出力不讨好',     v: '土'}
      {l: '受劳受怨',       v: '土'}

      {l: '人情圆到',       v: '金'}
      {l: '看风使船',       v: '金'}
      {l: '不得罪人',       v: '金'}
      {l: '做活不用人操心', v: '金'}

      {l: '细密稳当',       v: '水'}
      {l: '缓和',           v: '水'}
      {l: '不慌张',     v: '水'}
      {l: '好生回头气',     v: '水'}

      #{l: '正直',             v: '木'}
      #{l: '敢做敢当',         v: '木'}
      #{l: '公正无私',         v: '木'}
      #{l: '心口如一',         v: '木'}
      #{l: '做事有良心',       v: '木'}
      #{l: '有恒心',           v: '木'}
      #{l: '坚韧耐劳',         v: '木'}
      #{l: '遇事不盲从',       v: '木'}
      #{l: '有定见',           v: '木'}
      #{l: '不谄谀',           v: '木'}
      #{l: '已立立人',         v: '木'}
      #{l: '已达达人',         v: '木'}
      #{l: '见人不对有可怜心', v: '木'}
      #{l: '不气他人',         v: '木'}
      #{l: '行为端正',         v: '木'}
      #{l: '能忍辱',           v: '木'}
      #{l: '长怀悲天悯人之心', v: '木'}
      #{l: '舍己从人',         v: '木'}
      #{l: '无苟行',           v: '木'}
      #{l: '杀身成人',         v: '木'}
      #{l: '有主意',           v: '木'}
      #{l: '心直口快',         v: '木'}
      #{l: '好生恶杀',         v: '木'}
      #{l: '有担当力',         v: '木'}

      #{l: '能立万物',         v: '木'}
      #{l: '仁民爱众',         v: '木'}
      #{l: '救人救世之愿',     v: '木'}

      #{l: '光明磊落',         v: '火'}
      #{l: '通情达理',         v: '火'}
      #{l: '举止大方',         v: '火'}
      #{l: '聪明谦让',         v: '火'}
      #{l: '有自知之明',       v: '火'}
      #{l: '举止合度',         v: '火'}
      #{l: '守礼守分',         v: '火'}
      #{l: '不争不贪',         v: '火'}
      #{l: '温良恭谦让',       v: '火'}
      #{l: '温恭安祥',         v: '火'}
      #{l: '有知人之智',       v: '火'}
      #{l: '文采节制',         v: '火'}
      #{l: '表度有章',         v: '火'}
      #{l: '知礼达时',         v: '火'}

      #{l: '事无巨细考虑周详', v: '火'}
      #{l: '能化万物',         v: '火'}

      #{l: '信实忠厚',     v: '土'}
      #{l: '宽宏大量',     v: '土'}
      #{l: '举止稳重',     v: '土'}
      #{l: '不好计较',     v: '土'}
      #{l: '言行一致',     v: '土'}
      #{l: '内外如一',     v: '土'}
      #{l: '吃亏包容',     v: '土'}
      #{l: '勤俭朴素',     v: '土'}
      #{l: '笃诚淳朴',     v: '土'}
      #{l: '克尽职责',     v: '土'}
      #{l: '任重致远',     v: '土'}
      #{l: '出言任事',     v: '土'}
      #{l: '执中守道',     v: '土'}
      #{l: '始终不谕',     v: '土'}
      #{l: '为人谋而忠',   v: '土'}
      #{l: '与人交而久',   v: '土'}
      #{l: '稳重实做实行', v: '土'}
      #{l: '性谨慎有信实', v: '土'}

      #{l: '信人容物',     v: '土'}
      #{l: '笃行道德',     v: '土'}
      #{l: '能容能化',     v: '土'}

      #{l: '性豪爽',         v: '金'}
      #{l: '做活不用人操心', v: '金'}
      #{l: '有义气',         v: '金'}
      #{l: '善交际',         v: '金'}
      #{l: '见义勇为',       v: '金'}
      #{l: '有谋善断',       v: '金'}
      #{l: '敏捷伶俐',       v: '金'}
      #{l: '会找人好处',     v: '金'}
      #{l: '能应万事',       v: '金'}
      #{l: '敏捷果断',       v: '金'}
      #{l: '善言谈',         v: '金'}
      #{l: '大量能让',       v: '金'}
      #{l: '大义包容',       v: '金'}
      #{l: '活泼开朗',       v: '金'}
      #{l: '随机应变',       v: '金'}
      #{l: '活泼豪爽',       v: '金'}
      #{l: '应对自如',       v: '金'}
      #{l: '有谋善断',       v: '金'}
      #{l: '看风使舵',       v: '金'}
      #{l: '不得罪人',       v: '金'}
      #{l: '取人之长',       v: '金'}
      #{l: '见善勇为',       v: '金'}
      #{l: '知过必改',       v: '金'}
      #{l: '富有责任心',     v: '金'}
      #{l: '遇事迎刃而解',   v: '金'}
      #{l: '制裁适宜',       v: '金'}
      #{l: '刚毅果敢',       v: '金'}
      #{l: '事无巨细',       v: '金'}
      #{l: '泛应曲当',       v: '金'}
      #{l: '危难不避',       v: '金'}
      #{l: '条理精详',       v: '金'}
      #{l: '义涵百有',       v: '金'}
      #{l: '片言折狱',       v: '金'}
      #{l: '劳怨弗辞',       v: '金'}
      #{l: '见得思义',       v: '金'}

      #{l: '人情圆满',       v: '金'}
      #{l: '缘大',           v: '金'}

      #{l: '活泼自然',           v: '水'}
      #{l: '心灵手巧',           v: '水'}
      #{l: '随遇而安',           v: '水'}
      #{l: '敢作敢当',           v: '水'}
      #{l: '好说话',             v: '水'}
      #{l: '多智慧',             v: '水'}
      #{l: '平和悠闲',           v: '水'}
      #{l: '擅精艺术',           v: '水'}
      #{l: '儒雅',               v: '水'}
      #{l: '不怕事',             v: '水'}
      #{l: '沉稳雅静',           v: '水'}
      #{l: '遇事有道',           v: '水'}
      #{l: '应付自如',           v: '水'}
      #{l: '智慧巧思',           v: '水'}
      #{l: '恬淡虚静',           v: '水'}
      #{l: '风流无争',           v: '水'}
      #{l: '能认不是',           v: '水'}
      #{l: '兼有巧思',           v: '水'}
      #{l: '涵养力强',           v: '水'}
      #{l: '劝世化人',           v: '水'}
      #{l: '成事而不居功',       v: '水'}
      #{l: '随方就圆',           v: '水'}
      #{l: '能低矮就下',         v: '水'}
      #{l: '功成不居',           v: '水'}
      #{l: '性柔和',             v: '水'}

      #{l: '涵养而德大',         v: '水'}
      #{l: '润滋而功深',         v: '水'}
      #{l: '德大功大而不现好',   v: '水'}
      #{l: '尽性立命是成圣的根', v: '水'}
      #
      #
      #{l: '好怒',           v: '木'}
      #{l: '性情粗暴',       v: '木'}
      #{l: '出言撞人',       v: '木'}
      #{l: '常骄傲',         v: '木'}
      #{l: '好毁谤',         v: '木'}
      #{l: '因小失大',       v: '木'}
      #{l: '优柔寡断',       v: '木'}
      #{l: '办事主观',       v: '木'}
      #{l: '高傲自大',       v: '木'}
      #{l: '好说酸话',       v: '木'}
      #{l: '见不如意就生气', v: '木'}
      #{l: '渐生乖戾',       v: '木'}
      #{l: '以私害公',       v: '木'}
      #{l: '以情悖理',       v: '木'}
      #{l: '性多偏激',       v: '木'}
      #{l: '执拗顽梗',       v: '木'}
      #{l: '独持己见',       v: '木'}
      #{l: '滞塞满胸',       v: '木'}
      #{l: '不易接近',       v: '木'}
      #{l: '不服人',         v: '木'}
      #{l: '掘人隐私',       v: '木'}
      #{l: '好抗上',         v: '木'}
      #{l: '不爱接受意见',   v: '木'}
      #{l: '出言撞人',       v: '木'}
      #{l: '做事不许人反驳', v: '木'}
      #{l: '器量窄小',       v: '木'}
      #{l: '不耐激触',       v: '木'}
      #{l: '亏孝道',         v: '木'}
      #{l: '脾气直硬',       v: '木'}
      #{l: '伤人不自觉',     v: '木'}
      #{l: '粗暴好争',       v: '木'}
      #{l: '怒气填胸',       v: '木'}
      #{l: '宁折不弯',       v: '木'}
      #{l: '难成事功',       v: '木'}
      #{l: '主于孤苦',       v: '木'}
      #{l: '老来焦稍',       v: '木'}
      #{l: '缘浅德薄',       v: '木'}
      #{l: '容易犯上焦火',   v: '木'}
      #{l: '肝火气旺',       v: '木'}
      #{l: '平生遇事多难',   v: '木'}
      #{l: '常不如意',       v: '木'}
      #{l: '阳和气少',       v: '木'}
      #{l: '愈形乖戾',       v: '木'}
      #{l: '我见太深',       v: '木'}
      #{l: '好怒，以愚蠢开始，以后悔告终，往往干出无法挽回的蠢事',             v: '木'}
      #{l: '身子直硬',       v: '木'}

      #{l: '好恨',             v: '火'}
      #{l: '急躁多贪',         v: '火'}
      #{l: '喜虚荣',           v: '火'}
      #{l: '多猜忌',           v: '火'}
      #{l: '有始无终',         v: '火'}
      #{l: '外明内暗',         v: '火'}
      #{l: '得理不让人',       v: '火'}
      #{l: '贪名爱面子',       v: '火'}
      #{l: '贪而无厌',         v: '火'}
      #{l: '好夸张',           v: '火'}
      #{l: '拘谨务外表',       v: '火'}
      #{l: '做事荒唐',         v: '火'}
      #{l: '虎头蛇尾',         v: '火'}
      #{l: '奔高贪好',         v: '火'}
      #{l: '半途而废',         v: '火'}
      #{l: '争名逐利',         v: '火'}
      #{l: '见人不见己',       v: '火'}
      #{l: '知进不知退',       v: '火'}
      #{l: '言词疏阔冗长',     v: '火'}
      #{l: '欺负老实人',       v: '火'}
      #{l: '脾气一阵风一阵雨', v: '火'}
      #{l: '有口无心',         v: '火'}
      #{l: '心火大',           v: '火'}
      #{l: '吹毛求疵',         v: '火'}
      #{l: '好争理',           v: '火'}
      #{l: '喜奉承',           v: '火'}
      #{l: '态度拘谨',         v: '火'}
      #{l: '多事多败、',       v: '火'}
      #{l: '一生多苦',         v: '火'}
      #{l: '常以屑琐细故，致使全家不',     v: '火'}
      #{l: '容易犯上焦火',     v: '火'}
      #{l: '可与共患难，不可与共富贵。',     v: '火'}
      #{l: '行多过失，屡改屡犯',     v: '火'}
      #{l: '老年多昏愦',       v: '火'}
      #{l: '隐而后发，一发便易引起狂涛巨浪，往往存有预谋。', v: '火'}
      #{l: '行多狂妄',         v: '火'}
      #{l: '虚妄人情隔膜',     v: '火'}

      #{l: '固执呆板',     v: '土'}
      #{l: '不尚外表',     v: '土'}
      #{l: '思想单纯',     v: '土'}
      #{l: '蠢笨蛮横',     v: '土'}
      #{l: '气量狭隘',     v: '土'}
      #{l: '孤陋寡闻',     v: '土'}
      #{l: '心小量窄',     v: '土'}
      #{l: '近于愚直',     v: '土'}
      #{l: '不明礼',       v: '土'}
      #{l: '蛮横不能言',   v: '土'}
      #{l: '易上当受骗',   v: '土'}
      #{l: '不开通',       v: '土'}
      #{l: '假中厚',       v: '土'}
      #{l: '寡言少语',     v: '土'}
      #{l: '好生怨气',     v: '土'}
      #{l: '疑心特大',     v: '土'}
      #{l: '虚伪妄言',     v: '土'}
      #{l: '脾气有时呆板', v: '土'}
      #{l: '心小量窄',     v: '土'}
      #{l: '待人不知疼爱', v: '土'}
      #{l: '无中生有',     v: '土'}
      #{l: '信自己多疑人', v: '土'}
      #{l: '固步自封',     v: '土'}
      #{l: '以假当真',     v: '土'}
      #{l: '一生多累',     v: '土'}
      #{l: '好怨',         v: '土'}
      #{l: '含而不露，忍而不发，不伤他人，伤自己。',       v: '土'}
      #{l: '不能容纳众思广知以资互助',       v: '土'}
      #{l: '则郁结生阴',   v: '土'}
      #{l: '不能开物成务', v: '土'}
      #{l: '多怨人',       v: '土'}
      #{l: '言行信果',     v: '土'}
      #{l: '未必中理',     v: '土'}
      #{l: '不能发展',     v: '土'}
      #{l: '诚实朴拙',     v: '土'}

      #{l: '多恼',         v: '金'}
      #{l: '多虚假',       v: '金'}
      #{l: '好分辨',       v: '金'}
      #{l: '不让人',       v: '金'}
      #{l: '喜变更',       v: '金'}
      #{l: '虚妄不实',     v: '金'}
      #{l: '嘴甜心苦',     v: '金'}
      #{l: '好冷笑',       v: '金'}
      #{l: '习于谄媚',     v: '金'}
      #{l: '残忍嫉妒',     v: '金'}
      #{l: '心口不一',     v: '金'}
      #{l: '虚伪好辩',     v: '金'}
      #{l: '言词僻佞偏妄', v: '金'}
      #{l: '骄躁',         v: '金'}
      #{l: '心逆而险',     v: '金'}
      #{l: '言伪而偏辩',   v: '金'}
      #{l: '巧言令色',     v: '金'}
      #{l: '记仇而博',     v: '金'}
      #{l: '笑里藏刀',     v: '金'}
      #{l: '妒公害能',     v: '金'}
      #{l: '小盗轻狂',     v: '金'}
      #{l: '肋肩谄笑',     v: '金'}
      #{l: '掩人善行',     v: '金'}
      #{l: '喜闻人过',     v: '金'}
      #{l: '好言人短',     v: '金'}
      #{l: '挟势恣横',     v: '金'}
      #{l: '凶狠成性',     v: '金'}
      #{l: '刻薄寡恩',     v: '金'}
      #{l: '狭猬无义',     v: '金'}
      #{l: '夫妻寡义',     v: '金'}
      #{l: '兄弟分崩离析', v: '金'}
      #{l: '多出于嫉妒，好表现小动作。',       v: '金'}
      #{l: '得权在位，便能乱世',       v: '金'}
      #{l: '在家中则父子责善',       v: '金'}

      #{l: '多烦',           v: '水'}
      #{l: '多愚鲁',         v: '水'}
      #{l: '好烦闷',         v: '水'}
      #{l: '喜缓和',         v: '水'}
      #{l: '迟钝',           v: '水'}
      #{l: '忧虑',           v: '水'}
      #{l: '言词滞涩',       v: '水'}
      #{l: '遇事退缩',       v: '水'}
      #{l: '习惯邋遢',       v: '水'}
      #{l: '懒惰',           v: '水'}
      #{l: '行多愚阔',       v: '水'}
      #{l: '行多愚拙',       v: '水'}
      #{l: '自卑受欺',       v: '水'}
      #{l: '不能自立',       v: '水'}
      #{l: '多忧多虑',        v: '水'}
      #{l: '待物以理',        v: '水'}
      #{l: '激溜发烦',        v: '水'}
      #{l: '被欺受气',        v: '水'}
      #{l: '好生回头气',      v: '水'}
      #{l: '是非不明',        v: '水'}
      #{l: '善恶不知',        v: '水'}
      #{l: '自卑自弃',        v: '水'}
      #{l: '思虑后悔',        v: '水'}
      #{l: '昏懦萎靡',        v: '水'}
      #{l: '好独处',          v: '水'}
      #{l: '不喜和生人交谈',  v: '水'}
      #{l: '沉默寡言笑',      v: '水'}
      #{l: '不活泼',          v: '水'}
      #{l: '好包屈',          v: '水'}
      #{l: '喜生回头气',      v: '水'}
      #{l: '优柔寡断',        v: '水'}
      #{l: '是非不明',        v: '水'}
      #{l: '善恶不知',        v: '水'}
      #{l: '缺独立性',        v: '水'}
      #{l: '被欺受气',        v: '水'}
      #{l: '好生回头气',      v: '水'}
      #{l: '肮脏不爱干净',    v: '水'}
      #{l: '不讲究',          v: '水'}
      #{l: '进退失据',        v: '水'}
      #{l: '沉默寡言笑',      v: '水'}
      #{l: '不活泼',          v: '水'}
      #{l: '不能周旋中规',    v: '水'}
      #{l: '抑郁终身',        v: '水'}
      #{l: '无所长短',        v: '水'}
      #{l: '处事失机后时',    v: '水'}
      #{l: '不能率',          v: '水'}
      #{l: '眼钝',            v: '水'}
      #{l: '心迟',            v: '水'}
      #{l: '静多动少',        v: '水'}
      #{l: '性退缩',         v: '水'}
      #{l: '无论家庭社会亦不能齐',             v: '水'}
      #{l: '自我封闭，人我思想感情交流的通道常被堵塞。',             v: '水'}
      #{l: '一生多受气',      v: '水'}
      #{l: '无独立事功能力', v: '水'}
      #{l: '好烦人不能接人以情',             v: '水'}
    ]
  }
  {
    type: END
    title: '测试结果'
    p: '本测试结果仅供参考'
  }
]
