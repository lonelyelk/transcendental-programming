global.queue="queue=qqqueueqq.upcasenneval r=<<-'RUBY'nnslf=%Q(queue=qqqueueqq.upcasenneval r=<<-'RUBY'nn#{r}RUBY)nnqueue+=qqcc#{slf.gsub(10.chr,110.chr*2).gsub(34.chr,113.chr*2).gsub('cc',99.chr*2)}qqnnindex=queue.index('cc')nnputs queue[0...index].gsub(110.chr*2,10.chr).gsub(113.chr*2,34.chr).gsub(99.chr*2,'cc').sub('queue'.upcase,queue[(index+1)..])nnRUBY:quine2"
Function('j', 't',
global.j=`self="global.queue=zzQQQzzxxFunction('j', 't',xxglobal.j=ttjjtt)(global.j, 'tt')"
    .replace(/zz/g, unescape('%22'))
    .replace(/xx/g, unescape('%0a'))
    .replace(/tt/g, t)
    .replace(/jj/g, j)
    .replace('QQQ', 'queue'.toUpperCase())
o_N=unescape('%6e')+unescape('%6e')
o_Q=unescape('%71')+unescape('%71')
o_C=unescape('%63')+unescape('%63')
queue=queue+':'+self.replace(new RegExp(unescape('%0a'), 'g'), o_N)
    .replace(/"/g, o_Q)
    .replace(/:/g, o_C)
index=queue.indexOf(':')
console.log(queue.slice(0, index)
    .replace(new RegExp(o_C, 'g'), ':')
    .replace(new RegExp(o_Q, 'g'), '"')
    .replace(new RegExp(o_N, 'g'), unescape('%0a'))
    .replace('queue'.toUpperCase(), queue.slice(index+1, queue.length)))`)(global.j, '`')
