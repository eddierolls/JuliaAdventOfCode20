# Part 1
containedBy = Dict() # Key is a bag colour, value is a list of all bags which can hold the key
open("Day7.in", "r") do f
    for ln in eachline(f)
        outer,inner = split(ln," contain ")
        outer = split(outer," bag")[1]
        inner = split(inner,", ")
        for bag = inner
            bag = split(bag," bag")[1]
            bag = join(split(bag," ")[2:end]," ")
            if bag == "other bags"
                continue
            end
            if !haskey(containedBy,bag)
                containedBy[bag] = String[]
            end
            push!(containedBy[bag],outer)
        end
    end
end


bagsToCheck = String["shiny gold"]
allBags = Set()
while length(bagsToCheck)>0
    nextBag = pop!(bagsToCheck)
    push!(allBags,nextBag)
    if haskey(containedBy,nextBag)
        append!(bagsToCheck,containedBy[nextBag])
    end
end
println(length(allBags)-1)

# Part 2
contains = Dict()
open("Day7.in", "r") do f
    for ln in eachline(f)
        outer,inner = split(ln," contain ")
        outer = split(outer," bag")[1]
        if haskey(contains,outer)
            error()
        end
        contains[outer] = String[]
        inner = split(inner,", ")
        for bag = inner
            bag = split(bag," bag")[1]
            bagName = join(split(bag," ")[2:end]," ")
            if bagName == "other"
                continue
            end
            bagCount = parse(Int64,split(bag," ")[1])
            append!(contains[outer],fill(bagName,bagCount))
        end
    end
end

bagsToCheck = String["shiny gold"]
newBags = -1
while length(bagsToCheck)>0
    nextBag = pop!(bagsToCheck)
    global newBags+=1
    append!(bagsToCheck,contains[nextBag])
end
println(newBags)

