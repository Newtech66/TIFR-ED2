import numpy as np
import matplotlib.pyplot as plt

h=6.62607015e-34
k=1.380649e-23

def f(nu, T):
    a = h * nu / (k * T)
    return np.exp(-a) * (0.6 * a ** 2 + 2.2 * a + 2.2)

nus = np.logspace(-5,20,1000)
plt.plot(nus,f(nus, 300),label=r'$T=300$ K')
plt.plot(nus,f(nus, 1e6),label=r'$T=10^6$ K')
plt.semilogx()
plt.grid()
plt.legend()
plt.title('Emitted power density per unit frequency')
plt.xlabel(r'$\nu$ (Hz)')
plt.ylabel(r'$\propto \frac{dW}{d\nu dV dt}$')
plt.savefig('figs/p6.png', bbox_inches='tight')
plt.show()