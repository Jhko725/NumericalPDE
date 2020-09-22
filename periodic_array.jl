using LinearAlgebra
using Plots
using BenchmarkTools

struct Periodic1DGrid{T<:Number} <: AbstractVector{T}
    parent::AbstractVector{T}
end

Base.size(A::Periodic1DGrid) = size(A.parent)
Base.getindex(A::Periodic1DGrid, i::Int) = getindex(A.parent, (i-1)%length(A)+1)
Base.setindex!(A::Periodic1DGrid, v, i::Int) = setindex!(A.parent, v, (i-1)%length(A)+1)
Base.zero(A::Periodic1DGrid) = Periodic1DGrid(zero(A.parent))