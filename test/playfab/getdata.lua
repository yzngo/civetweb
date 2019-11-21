mg.write("HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n")
mg.write([[<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>ECharts</title>
<!-- including ECharts file -->
<script src="echarts.min.js"></script>
</head>

<body>
<!-- prepare a DOM container with width and height -->
<div id="main" style="width: 600px;height:400px;"></div>
]])


local conninfo = [[
    dbname=date
    user=yang
    password=yang
    connect_timeout=3
          ]];
local conn = pgsql.connectdb(conninfo);

 -- select data
 local res = conn:exec([[
    select date, num
    from date
]])

-- local sAxisNum = #res;

-- for tuple, row in res:tuples() do
-- 	print(row, #tuple, tuple[1], tuple.rolname)
-- end



mg.write([[
<script type="text/javascript">
    // based on prepared DOM, initialize echarts instance
    var myChart = echarts.init(document.getElementById('main'));

    // specify chart configuration item and data
    var option = {
        title: {
            text: 'ECharts entry example'
        },
        tooltip: {},
        legend: {
            data:['Sales']
        },
        xAxis: {
            data: ["shirt","cardign","chiffon shirt","pants","heels","socks"]
        },
        yAxis: {},
        series: [{
            name: 'Sales',
            type: 'bar',
            data: [5, 20, 36, 10, 10, 20]
        }]
    };

    // use configuration item and data specified to show chart
    myChart.setOption(option);
</script>
</body>
</html>
]])

  