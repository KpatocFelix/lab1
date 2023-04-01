using Plots
using DifferentialEquations

p_cr = 43 
N = 87 
q = 1 
tau1 = 27 
tau2 = 20
p1 = 12 
p2 = 9.7 
M01 = 7.2
M02 = 8.2

a1 = p_cr/(tau1*tau1*p1*p1*N*q)
a2 = p_cr/(tau2*tau2*p2*p2*N*q)
b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q)
c1 = (p_cr-p1)/(tau1*p1)
c2 = (p_cr-p2)/(tau2*p2)

function ode_f(du, u, p, t)
    m1, m2 = u
    du[1] = (c1/c1)*u[1]-(a1/c1)*u[1]*u[1]-(b/c1)*u[1]*u[2]
    du[2] = (c2/c1)*u[2]-(a2/c1)*u[2]*u[2]-(b/c1)*u[1]*u[2]
end

u0 = [M01, M02]
tspan =(0.0, 30.0)
prob1 = ODEProblem(ode_f, u0, tspan)
sol1 = solve(prob1, dtmax=0.1)

M1 = [u[1] for u in sol1.u]
M2 = [u[2] for u in sol1.u]
T = [t for t in sol1.t]

plt = 
    plot(
        layout=(1),
        dpi=300,
        legend=true)
    plot!(
            plt[1],
            T,
            M1,
            title="график M Случай 1",
            label="Company 1",
            color=:black)
    plot!(
            plt[1],
            T,
            M2,
            label="Company 2",
            color=:gray)
        
        savefig("lab8_1.png")