# eval(%w!
w = 80;
h = 30;
d = 200;
c = 40;
r = 24;
pi = 3.14;
s=32.chr;
o = ->(f){h.times{|y| w.times{|x| print(f[[x-w/2,y-h/2]]&&?*||s)};puts};sleep(0.07);print("\e[#{h}A")};
l = ->(fr,ph,s=true){dd=d*fr;dd.times.each_with_object({}){|j, o|
  x = r*Math.cos(pi*2*j/dd * fr + ph);
  y = r*0.42*Math.sin(pi*2*j/dd);
  o[[x.round,y.round]] = true;
  o[[-x.round,y.round]] ||= s;
}};
c.times{|i|o[l[1, 3*pi/2*(1 - Math.cos(pi*i/c/2))]]};
c.times{|i|o[l[2, pi/2 + 2.828*pi*Math.sin(-pi/4 + pi*i/c/2)**3,false]]};
c.times{|i|o[l[3, pi/3 + pi*Math.sin(pi*i/c),false]]};
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
c.times{|i|o[l[pi/2 - 4*pi*Math.sin(pi*i/c/2)/10]]};
f = l[pi/10];
c.times{o[f]};
print("\e[#{h-1}B")
# !.join)