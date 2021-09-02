1. Retrieve the weather Info:

http://m.weather.com.cn/data/101010100.html

"101010100" is the city code. The data is returned in JSON format.

{"weatherinfo":
    {"city":"北京",
     "city_en":"beijing",
     "date_y":"2013年11月25日", //today's date
     "date":"",
     "week":"星期一", //today's day
     "fchh":"08",
     "cityid":"101010100",
     
     //---------------------------
     //  6 days's temperatures
     //---------------------------
     "temp1":"7℃~-4℃", //today's
     "temp2":"7℃~-5℃",
     "temp3":"0℃~-6℃",
     "temp4":"4℃~-4℃",
     "temp5":"9℃~-3℃",
     "temp6":"9℃~-3℃",
     "tempF1":"44.6℉~24.8℉",
     "tempF2":"44.6℉~23℉",
     "tempF3":"32℉~21.2℉",
     "tempF4":"39.2℉~24.8℉",
     "tempF5":"48.2℉~26.6℉",
     "tempF6":"48.2℉~26.6℉",
     
     //---------------------------
     //  6 days's weather descriptions
     //---------------------------
     "weather1":"晴转多云", //today's
     "weather2":"多云",
     "weather3":"晴",
     "weather4":"晴",
     "weather5":"晴",
     "weather6":"晴",
     
     //--------------------------
     // 6 days' weather picture indexes
     // each day has two pictures, index=99: use the same weather picture
     // 
     // pictures address (0 is the picture index)
     // 20*20: http://m.weather.com.cn/img/c0.gif
     // 50*46: http://m.weather.com.cn/img/b0.gif
     // 29*20,highlited:http://www.weather.com.cn/m/i/weatherpic/29x20/d0.gif
     // 29*20, highlited, night: http://www.weather.com.cn/m2/i/icon_weather/29x20/n00.gif
     //--------------------------
     "img1":"0",
     "img2":"1",
     "img3":"1",
     "img4":"99",
     "img5":"0",
     "img6":"99",
     "img7":"0",
     "img8":"99",
     "img9":"0",
     "img10":"99",
     "img11":"0",
     "img12":"99",
     
     //--------------------------
     // current weather image index
     //--------------------------
     "img_single":"0",
     
     //--------------------------
     // 6 days' weather picture titles
     //--------------------------
     "img_title1":"晴",
     "img_title2":"多云",
     "img_title3":"多云",
     "img_title4":"多云",
     "img_title5":"晴",
     "img_title6":"晴",
     "img_title7":"晴",
     "img_title8":"晴",
     "img_title9":"晴",
     "img_title10":"晴",
     "img_title11":"晴",
     "img_title12":"晴",
     
     //--------------------------
     // current weather image title
     //--------------------------
     "img_title_single":"晴",
     
     //--------------------------
     // 6 days' wind speed
     //--------------------------
     "wind1":"微风",
     "wind2":"北风4-5级",
     "wind3":"北风5-6级转4-5级",
     "wind4":"北风3-4级转微风",
     "wind5":"微风",
     "wind6":"微风",
     
     //--------------------------
     // today's wind speed
     //--------------------------
     "fx1":"微风",
     "fx2":"微风",
     
     //--------------------------
     // 6 days' wind speed level
     //--------------------------
     "fl1":"小于3级",
     "fl2":"4-5级",
     "fl3":"5-6级转4-5级",
     "fl4":"3-4级转小于3级",
     "fl5":"小于3级",
     "fl6":"小于3级",
     
     //--------------------------
     // weather index and clothing suggestions
     //--------------------------
     "index":"冷",
     "index_d":"天气冷，建议着棉服、羽绒服、皮夹克加羊毛衫等冬季服装。年老体弱者宜着厚棉衣、冬大衣或厚羽绒服。",
     "index48":"寒冷", //in 48 hours
     "index48_d":"天气寒冷，建议着厚羽绒服、毛皮大衣加厚毛衣等隆冬服装。年老体弱者尤其要注意保暖防冻。",

     "index_uv":"弱",
     "index48_uv":"最弱",
     
     "index_xc":"较适宜",
     "index_tr":"适宜",
     "index_co":"较舒适",
     "st1":"5",
     "st2":"-5",
     "st3":"7",
     "st4":"-7",
     "st5":"-2",
     "st6":"-6",
     "index_cl":"适宜",
     "index_ls":"基本适宜",
     "index_ag":"极不易发"}}
     
2. Longitude and Latitude Queries
http://jingwei.supfree.net

