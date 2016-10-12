#!/usr/bin/env julia

immutable ManyTimesIter
 from::Union{Date,DateTime}
 n::Int
 next::Function
 forward::Bool
 step::Dates.Period
end

Base.start(t::ManyTimesIter) = (t.n, t.from) # state=(remaind,current)
Base.done(t::ManyTimesIter,state) = state[1] == 0
Base.next(t::ManyTimesIter, state) = begin
    nexthour = t.next(state[2])
    (nexthour, (state[1]-1,nexthour))
end 
Base.eltype(::Type{ManyTimesIter}) = Union{Date,DateTime} #!
Base.length(t::ManyTimesIter) = t.n;


backset() = Set([:b, :back, :backward])
fwdset() = Set([:f, :fwd, :forward])
isforward(direction) = in(direction, fwdset()) ? true  :
             in(direction, backset())? false :
             throw(ArgumentError("bad argument direction=$direction"))







