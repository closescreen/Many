export hours

function hours{T<:DateTime}(t::T, n::Int; direction::Symbol=:forward, shift::Int=0)
 forward = isforward(direction)
 nextfun = forward ? t->t+Dates.Hour(1) : t->t-Dates.Hour(1) 
 jumpstart = n>0 && forward ? t-Dates.Hour(1-shift) :
             n>0 && !forward ? t+Dates.Hour(n+shift) :
             n<=0 && forward ? t+Dates.Hour(n-1+shift) :
             t+Dates.Hour(shift) # <-- n<=0 && !forward
 ManyTimesIter(jumpstart, abs(n), nextfun, forward, Dates.Hour(1))
end

hours{T<:DateTime}(t::T, nd::Base.Dates.Day; direction::Symbol=:forward, shift::Int=0) = 
    hours(t, nd.value*24, direction=direction)

hours{T<:DateTime}(t::T, nd::Base.Dates.Hour; direction::Symbol=:forward, shift::Int=0) = 
    hours(t, nd.value, direction=direction)

hours{T<:Date}(d::T, n::Int; direction::Symbol=:forward, shift::Int=0) = 
    hours(DateTime(d), n, direction=direction)

hours{T<:Date}(d::T, nd::Base.Dates.Day; direction::Symbol=:forward, shift::Int=0) = 
    hours(DateTime(d), nd.value*24, direction=direction)

hours{T<:Date}(d::T, nd::Base.Dates.Hour; direction::Symbol=:forward, shift::Int=0) = 
    hours(DateTime(d), nd.value, direction=direction)


function hours{T<:DateTime}(t1::T, t2::T; shift::Int=0)
 if t2 > t1
    tstart = t1 
    direction = :forward
 else
    tstart = t2
    direction = :backward
 end
 n = abs( Int( Dates.Hour( t2 - t1 )))
 hours(tstart, n, direction=direction, shift=shift)
end

hours{ T1<:DateTime, T2<:Date }(t1::T1, d2::T2; shift::Int=0) = 
    hours(t1, DateTime(d2), shift=shift)

hours{ T1<:Date, T2<:DateTime }(d1::T1, t2::T2; shift::Int=0) = 
    hours(DateTime(d1), t2, shift=shift)

hours{ T1<:Date, T2<:Date }(d1::T1, d2::T2; shift::Int=0) = 
    hours(DateTime(d1), DateTime(d2), shift=shift)


"""
Creating hours like days(). Except using DateTime(), not Date()
for representing a each hour in parameters.

Many.hours(DateTime(2016,08,15,06),3)

From tuples:

hours((2016,08,15,06),3)

hours((2016,08,15,06),(2016,08,15,10))

"""
hours(h1::Tuple, args...) = 
 hours(DateTime(h1...), args...)
 
hours(h1::Tuple, h2::Tuple, args...) = 
 hours(DateTime(h1...), DateTime(h2...), args...)
 
