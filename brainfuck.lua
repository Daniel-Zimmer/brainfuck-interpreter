local code = ""
local filename = "code.txt"
local t = {0,0,0,0,0,0,0,0,0,0,0}
local tpos = 1

function fileload(filename)
  local file = io.open(filename)
  local str = ""
  for line in file:lines() do
    str = str .. line
  end
  file:close()
  return str
end


code = fileload(filename)

for i = 1, #code, 1 do
    if  string.sub(code,i,i) == "+" then
      t[tpos] = t[tpos] + 1
    elseif string.sub(code,i,i) == "-" and t[tpos] > 0 then
      t[tpos] = t[tpos] - 1
    elseif string.sub(code,i,i) == ">" then
      tpos = tpos + 1
    elseif string.sub(code,i,i) == "<" and tpos > 0 then
      tpos = tpos - 1
    elseif string.sub(code,i,i) == "." then
      t[tpos] = tonumber(io.read())
    elseif string.sub(code,i,i) == "," then
      io.write(t[tpos] .. "\n")
    end
end

io.write("\n")
