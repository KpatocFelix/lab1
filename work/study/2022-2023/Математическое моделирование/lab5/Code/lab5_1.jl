using Plots
using DifferentialEquations

a = 0.38
b = 0.36
c = 0.037
d = 0.035

x0 = 4
y0 = 14



function F(du, u, p, t)
    x, y = u
    du[1] = -a*u[1] + c*u[1]*u[2]
    du[2] = b*u[2] - d*u[1]*u[2]
end
v0 = [x0, y0]
tspan = (0.0, 400.0)

prob = ODEProblem(F,v0,tspan)
sol = solve(prob)
X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
T = [t for t in sol.t]



plt = 
    plot(
        layout=(1,2,3),
        dpi=300,
        legend=false)
    plot!(
        plt[1],
        T,
        X,
        title="решение уравнения",
        color=:red)
    plot!(
        plt[2],
        T,
        Y,
        label="Фразовый портрет",
        color=:blue)
    plot(sol)

savefig("lab5-1.png")