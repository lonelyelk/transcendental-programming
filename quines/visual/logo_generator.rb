# uncomment and run
# eval(q=%w!
w = 60;
h = 23;
d = 200;
c = 40;
r = 24;
pi = 3.14;
s=32.chr;
g=33.chr;
q="eval(q=%w#{g}#{q}#{g}.join)";
z=->(x,y,m){m&&"\e[30;44m#{s}\e[0m"||s};
o = ->(f){h.times{|y| w.times{|x| print(z[x,y,f[[x-w/2,y-h/2]]])};puts};sleep(0.07);print("\e[#{h}A")};
l = ->(fr,ph,s=true){dd=d*fr;dd.times.each_with_object({}){|j, o|
  x = r*Math.cos(pi*2*j/dd * fr + ph);
  y = r*0.42*Math.sin(pi*2*j/dd);
  o[[x.round,y.round]] = true;
  o[[-x.round,y.round]] ||= s;
}};
c.times{|i|o[l[1, 3*pi/2*(1 - Math.cos(pi*i/c/2))]]};
z=->(x,y,m){m&&"\e[34m#{q[y*w+x]||?*}\e[0m"||s};
c.times{|i|o[l[2, pi/2 + 2.828*pi*Math.sin(-pi/4 + pi*i/c/2)**3,false]]};
z=->(x,y,m){m&&s||(q[y*w+x]||?*)};
c.times{|i|o[l[3, pi/3 + pi*Math.sin(pi*i/c),false]]};
z=->(x,y,m){m&&"\e[34m#{q[y*w+x]||?*}\e[0m"||(q[y*w+x]||?*)};
c.times{|i|o[l[1, pi/2 + 2.828*pi*Math.sin(-pi/4 + pi*i/c/2)**3]]};
l = ->(ph){dd=d*2;dd.times.each_with_object({}){|j, o|
  x = r*Math.cos(pi*4*j/dd+ ph);
  y = (j<dd/32||j>=31*dd/32)&&0.31 - 0.24*Math.cos(pi*8*j/dd);
  y||=j>=dd/32&&j<15*dd/32&&0.42 * Math.sin(pi*4*j/dd);
  y||=j>=15*dd/32&&j<17*dd/32&&0.24 * Math.cos(pi*8*j/dd) - 0.31;
  y||=-0.42 * Math.sin(pi*4*j/dd);
  y *= r;
  o[[x.round,y.round]] = true;
}};
c = 20;
z=->(x,y,m){m&&"\e[30;44m#{s}\e[0m"||(q[y*w+x]||?*)};
c.times{|i|o[l[pi/2 - 4*pi*Math.sin(pi*i/c/2)/10]]};
f = l[pi/10];
z=->(x,y,m){m&&"\e[30;44m#{q[y*w+x]||?*}\e[0m"||(q[y*w+x]||?*)};
c.times{o[f]};
z=->(x,y,m){q[y*w+x]||?*};
o[{}];
print("\e[#{h}B")
#lonelyelk#cresta#security#engineer#!.join)