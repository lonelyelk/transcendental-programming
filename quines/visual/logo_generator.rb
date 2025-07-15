eval(q=%w!
include(Math);
w = 66;
h=r = 25;
d = 200;
c = 40;
pi = 3.14;
s=32.chr;
g=33.chr;
e=27.chr;
q="eval(q=%w#{g}#{q}#{g}*'')".chars;
u = ->(p){k=d*2;k.times.inject({}){|o,j|
  x = r*cos(pi*4*j/k+ p);
  y = (j<k/32||j>=31*k/32)&&0.31 - 0.24*cos(pi*8*j/k);
  y||=j>=k/32&&j<15*k/32&&0.42 * sin(pi*4*j/k);
  y||=j>=15*k/32&&j<17*k/32&&0.24 * cos(pi*8*j/k) - 0.31;
  y||=-0.42 * sin(pi*4*j/k);
  y *= r;
  o[[x.round,y.round]] = true;o
}};
b = u[pi/9];
n=0;
a = h.times.map{|y|w.times.map{|x|t=b[[x-w/2,y-h/2]];t&&n+=1;t&&q.sample||(q[y*w+x-n]||?#)}};
z=->(x,y,m){m&&"#{e}[30;44m#{s}#{e}[0m"||s};
o = ->(f){h.times{|y| w.times{|x| print(z[x,y,f[[x-w/2,y-h/2]]])};puts};sleep(0.07);print("#{e}[#{h}A")};
l = ->(fr,p,s=nil){k=d*fr;k.times.inject({}){|o,j|
  x = (r*cos(pi*2*j/k * fr + p)).round;
  y = (r*0.42*sin(pi*2*j/k)).round;
  o[[x,y]] = 1;
  o[[-x,y]] ||= s;o
}};
c.times{|i|o[l[1, 3*pi/2*(1 - cos(pi*i/c/2)),1]]};
z=->(x,y,m){m&&"#{e}[34m#{a[y][x]}#{e}[0m"||s};
c.times{|i|o[l[2, pi/2 + 2.828*pi*sin(pi*i/c/2-pi/4)**3]]};
z=->(x,y,m){m&&s||a[y][x]};
c.times{|i|o[l[3, pi/3 + pi*sin(pi*i/c)]]};
z=->(x,y,m){m&&"#{e}[30;44m#{a[y][x]}#{e}[0m"||a[y][x]};
l = ->(p){k=d*2;k.times.inject({}){|o,j|
  x = (r*cos(pi*2*j/k)).round;
  y = (r*0.42/(1+p.abs+0.3*(4-p**2))*(sin(pi*4*j/k) + p*sin(pi*2*j/k))).round;
  o[[x,y]] = 1;o
}};
(c+1).times{|i|o[l[2*(2.0*i - c)/c]]};
c = 20;
z=->(x,y,m){m&&"#{e}[30;44m#{s+e}[0m"||a[y][x]};
c.times{|i|o[u[pi*sin(pi*i/c/2)/9]]};
c.times{o[b]};
z=->(x,y,m){m&&s||a[y][x]};
o[b];
puts("#{e}[#{h-1}B");puts
###lonelyelk~~2025~~cresta###!*'')