# Part 1
course = []
global lineLength
open("Day3.in", "r") do f
    treeCount = 0
    firstPass = true
    currentIndex = 0
    for ln in eachline(f)
        append!(course,[ln])
        global lineLength = length(ln)
        if firstPass
            firstPass = false
            currentIndex = 4
            continue
        end
        treeCount = treeCount + (ln[currentIndex]=='#')
        currentIndex = mod(currentIndex + 3 - 1,lineLength) + 1
    end
    println(treeCount)
end

# Part 2
passRules = [[1,1] [3,1] [5,1] [7,1] [1,2]]
treeCounts = zeros(Int64,5)
for ii = 1:5
    rightMoves = passRules[1,ii]
    skipLines = passRules[2,ii]==2
    firstPass = true
    lineSkip = false
    currentIndex = 0
    for ln in course
        if firstPass
            firstPass = false
            lineSkip = skipLines
            currentIndex = 1 + rightMoves
            continue
        end
        if lineSkip
            lineSkip = false
            continue
        end
        treeCounts[ii] = treeCounts[ii] + (ln[currentIndex]=='#')
        currentIndex = mod(currentIndex + rightMoves - 1,lineLength) + 1
        lineSkip = skipLines
    end
end
println(treeCounts)
println(prod(treeCounts))