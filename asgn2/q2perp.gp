set terminal pngcairo
set output 'q2perp.png'
set encoding utf8

set parametric
set urange [0:pi]
set vrange [-pi/2:pi/2]
unset border
unset xtics
unset ytics
unset ztics
set hidden3d
set key
set view 60,0
set isosamples 100, 100
set title "Radiation pattern when acceleration is perpendicular to velocity"
g(b) = 1 / sqrt(1-b**2)
fpar(u,v,b) = ((1 - b)**4 / (1-b*sin(v))**4) * (1 - (cos(v)**2 * cos(u)**2)/(g(b)**2 * (1-b*sin(v))**2))
gx(u,v) = cos(u)*cos(v)
gy(u,v) = sin(u)*cos(v)
gz(u,v) = sin(v)
splot for [b in "0.1 0.9 0.999"] fpar(u,v,b)*gx(u,v), fpar(u,v,b)*gy(u,v), fpar(u,v,b)*gz(u,v) title sprintf("β = %s", b)
