

# под вопросом. пока не подключаем

"strftime(\"%F/%H\", now())"
strftime{T<:DateTime}(fmt::AbstractString, t::T) = 
    Libc.strftime(fmt,Dates.datetime2unix(t))

"strftime(\"%F\", Dates.today())"
strftime{T<:Date}(fmt::AbstractString, d::T) = 
    strftime(fmt,DateTime(d))    

"""
[Dates.Date(2016,4,1), Dates.Date(2016,4,2)] |> 
    strftime("../%F/total.gz") |> first
"""
strftime(fmt::AbstractString) = 
    i->imap(t->strftime(fmt, t), i)
