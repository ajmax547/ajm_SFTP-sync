local PASSWORD = "SUPER_TAJNE_HESLO_123"

SetHttpHandler(function(req, res)
    if req.path == '/execute' and req.method == 'POST' then
        req.setDataHandler(function(body)
            local data = json.decode(body)
            
            if data and data.password == PASSWORD then
                if data.command then
                    -- Barevný výpis do konzole (žlutá barva pro nadpis, zelená pro samotný příkaz)
                    print("^3[VSCode Sync] ^2" .. data.command .. "^0")
                    
                    ExecuteCommand(data.command)
                    res.writeHead(200, {["Content-Type"] = "application/json"})
                    res.send(json.encode({status = "ok", message = "Prikaz '" .. data.command .. "' byl spusten na serveru."}))
                else
                    res.writeHead(400, {["Content-Type"] = "application/json"})
                    res.send(json.encode({status = "error", message = "Chybi prikaz (command)"}))
                end
            else
                res.writeHead(401, {["Content-Type"] = "application/json"})
                res.send(json.encode({status = "error", message = "Spatne heslo (zkontrolujte HTTP Helper password)"}))
            end
        end)
    else
        res.writeHead(404, {["Content-Type"] = "text/plain"})
        res.send("Not Found")
    end
end)