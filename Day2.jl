# Part 1
open("Day2.in", "r") do f
    realPass = 0
    for ln in eachline(f)
        counts,letter,pass = split(ln)
        minC,maxC = map(x-> parse(Int64,x),split(counts,'-'))
        letter = first(letter)
        lCount = count(i->(i==letter), pass)
        if lCount>=minC && lCount<=maxC
            realPass = realPass+1
        end
    end
    println(realPass)
end

# Part 2
open("Day2.in", "r") do f
    realPass = 0
    for ln in eachline(f)
        posn,letter,pass = split(ln)
        pos1,pos2 = map(x-> parse(Int64,x),split(posn,'-'))
        letter = first(letter)
        if ((pass[pos1]==letter) + (pass[pos2]==letter)) ==1
            realPass = realPass+1
        end
    end
    println(realPass)
end