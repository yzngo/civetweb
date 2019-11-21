
if mg.request_info.request_method == "POST" then

  local buf = mg.read();
  local data = json.decode(buf);

  local conn = pgsql.connectdb('')

    mg.write("HTTP/1.0 201 Created\r\n")
    mg.write("Connection: close\r\n")
    mg.write("Date: " .. os.date("%a, %d %b %Y %H:%M:%S GMT") .. "\r\n")
    mg.write("\r\n")

    if pgsql ~= nil then
      -- mg.write( pg.status().."\r\n")
      mg.write( data.DisplayName.."\r\n")
    end
    mg.write("\r\n")
    mg.write( buf.."\r\n");
    return
end

