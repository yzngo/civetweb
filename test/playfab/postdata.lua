
if mg.request_info.request_method == "POST" then
  local buf = mg.read();
  local data = json.decode(buf);

  -- connect
  local conninfo = [[
              host=feamberhzdatabase.postgres.database.azure.com
              port=5432
              dbname=postgres
              user=feamberhz@feamberhzdatabase
              password=Feamber_2012
              connect_timeout=20
                    ]];
  local conn = pgsql.connectdb(conninfo);

  -- create table
  -- local res = conn:exec(
  --         [[
  --             create table test 
  --             ( 
  --               event_name text, 
  --               title_id text 
  --             )
  --         ]]
  -- );
  
  -- insert data
  -- local res = conn:execParams([[
  --         insert into test 
  --         (
  --           eventname, 
  --           titleid
  --         ) 
  --         values 
  --         (
  --           $1::text,
  --           $2::text
  --         )
  --         ]], 
  --         data.EventName, 
  --         data.TitleId
  -- );
  
  -- select data
  -- local res = conn:exec([[
  --     select eventname, titleid
  --     from test
  -- ]])
  

    mg.write("HTTP/1.0 201 Created\r\n")
    mg.write("Connection: close\r\n")
    mg.write("Date: " .. os.date("%a, %d %b %Y %H:%M:%S GMT") .. "\r\n")
    mg.write("\r\n")

    -- for tuple, row in res:tuples() do
    --   mg.write( conn:host().."  "..conn:port().."\r\n")
    --   mg.write( #res.." "..tuple.eventname.." "..tuple.titleid.."\r\n")
    -- end
    if conn:status()  == pgsql.CONNECTION_OK then
      mg.write( "connect ok".."\r\n")
    end
    mg.write("\r\n")
    mg.write( buf.."\r\n");
    return
end

