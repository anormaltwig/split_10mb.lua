local path = arg[1]

local file = assert(io.open(path, "rb"))

local part = 0
while true do
	local data = file:read(10000000)
	if not data then break end

	local save_path = tostring(part) .. path
	assert(not io.open(save_path, "r"), string.format("'%s' already exists!", save_path))

	local save_file = assert(io.open(save_path, "w+"))
	save_file:write(data)
	save_file:close()

	part = part + 1
end

file:close()

