using Many
using Base.Test

@test collect( Many.hours(DateTime(2016,04,04,15), 3)) |> length == 3
@test collect( Many.hours(DateTime(2016,04,04,15), Dates.Hour(3))) |> length == 3
@test first( collect( Many.hours(DateTime(2016,04,04,15), Dates.Hour(3))) ) == DateTime(2016,4,4,15)
@test last( collect(Many.hours(DateTime(2016,04,04,15), Dates.Day(1))))==DateTime(2016,4,5,14)
@test last(collect(Many.hours(Date(2016,04,04), Dates.Day(1)))) == DateTime(2016,4,4,23)
