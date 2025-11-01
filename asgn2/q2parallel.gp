set terminal pngcairo
set output 'q2parallel.png'
set encoding utf8

set parametric
set urange [0:2*pi]
set vrange [-pi/2:pi/2]
unset border
unset xtics
unset ytics
unset ztics
unset hidden3d
set key
set view 60,0
set isosamples 100, 100
set title "Radiation pattern when acceleration is parallel to velocity"
a(b) = (-1/b+sqrt(1/b**2 + 24)) / 4
m(b) = (1-a(b)**2) / (1-b*a(b))**6
fpar(u,v,b) = (cos(v)**2 / (1 - b * sin(v))**6) / m(b)
gx(u,v) = cos(u)*cos(v)
gy(u,v) = sin(u)*cos(v)
gz(u,v) = sin(v)
splot for [b in "0.1 0.9 0.999"] fpar(u,v,b)*gx(u,v), fpar(u,v,b)*gy(u,v), fpar(u,v,b)*gz(u,v) title sprintf("β = %s", b)
