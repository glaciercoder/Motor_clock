

# Motor_clock

## Day 1:

看到了链接觉得很好玩，想自己搞一个。

首先考虑到静音的需求，企图使用小步进，配合TMC202x控制芯片来用。

感谢 *小山嘉* 提供步进电机链接，使用拆机小型步进，成本很低。

发现问题在于TMC202x成本过高。

考虑到每个电机只需要两个状态，打算使用双稳态电磁阀 

发现一个Tb的视频：

[Mechnical Design](httNs://www.youtube.com/watch?v=ukRGbEUAVtM&feature=youtu.be)

打算搞这个曲线就可以用最多6个电机完成控制。





## Day 2:

和 *李金时* 一起研究机械结构，发现一些问题

1. 如果将连杆固结在数字轴中心，，数字翻动时会导致连杆的上下运动，所以使用凸轮结构。
2. 发现上述视频里的方形数字有点儿丑，想采用菱形和梯形数字，但是菱形和梯形数字在转动时出现干涉的现象，所以对干涉的问题进行研究。



### 参数初步规定：

连杆内拉3mm从隐藏变为显示，杆直径2mm，凸轮壁厚1mm

<img src="README.assets/Picture1-4605005.png" alt="Picture1" style="zoom:33%;" />

### 凸轮设计：

记为放下状态(不显示)，为拉入状态（显示）

每$36^{\circ}$ 为一个变化时段，如果在该时段与下一时段交界处发生状态转变，则该时段最后$\Delta \theta$与下一时段$\Delta \theta$用于状态转变,对秒，$\Delta \theta = 10^{\circ}$;对分钟和小时,$\Delta \theta = 20^{\circ}$

| 编号/时序 |  1   | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 0    |
| :-------: | :--: | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|     1     |  N   | P    | P    | N    | P    | P    | P    | P    | P    | P    |
|     2     |  P   | P    | P    | P    | N    | N    | P    | P    | P    | P    |
|     3     |  N   | P    | P    | P    | P    | P    | N    | P    | P    | N    |
|     4     |  N   | N    | N    | P    | P    | P    | N    | P    | P    | P    |
|     5     |  P   | N    | P    | P    | P    | P    | P    | P    | P    | P    |
|     6     |  N   | P    | P    | N    | P    | P    | N    | P    | P    | P    |
|     7     |  N   | P    | N    | N    | N    | P    | N    | P    | N    | P    |



利用上述表格进行绘图，思考一番决定使用Matlab多项式拟合极坐标方程，$10^{\circ}$给一个点

发现完全没有必要，直接拿sw做，过渡处使用两段切线弧过渡

在一番苦战之后，终于把凸轮搞定了，下面将基于该尺寸完善连杆机构



## Day 3:

开始着手设计PCB，打算先拿一个板子，把配置都配好，在最终控制板上不再使用引脚配置TMC2208，

### PCB Design

考虑到电机供电问题，考虑使用电池供电

考虑到凸轮转动方向不变，可以将DIR全部共起来，同时考虑到秒针，分针时针凸轮转动频率相同，使用3个PWM引脚就可以























































### 资料整理

[机械结构设计](httNs://www.youtube.com/watch?v=ukRGbEUAVtM&feature=youtu.be)

[TMC2208驱动](https://wiki.fysetc.com)

[Arduino TMC2208 lib](https://www.arduino.cc/reference/en/libraries/tmc2208stepper/)



### 开销

中性笔

买电机驱动模块 6个







