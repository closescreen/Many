# Many

[![Build Status](https://travis-ci.org/closescreen/Many.jl.svg?branch=master)](https://travis-ci.org/closescreen/Many.jl)

[![Coverage Status](https://coveralls.io/repos/closescreen/Many.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/closescreen/Many.jl?branch=master)

[![codecov.io](http://codecov.io/github/closescreen/Many.jl/coverage.svg?branch=master)](http://codecov.io/github/closescreen/Many.jl?branch=master)

```

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
    
    
days( Date(2016,04,04), Dates.Day(3)) |> first # 2016-04-04
days( DateTime(2016,04,04), 3) |> first # 2016-04-04
days( DateTime(2016,04,04,6,5,4), 3) |> first # 2016-04-04
days( DateTime(2016,04,04), Dates.Day(3)) |> first # 2016-04-04
days(Date(2016,04,04), Date(2016,04,06)) |> first # 2016-04-04
days(Date(2016,04,04), Date(2016,04,06), shift=1) |> first # 2016-04-05
days(Date(2016,04,06), Date(2016,04,04)) |> first # 2016-04-05
days(Date(2016,04,06), Date(2016,04,04), shift=1) |> first # 2016-04-06
days(Date(2016,04,04), DateTime(2016,04,06,12,20,0)) |> first # 2016-04-04
days(DateTime(2016,04,04,12,30,0), Date(2016,04,06)) |> first # 2016-04-04
days(DateTime(2016,04,04,12,30,0), DateTime(2016,04,06,12,20,0)) |> 
    first # 2016-04-04

```

Days from tuples:

```
days((2016,08,15),3)
days((2016,08,15),(2016-08-17))


```
Creating hours like days(). Except using DateTime(), not Date()
for representing a each hour in parameters.
```
Many.hours(DateTime(2016,08,15,06),3)
```
From tuples:
```
hours((2016,08,15,06),3)
hours((2016,08,15,06),(2016,08,15,10))
```
