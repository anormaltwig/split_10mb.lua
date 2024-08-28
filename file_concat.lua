assert(#arg >= 2, "Not enough args. ex: file_concat.lua output.txt input1.txt input2.txt")

local out_path = arg[1]

assert(not io.open(out_path, "r"), "Output file already exists.")

local buf = {}
for i = 2, #arg do
	local path = arg[i]

	local file = assert(io.open(path, "rb"))
	table.insert(buf, file:read("*a"))
end

local out_file = assert(io.open(out_path, "w+"))
out_file:write(table.concat(buf, ""))
out_file:close()

