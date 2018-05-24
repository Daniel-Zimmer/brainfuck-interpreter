local code = ""
local t = {0,0,0,0,0,0,0,0,0,0,0}
local tpos = 1
local loopTemp = {0,0,0,0,0,0,0,0,0,0,0}
local loopTempPos = {0,0,0,0,0,0,0,0,0,0,0}
local loopDepth = 0
local stepDisplaySize = 6
local stepDisplay = false
local i = 1

function fileload(filename)
  local file = io.open(filename)
  local str = ""
  for line in file:lines() do
    str = str .. line
  end
  file:close()
  return str
end

io.write("Nome do arquivo: ")
local filename = io.read() .. ".txt"

code = fileload(filename)

while (i <= #code) do
    if  string.sub(code,i,i) == "+" then
      t[tpos] = t[tpos] + 1
    elseif string.sub(code,i,i) == "-" and t[tpos] > 0 then
      t[tpos] = t[tpos] - 1
    elseif string.sub(code,i,i) == ">" then
      tpos = tpos + 1
    elseif string.sub(code,i,i) == "<" and tpos > 0 then
      tpos = tpos - 1
    elseif string.sub(code,i,i) == "." then
      io.write("\nInput: ")
      t[tpos] = tonumber(io.read())
    elseif string.sub(code,i,i) == "," then
      io.write("\nOutput: ")
      io.write(t[tpos] .. "\n")
    elseif string.sub(code,i,i) == "[" then
      loopDepth = loopDepth + 1
      loopTemp[loopDepth] = tpos
      loopTempPos[loopDepth] = i
    elseif string.sub(code,i,i) == "]" and t[loopTemp[loopDepth]] ~= 0 then
      i = loopTempPos[loopDepth]
    elseif string.sub(code,i,i) == "]" and t[loopTemp[loopDepth]] == 0 then
      loopDepth = loopDepth - 1
    end
    
    if stepDisplay then
      io.write("\n"..i.." "..loopDepth.."\n--------------------------------\n")
      for j = 1, stepDisplaySize do
        if j == tpos then
          io.write("| ! ")
        else
          io.write("| "..j.." ")
        end
      end
      io.write("\n--------------------------------\n")
      for j = 1, stepDisplaySize do
        io.write("| "..t[j].." ")
      end
      io.write("\n--------------------------------\n")
    
    end
    
    i = i+1
end

io.write("\n")
