using LinearAlgebra
using Plots
using BenchmarkTools
using Traceur

function make_1Dgrid(start_::Float64, end_::Float64, n_grids::Int)
    x = collect(LinRange(start_, end_, n_grids))::Vector{Float64}
    u = zero(x)::Vector{Float64}

    return x, u
end

function initialize_grid!(x::Vector{Float64}, u::Vector{Float64}, f0::Function)
    return u .+= f0.(x)
end

square(x::Float64)::Float64 = -0.5<=x<=0.5 ? 1.0 : 0.0

x, u = make_1Dgrid(-1.0, 1.0, 50)
initialize_grid!(x, u, square)

function update!(u⁰::Vector{Float64}, u¹::Vector{Float64}, a::Float64, cfl::Float64)
    k = a*cfl
    u¹[1] = u⁰[1]-k*(u⁰[1]-u⁰[end])
    for i in 2:length(u⁰)
        u¹[i] = u⁰[i]-k*(u⁰[i]-u⁰[i-1])
    end
    u⁰::Vector{Float64}, u¹::Vector{Float64} = u¹, u⁰
    return u⁰, u¹
end

function simulate!(u⁰::Vector{Float64}, N::Int64)
    u_temp = zero(u⁰)
    for i in 1:N
        update!(u⁰, u_temp, 1.0, 0.5)
    end
end

simulate!(u, 10)
pyplot()
plot(x, u, marker = :., color = :black)

