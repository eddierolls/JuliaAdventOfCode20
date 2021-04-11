instructions = []
open("Day8.in", "r") do f
    for ln in eachline(f)
        instr,amt = split(ln)
        push!(instructions,[instr,parse(Int64,amt)])
    end
end

# Part 1
currentLine = 1
accumulator = 0
visitedLines = Set([1])
revisit = false
while !revisit
    instr,amt = instructions[currentLine]
    if instr == "nop"
        global currentLine +=1
    elseif instr == "acc"
        global accumulator += amt
        global currentLine +=1
    elseif instr == "jmp"
        global currentLine = currentLine + amt
    else
        error("Instruction not recognised")
    end
    if in(currentLine,visitedLines)
        global revisit = true
    end
    push!(visitedLines,currentLine)
end
println(accumulator)

# Part 2
for ii = 1:length(instructions)
    theseInstructions = deepcopy(instructions)
    if instructions[ii][1]=="acc"
        continue
    elseif instructions[ii][1]=="nop"
        theseInstructions[ii][1] = "jmp"
    elseif instructions[ii][1]=="jmp"
        theseInstructions[ii][1] = "nop"
    else
        error("Invalid instruction type")
    end
    global currentLine = 1
    global accumulator = 0
    global visitedLines = Set([1])
    global revisit = false
    while !revisit && currentLine<=length(theseInstructions)
        instr,amt = theseInstructions[currentLine]
        if instr == "nop"
            global currentLine +=1
        elseif instr == "acc"
            global accumulator += amt
            global currentLine +=1
        elseif instr == "jmp"
            global currentLine = currentLine + amt
        else
            error("Instruction not recognised")
        end
        if in(currentLine,visitedLines)
            global revisit = true
        end
        push!(visitedLines,currentLine)
    end
    if currentLine==length(theseInstructions)+1
        print(accumulator)
    end
end