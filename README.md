# Many

[![Build Status](https://travis-ci.org/closescreen/Many.jl.svg?branch=master)](https://travis-ci.org/closescreen/Many.jl)

[![Coverage Status](https://coveralls.io/repos/closescreen/Many.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/closescreen/Many.jl?branch=master)

[![codecov.io](http://codecov.io/github/closescreen/Many.jl/coverage.svg?branch=master)](http://codecov.io/github/closescreen/Many.jl?branch=master)


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
