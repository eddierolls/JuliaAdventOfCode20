nums = Int64[]
open("Day9.in", "r") do f
    for ln in eachline(f)
        push!(nums,parse(Int64,ln))
    end
end

# Part 1
for ii = 26:length(nums)
    possibleNums = nums[ii-25:ii-1]
    found = false
    for jj = 1:length(possibleNums)-1
        if in(nums[ii]-possibleNums[jj],possibleNums[jj+1:end])
            found = true
            continue
        end
    end
    if !found
        println(nums[ii])
        global failInd = ii
        break
    end
end

# Part 2
for jj = 1:failInd-1
    for kk = jj+1:failInd
        if sum(nums[jj:kk])==nums[failInd]
            println(minimum(nums[jj:kk])+maximum(nums[jj:kk]))
            break
        elseif sum(nums[jj:kk])>nums[failInd]
            break
        end
    end
end