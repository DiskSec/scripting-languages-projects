-- TCP SYN Scanner in Lua
local socket = require("socket")

function scan_port(target, port)
    local client = socket.tcp()
    client:settimeout(1)

    local success, err = client:connect(target, port)
    client:close()

    if success then
        print("Port " .. port .. " is open on " .. target)
    end
end

-- Usage function
function usage()
    print("Usage: lua tcp_syn_scanner.lua <target_host> <start_port> <end_port>")
end

-- Check if all arguments are provided
if #arg ~= 3 then
    usage()
else
    local target_host = arg[1]
    local start_port = tonumber(arg[2])
    local end_port = tonumber(arg[3])

    -- Perform TCP SYN scanning
    for port = start_port, end_port do
        scan_port(target_host, port)
    end
end
