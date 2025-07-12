eval(q=%w!include(Math);w=62;h=25;d=200;c=40;r=24;pi=3.14;s=32
.chr;g=33.chr;e=27.chr;q="eval(q=%w#{g}#{q}#{g}.join)".chars;u
=->(ph){k=d*2;k.t                             imes.inject({}){
|o,j|x=r*cos(    pi*4*j/k+     p     h);y=(j<k    /32||j>=31*k
/32)&&0.31   -0.24*co     s(pi*8*j/k)     ;y||=j>=   k/32&&j<1
5*k/32&&0  .42*sin(   pi*4*j/k);y||=j>=15   *k/32&&j  <17*k/32
&&0.24*c  os(pi*   8*j/k)-0.31;y||=-0.42*sin   (pi*4*  j/k);y*
=r;o[[x  .roun   d,y.round]]=true;o}};b=u[pi/1   0];n=  0;a=h.
times.m ap{|  y|w.times.map{|x|t=b[[x-w/2,y-h/2]]  ;t&& n+=1;t
&&q.sam ple  ||(q[y*w+x-n]||?#)}*''};z=->(x,y,m){m  &&" #{e}[3
0;44m#{ s}  #{e}[0m"||s};o=->(f){h.times{|y|w.times     {|x|pr
int(z[x   ,y,f[[x-w/2,y-h/2]]])};puts};sleep(0.07);print("#{e}
[#{h}A") };l=->(fr,ph,s=true){k=d*fr;k.times.inject({}){|o,j|x
=(r*cos   (pi*2*j/k*fr+ph)).round;y=(r*0.42*sin(pi*2*j/k)).rou
nd;o[[x ,y  ]]=true;o[[-x,y]]||=s;o}};c.times{|i|o[     l[1,3*
pi/2*(1 -co  s(pi*i/c/2))]]};z=->(x,y,m){m&&"#{e}[  34m #{a[y]
[x]}#{e }[0m  "||s};c.times{|i|o[l[2,pi/2+2.828*p i*sin (-pi/4
+pi*i/c  /2)**   3,false]]};z=->(x,y,m){m&&s||   a[y][  x]};c.
times{|i  |o[l[3   ,pi/3+pi*sin(pi*i/c),fals   e]]};z  =->(x,y
,m){m&&"#  {e}[30;4   4m#{a[y][x]}#{e}[0m   "||a[y][  x]};c.ti
mes{|i|o[l   [1,pi/2+     2.828*pi*sin    (-pi/4+p   i*i/c/2)*
*3]]};c=20;z=    ->(x,y,m)     {      m&&"#{e}    [30;44m#{s+e
}[0m"||a[y][x]};c                              .times{|i|o[u[p
i/2-4*pi*sin(pi*i/c/2)/10]]};c.times{o[b]};z=->(x,y,m){m&&s||a
[y][x]};o[b];print("#{e}[#{h}B")#lonelyelk#2025#cresta#!.join)