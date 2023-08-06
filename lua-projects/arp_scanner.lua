-- ARP Scanner in Lua
local socket = require("socket")
local ip = require("ip")

function arp_scan(network)
    local base_ip = ip.toip(network)
    for i=1, 254 do
        local target_ip = ip.fromip(base_ip + i)
        local success, _ = os.execute("ping -c 1 -w 1 " .. target_ip)
        if success then
            print("Host " .. target_ip .. " is active.")
        end
    end
end

-- Usage function
function usage()
    print("Usage: lua arp_scanner.lua <network>")
end

-- Check if network argument is provided
if #arg ~= 1 then
    usage()
else
    local network = arg[1]
    arp_scan(network)
end
