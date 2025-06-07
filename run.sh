#!/bin/bash

pip3 install -r requirements.txt

python3 helper/download_cars_csv.py

# python3 -m bokeh serve .

# 获取本机IP地址
MY_IP=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2 | head -n 1)
echo "您的本地IP地址是: $MY_IP"
echo "其他设备可以通过访问 http://$MY_IP:5006 来连接GT7仪表盘"

# 启动服务并监听所有网络接口
python3 -m bokeh serve . --allow-websocket-origin="$MY_IP:5006" --address=0.0.0.0
