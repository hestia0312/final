# FPGA-Dodge 閃避遊戲
作者:107321039 107328015

## Input/Output unit 輸入輸出元件
    1.8x8 LED 矩陣(顯示角色,掉落物,金幣)
    2.七段顯示器(計算金幣數量)
    3.4 Bit Switch(控制角色左右移動)
    4.16 LED (計算倒數秒數)
    
## 基本功能
    1.角色(紅色LED)透過按下按鈕可左右移動
    2.有掉落物(綠色LED)落下
    3.有金幣(藍色LED)會落下
    4.吃到金幣會累計(由七段顯示器顯示)
    5.倒數計時制(由LED顯示)
    6.碰到障礙物時遊戲結束(出現X畫面)
    7.全部閃避出現通關畫面(出現V畫面)
## 程式說明
### output
    output [7:0] R, G, B  -------> 接到 8x8 LED 矩陣
    output reg [15:0] seconed ---> 接到 16 LED 燈
    output reg [3:0] COMM -------> 接到 8x8 LED 矩陣的 S2~S0 和 EN
    output reg [0:7] SevenSeg----> 接到七段顯示器
### input
    input CLK -------------------> FPGA 上 pin 22 為 50MHz 的 CLK 不必接線 
    input left,right ------------> 接到 4 bits Switch
    
### 未來展望
    1.讓掉落物與金幣為隨機出現
    2.讓掉落物與金幣的速度不一致
    3.讓遊戲時間增長
