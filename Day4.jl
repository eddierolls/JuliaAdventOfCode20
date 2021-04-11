function validate(k,v) #key,value
    global valid
    try
        if k=="byr"
            valid = length(v)==4 && parse(Int64,(v))>=1920 && parse(Int64,(v))<=2002
        elseif k=="iyr"
            valid = length(v)==4 && parse(Int64,(v))>=2010 && parse(Int64,(v))<=2020
        elseif k=="eyr"
            valid = length(v)==4 && parse(Int64,(v))>=2020 && parse(Int64,(v))<=2030
        elseif k=="hgt" && v[end-1:end]=="cm" 
            valid = length(v)==5 && parse(Int64,v[1:3])<=193 && parse(Int64,v[1:3]) >=150
        elseif k=="hgt" && v[end-1:end]=="in" 
            valid = length(v)==4 && parse(Int64,v[1:2])<=76 && parse(Int64,v[1:2]) >= 59
        elseif k=="hcl"
            valid = length(v)==7 && v[1]=='#' && all(occursin.(split(v[2:end],""),"0123456789abcdef"))
        elseif k=="ecl"
            valid = in(v,["amb","blu","brn","gry","grn","hzl","oth"])
        elseif k=="pid"
            valid = length(v)==9 && isa(parse(Int64,v),Int64)
        else
            valid = false
        end
    catch ArgumentError
        valid = false
    end
    return valid
end

allFields = ["byr","iyr","eyr","hgt","hcl","ecl","pid"];
global fieldsDict = Dict()
map((i,j) -> fieldsDict[i]=j,allFields,fill(false,7))
open("Day4.in", "r") do f
    totalValid = 0
    currentStatus = copy(fieldsDict)
    for ln in eachline(f)
        if strip(ln) == ""
            currentStatus = copy(fieldsDict)
        else
            flds = split(ln)
            for fld = flds
                a,b = split(fld,':')
                if a in keys(currentStatus)
                    currentStatus[a]=currentStatus[a] || validate(a,b)
                end
            end
            println(count(values(currentStatus)),values(currentStatus))
            if all(values(currentStatus))
                totalValid+=1
                currentStatus = copy(fieldsDict)
            end
        end
    end
    println(totalValid)
end