eval($q=%w[
trap(2){$i=1};
z=[0xeaaae,0x88888,0xe2e8e,0xe8e8e,0x88eaa,0xe8e2e,0xeae2e,0x8888e,0xeaeae,0xe8eae];
e=27.chr+91.chr;
h=e+';43m';
r=e+'0m';
j=1;
loop{
s="eval($q=%w[#$q]*'')##transcendental#kata##lonelyelk#".chars.reverse;
n=(s.size/58.0).ceil;
g=(n-5)/2.0;
p=->{puts(58.times.map{s.pop}*'')};
g.floor.times{p[]};
5.times{|i|Time.now.strftime('%H:%M:%S').chars.each{|c|y,m=(c=~/\d/)&&[z[c.to_i],4]||[136,2];m.times{|x|print(((y&1<<(x+i*m)==0||(m==2&&j)||$j)&&'%s'||h+'%s'+r)%(s.pop+s.pop))}};puts(s.pop+s.pop)};
g.ceil.times{p[]};
$j&&break;
$j=$i;
sleep(0.5);j=!j;
print("\r"+e+n.to_s+?A);
};puts(32.chr*58)
]*'')

#5.times{|i|Time.now.strftime('%H:%M:%S').chars.each{|c|z[c][5].downto(0){|x|print(((z[c][i]&1<<x).zero?&&'%s'||"#$h%s#$r")%s.pop)}};puts(s.pop+s.pop)};
# d,l,b,a=[3,48,51,63];
# z={?0=>[a,b,b,b,a,7],?1=>[d,d,d,d,d,7],?2=>[a,d,a,l,a,7],?3=>[a,d,a,d,a,7],?4=>[b,b,a,d,d,7],?5=>[a,l,a,d,a,7],?6=>[a,l,a,b,a,7],?7=>[a,d,d,d,d,7],?8=>[a,b,a,b,a,7],?9=>[a,b,a,d,a,7],?:=>[0,d,0,d,0,3]};
# z.each{|k,v|
#   p(k);
#   o=5.times.inject(""){|acc,i|acc+(0..v[5]).map{|x|(v[4-i]&1<<x).zero?&&?0||?1}*''};
#   p(o.gsub!(/(\d)\1/,'\1'));
#   p(o.to_i(2).to_s(16));
#   p(((v[5]+1)/2+(o.to_i(2)<<4)).to_s(16))
# };