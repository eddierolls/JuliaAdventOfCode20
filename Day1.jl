# Part 1
costs = Int64[];
open("Day1a.in", "r") do f
    for ln in eachline(f)
        x = parse(Int64,ln)
        if in(2020-x,costs)
            println([x,x*(2020-x)])
        end
        append!(costs,x)
    end
end

# Part 2
for i=1:length(costs)-2, j=i+1:length(costs)-1
    x = costs[i]; y = costs[j]
    if in(2020-x-y,costs[j+1:end])
        println([x,y,2020-x-y,x*y*(2020-x-y)])
    end
end