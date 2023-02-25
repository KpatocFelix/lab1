using Plots
using DifferentialEquations

x0 = 44000
y0 = 33000

a = 0.55
b = 0.8
c = 0.8
h = 0.35

P(t) = sin(t)
Q(t) = cos(2*t)

u0 = [x0; y0]
t=collect(LinRange(0,1,100))
T = (0,1)

function F(du, u, p, t)
du[1] = -a * u[1] - b * u[2] +P(t)+1
du[2] = -c * u[1] - h * u[2] +Q(t)
end

prob = ODEProblem(F, u0, T)
sol = solve(prob, saveat=t)
plot(sol)
savefig("lab3-1.png")