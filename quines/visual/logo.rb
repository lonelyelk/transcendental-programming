eval(q=%w!include(Math);w=66;h=r=25;d=200;c=40;pi=3.14;s=32.chr;g=
33.chr;e=27.chr;q="eval(q=%w#{g}#{q}#{g}*'')".chars;u=->(ph){k=d*2
;k.times.inject                                     ({}){|o,j|x=r*
cos(pi*4*j/k    +ph);y=(j<k     /32     ||j>=31*k/3    2)&&0.31-0.
24*cos(pi*8  *j/k);y||=    j>=k/32&&j<15    *k/32&&0.4  2*sin(pi*4
*j/k);y||  =j>=15*k/   32&&j<17*k/32&&0.24*c   os(pi*8*j  /k)-0.31
;y||=-0.4 2*sin(pi   *4*j/k);y*=r;o[[x.round,y   .round]] =true;o}
};b=u[pi /9];n=0  ;a=h.times.map{|y|w.times.map{|  x|t=b[[ x-w/2,y
-h/2]];t &&n+=  1;t&&q.sample||(q[y*w+x-n]||?#)}*''  };z=- >(x,y,m
){m&&"#{ e}[  30;44m#{s}#{e}[0m"||s};o=->(f){h.times  {|y| w.times
{|x|prin t(  z[x,y,f[[x-w/2,y-h/2]]])};puts};sleep(0.0     7);prin
t("#{e}[#   {h}A")};l=->(fr,ph,s=nil){k=d*fr;k.times.inject({}){|o
,j|x=(r*c  os(pi*2*j/k*fr+ph)).round;y=(r*0.42*sin(pi*2*j/k)).roun
d;o[[x,y]   ]=1;o[[-x,y]]||=s;o}};c.times{|i|o[l[1,3*pi/2*(1-cos(p
i*i/c/2) ),  1]]};z=->(x,y,m){m&&"#{e}[34m#{a[y][x]}#{     e}[0m"|
|s};c.ti mes  {|i|o[l[2,pi/2+2.828*pi*sin(pi*i/c/2-p  i/4) **3]]};
z=->(x,y ,m){m  &&s||a[y][x]};c.times{|i|o[l[3,pi/3  +pi*s in(pi*i
/c)]]};z =->(x,y  ,m){m&&"#{e}[30;44m#{a[y][x]}#{  e}[0m"| |a[y][x
]};l=->(p h){k=d*2   ;k.times.inject({}){|o,j|   x=(r*cos (pi*2*j/
k)).round  ;y=(r*0.4   2/(1+ph.abs)*(sin(pi*   4*j/k)+ph *sin(pi*2
*j/k))).rou  nd;o[[x,y]    ]=1;o}};c.tim    es{|i|o[l[  2*(2.0*i-c
)/c]]};c=20;    z=->(x,y,m)     {m&     &"#{e}[30;4    4m#{s+e}[0m
"||a[y][x]};c.t                                     imes{|i|o[u[4*
pi/9-3*pi*sin(pi*i/c/2)/9]]};c.times{o[b]};z=->(x,y,m){m&&s||a[y][
x]};o[b];puts("#{e}[#{h-1}B")####lonelyelk~~2025~~cresta####!*'')#
