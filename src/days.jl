export days

#backset() = Set([:b, :back, :backward])
#fwdset() = Set([:f, :fwd, :forward])
#isforward(direction) = in(direction, fwdset()) ? true  :
#             in(direction, backset())? false :
#             throw(ArgumentError("bad argument direction=$direction"))

"""
using MT: days

days( Date(2016,04,04), 3) |> first # 2016-04-04

days( Date(2016,04,04), 3, direction=:b) |> first # 2016-04-06

days( Date(2016,04,04), 3, shift=1) |> first # 2016-04-05

days( Date(2016,04,04), 3, shift=-1) |> first # 2016-04-03

Keyword argument \"direction\" in days() and Hours() may be one of:

    :f, :fwd, :forward

    :b, :back, :backward
    
    f.e.: 

    days( Date(2016,04,04), 3, direction=:b) |> first # 2016-04-06

"""
function days{T<:Date}(d::T, n::Int; direction::Symbol=:forward, shift::Int=0)
 forward = isforward(direction)
 nextfun = forward ? d->d+Dates.Day(1) : d->d-Dates.Day(1) 
 jumpstart = n>0 && forward ? d-Dates.Day(1-shift) :
             n>0 && !forward ? d+Dates.Day(n+shift) :
             n<=0 && forward ? d+Dates.Day(n-1+shift) :
             d+Dates.Day(shift) # <-- n<=0 && !forward
 ManyTimesIter(jumpstart, abs(n), nextfun, forward, Dates.Day(1))
end

"days( Date(2016,04,04), Dates.Day(3)) |> first # 2016-04-04"
days{T<:Date}(d::T, nd::Base.Dates.Day; direction::Symbol=:forward, shift::Int=0) = 
    days(d, nd.value, direction=direction, shift=shift)

"""
days( DateTime(2016,04,04), 3) |> first # 2016-04-04

days( DateTime(2016,04,04,6,5,4), 3) |> first # 2016-04-04
"""
days{T<:DateTime}(t::T, n::Int; direction::Symbol=:forward, shift::Int=0) = 
    days(Date(t), n, direction=direction, shift=shift)

"days( DateTime(2016,04,04), Dates.Day(3)) |> first # 2016-04-04"
days{T<:DateTime}(t::T, nd::Base.Dates.Day; direction::Symbol=:forward, shift::Int=0) = 
    days(Date(t), nd.value, direction=direction, shift=shift)


"""
days(Date(2016,04,04), Date(2016,04,06)) |> first # 2016-04-04

days(Date(2016,04,04), Date(2016,04,06), shift=1) |> first # 2016-04-05

days(Date(2016,04,06), Date(2016,04,04)) |> first # 2016-04-05

days(Date(2016,04,06), Date(2016,04,04), shift=1) |> first # 2016-04-06
"""
function days{T<:Date}(d1::T, d2::T; shift::Int=0)
 if d2 > d1
    dstart = d1 
    direction = :forward
 else
    dstart = d2
    direction = :backward
 end
 n = abs( Int( Dates.Day( d2 - d1 )))
 days(dstart, n, direction=direction, shift=shift)
end

"days(Date(2016,04,04), DateTime(2016,04,06,12,20,0)) |> first # 2016-04-04"
days{ T1<:Date, T2<:DateTime }(d1::T1, t2::T2; shift::Int=0) = 
    days(d1, Date(t2), shift=shift)

"days(DateTime(2016,04,04,12,30,0), Date(2016,04,06)) |> first # 2016-04-04"
days{ T1<:DateTime, T2<:Date }(t1::T1, d2::T2; shift::Int=0) = 
    days(Date(t1), d2, shift=shift)

"""
days(DateTime(2016,04,04,12,30,0), DateTime(2016,04,06,12,20,0)) |> 
    first # 2016-04-04
"""
days{ T1<:DateTime, T2<:DateTime }(t1::T1, t2::T2; shift::Int=0) = 
    days(Date(t1), Date(t2), shift=shift)



"""
Days from tuples:

days((2016,08,15),3)

days((2016,08,15),(2016-08-17))
"""
days(d1::Tuple{Int64,Int64,Int64}, d2::Tuple{Int64,Int64,Int64}, args...) =
 days(Date(d1...), Date(d2...), args...)

days(d1::Tuple{Int64,Int64,Int64}, args...) =
 days(Date(d1...), args...)
 



