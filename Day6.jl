open("Day6.in", "r") do f
    totalGroups = 0
    totalIntersect = 0
    currentSet = Set()
    fullSet = Set(collect('a':'z'))
    for ln in eachline(f)
        if ln==""
            totalGroups+=length(currentSet)
            totalIntersect+=length(fullSet)
            currentSet = Set()
            fullSet = Set(collect('a':'z'))
        else
            union!(currentSet,Set(ln))
            intersect!(fullSet,Set(ln))
        end
    end
    println(totalGroups+length(currentSet))
    println(totalIntersect+length(fullSet))
end