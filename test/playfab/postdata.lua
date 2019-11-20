
if mg.request_info.request_method == "POST" then
  local f = io.open( "a.txt", "w" );
  if (not f ) then
    mg.write("HTTP/1.0 500 Internal Server Error\r\n")
		mg.write("Connection: close\r\n")
		mg.write("Date: " .. os.date("%a, %d %b %Y %H:%M:%S GMT") .. "\r\n")
		mg.write("\r\n")
		return
  end
  local buf = mg.read();
  local data = json.decode(buf);

   -- json.decode(buf);
  -- repeat

  --   -- print( data );
  --   if (buf) then
  --     f:write(buf)
  --   end
  -- until (not buf);
  -- f:close()


    mg.write("HTTP/1.0 201 Created\r\n")
    mg.write("Connection: close\r\n")
    mg.write("Date: " .. os.date("%a, %d %b %Y %H:%M:%S GMT") .. "\r\n")
    mg.write("\r\n")

    if json ~= nil then
      mg.write( data.Timestamp.."\r\n")
    end
    mg.write( buf.."\r\n");
    return
end

