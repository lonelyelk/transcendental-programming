eval(q=%w!
include(Math);
w = 62;
h = 25;
d = 200;
c = 40;
r = 24;
pi = 3.14;
s=32.chr;
g=33.chr;
e=27.chr;
q="eval(q=%w#{g}#{q}#{g}.join)".chars;
u = ->(ph){k=d*2;k.times.inject({}){|o,j|
  x = r*cos(pi*4*j/k+ ph);
  y = (j<k/32||j>=31*k/32)&&0.31 - 0.24*cos(pi*8*j/k);
  y||=j>=k/32&&j<15*k/32&&0.42 * sin(pi*4*j/k);
  y||=j>=15*k/32&&j<17*k/32&&0.24 * cos(pi*8*j/k) - 0.31;
  y||=-0.42 * sin(pi*4*j/k);
  y *= r;
  o[[x.round,y.round]] = true;o
}};
b = u[pi/10];
n=0;
a = h.times.map{|y|w.times.map{|x|t=b[[x-w/2,y-h/2]];t&&n+=1;t&&q.sample||(q[y*w+x-n]||?#)}*''};
z=->(x,y,m){m&&"#{e}[30;44m#{s}#{e}[0m"||s};
o = ->(f){h.times{|y| w.times{|x| print(z[x,y,f[[x-w/2,y-h/2]]])};puts};sleep(0.07);print("#{e}[#{h}A")};
l = ->(fr,ph,s=true){k=d*fr;k.times.inject({}){|o,j|
  x = (r*cos(pi*2*j/k * fr + ph)).round;
  y = (r*0.42*sin(pi*2*j/k)).round;
  o[[x,y]] = true;
  o[[-x,y]] ||= s;o
}};
c.times{|i|o[l[1, 3*pi/2*(1 - cos(pi*i/c/2))]]};
z=->(x,y,m){m&&"#{e}[34m#{a[y][x]}#{e}[0m"||s};
c.times{|i|o[l[2, pi/2 + 2.828*pi*sin(-pi/4 + pi*i/c/2)**3,false]]};
z=->(x,y,m){m&&s||a[y][x]};
c.times{|i|o[l[3, pi/3 + pi*sin(pi*i/c),false]]};
z=->(x,y,m){m&&"#{e}[30;44m#{a[y][x]}#{e}[0m"||a[y][x]};
c.times{|i|o[l[1, pi/2 + 2.828*pi*sin(-pi/4 + pi*i/c/2)**3]]};
c = 20;
z=->(x,y,m){m&&"#{e}[30;44m#{s+e}[0m"||a[y][x]};
c.times{|i|o[u[pi/2 - 4*pi*sin(pi*i/c/2)/10]]};
c.times{o[b]};
z=->(x,y,m){m&&s||a[y][x]};
o[b];
print("#{e}[#{h}B")
#lonelyelk#2025#cresta#!.join)