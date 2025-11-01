set terminal pngcairo font ',10'
set output 'figs/q5.png'
set encoding utf8

set xrange [0:1]
set samples 10000
f(t) = -900 * cos(30 * t) + (1 / 10000) * sin(30 * t) * exp(t / 100) + (3 / 5) * cos(30 * t) * exp(t / 100)
set title "Radiation reaction force as a function of time"
unset key
set xlabel "t"
set ylabel "∝ F_{rad}(t)"
plot f(x)
