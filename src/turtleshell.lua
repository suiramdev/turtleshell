-- Configuration part for turtleshell
local WS_URL = "ws://localhost:8080/ws"

-- Do not touch below this line unless you know what you are doing
os.loadAPI("json")
local ws, err = http.websocket(WS_URL)
if ws then
    while true do
        local msg = ws.receive()
        local obj = json.decode(msg)
        local func = loadstring(obj["fun"])
        func()
    end
end