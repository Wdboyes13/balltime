import matplotlib.pyplot as plt

h = 10.0
v = 0.0
t = 0.0
dt = 0.001
heights = []
times = []

while h > 0:
    times.append(t)
    heights.append(h)

    a = 9.8 - 0.00175 * v**2
    v += a * dt
    h -= v * dt
    t += dt

plt.plot(times, heights)
plt.xlabel('Time (s)')
plt.ylabel('Height (m)')
plt.title('Ball Drop with Air Resistance')
plt.grid(True)

plt.savefig('results.png')
