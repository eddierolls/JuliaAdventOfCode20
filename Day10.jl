nums = Int64[0]
open("Day10.in", "r") do f
    for ln in eachline(f)
        push!(nums,parse(Int64,ln))
    end
end
sort!(nums)
push!(nums,nums[end]+3)

# Part 1
diffs = map(ii -> nums[ii]-nums[ii-1],2:length(nums))
jumpCount = map(ii->count(x->x==ii,diffs),[1,3])
println(jumpCount[1]*jumpCount[2])

# Part 2
pathCount = Dict()
pathCount[0] = 1
for ii = nums[2:end]
    newPaths = 0
    for jj = 1:3
        if haskey(pathCount,ii-jj)
            newPaths+=pathCount[ii-jj]
        end
    end
    pathCount[ii] = newPaths
end
println(pathCount[maximum(keys(pathCount))])