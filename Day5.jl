open("Day5.in", "r") do f
    maxSeat = 0
    allSeats = Set()
    for ln in eachline(f)
        currentRow = 0
        currentCol = 0
        for ii = 1:10
            if ln[ii]=='B'
                currentRow += 2^(7-ii)
            elseif ln[ii]=='R'
                currentCol += 2^(10-ii)
            end
        end
        maxSeat = max(maxSeat,currentRow*8 + currentCol)
        push!(allSeats,currentRow*8 + currentCol)
    end
    println(maxSeat)
    for ii = 1:maxSeat
        if !in(ii,allSeats) && in(ii+1,allSeats) && in(ii-1,allSeats)
            println(ii)
        end
    end
end