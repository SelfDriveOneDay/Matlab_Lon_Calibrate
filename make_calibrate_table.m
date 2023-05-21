clear
close all
clc

%% load all data
namelist = dir('D:\MyCasimSimulation\Long Calibrate\*.mat');
len = length(namelist);
for i = 1:len
    file_name{i}=namelist(i).name;
    load(file_name{i});
end

%% 油门标定表
clo_len = length(Vel_0_Throttle_10.Data);
throttle_data = zeros(clo_len, 10);
for c = 1:10
    throttle_data(:, c) = c * 10 * ones(clo_len, 1);
end
Vx_throttle = [Vel_0_Throttle_10.Data(:, 1), Vel_0_Throttle_20.Data(:, 1),...
               Vel_0_Throttle_30.Data(:, 1), Vel_0_Throttle_40.Data(:, 1),...
               Vel_0_Throttle_50.Data(:, 1), Vel_0_Throttle_60.Data(:, 1),...
               Vel_0_Throttle_70.Data(:, 1), Vel_0_Throttle_80.Data(:, 1),...
               Vel_0_Throttle_90.Data(:, 1), Vel_0_Throttle_100.Data(:, 1)];
Ax_throttle = [Vel_0_Throttle_10.Data(:, 2), Vel_0_Throttle_20.Data(:, 2),...
               Vel_0_Throttle_30.Data(:, 2), Vel_0_Throttle_40.Data(:, 2),...
               Vel_0_Throttle_50.Data(:, 2), Vel_0_Throttle_60.Data(:, 2),...
               Vel_0_Throttle_70.Data(:, 2), Vel_0_Throttle_80.Data(:, 2),...
               Vel_0_Throttle_90.Data(:, 2), Vel_0_Throttle_100.Data(:, 2)];
Vx_thr = Vx_throttle(:);
Ax_thr = Ax_throttle(:);
Throttle = throttle_data(:);
F1 = scatteredInterpolant(Vx_thr, Ax_thr, Throttle); 

% 油门标定表
% 设定速度、加速度区间
Vx_scope1 = 0:4:120;       
Ax_scope1 = 0.1:0.2:4.5;      
% 制作油门标定表：由实车测试的数据进行插值得到新的表
throttle_table = zeros(length(Vx_scope1), length(Ax_scope1));
% 填写油门标定表, 通过当前的车速和加速度确定要给多大的油门开度
for i = 1:length(Vx_scope1)
    for j = 1:length(Ax_scope1)
        throttle_table(i, j) = F1(Vx_scope1(i), Ax_scope1(j));
    end
end
% 绘制油门标定的曲面图
[X1, Y1] = meshgrid(Vx_scope1, Ax_scope1);
Z1 = F1(X1, Y1);
for i = 1:length(Z1(:, 1))
    for j = 1:length(Z1(1, :))
        if Z1(i, j) > 100
            Z1(i, j) = 100;
        end
    end
end
figure;
surf(Y1, X1, Z1)


%% 刹车标定表
Vx_Brake = [Vel_30_Brake_10.Data(:, 1); Vel_40_Brake_20.Data(:, 1);...
            Vel_50_Brake_30.Data(:, 1); Vel_60_Brake_40.Data(:, 1);...
            Vel_70_Brake_50.Data(:, 1); Vel_80_Brake_60.Data(:, 1);...
            Vel_90_Brake_70.Data(:, 1); Vel_100_Brake_80.Data(:, 1);...
            Vel_110_Brake_90.Data(:, 1); Vel_120_Brake_100.Data(:, 1)];
Ax_Brake = [Vel_30_Brake_10.Data(:, 2); Vel_40_Brake_20.Data(:, 2);...
            Vel_50_Brake_30.Data(:, 2); Vel_60_Brake_40.Data(:, 2);...
            Vel_70_Brake_50.Data(:, 2); Vel_80_Brake_60.Data(:, 2);...
            Vel_90_Brake_70.Data(:, 2); Vel_100_Brake_80.Data(:, 2);...
            Vel_110_Brake_90.Data(:, 2); Vel_120_Brake_100.Data(:, 2)];
brake_data = [ones(length(Vel_30_Brake_10.Data(:, 1)), 1)*-10; ones(length(Vel_40_Brake_20.Data(:, 1)), 1)*-20;...
              ones(length(Vel_50_Brake_30.Data(:, 1)), 1)*-30; ones(length(Vel_60_Brake_40.Data(:, 1)), 1)*-40;...
              ones(length(Vel_70_Brake_50.Data(:, 1)), 1)*-50; ones(length(Vel_80_Brake_60.Data(:, 1)), 1)*-60;...
              ones(length(Vel_90_Brake_70.Data(:, 1)), 1)*-70; ones(length(Vel_100_Brake_80.Data(:, 1)), 1)*-80;...
              ones(length(Vel_110_Brake_90.Data(:, 1)), 1)*-90; ones(length(Vel_120_Brake_100.Data(:, 1)), 1)*-100];
Vx_bra = Vx_Brake(:);
Ax_bra = Ax_Brake(:);
Brake = brake_data(:);
F2 = scatteredInterpolant(Vx_bra, Ax_bra, Brake);  % linear

% 刹车标定表
% 设定速度、加速度区间
Vx_scope2 = 0:4:120;       
Ax_scope2 = -0.1:-0.2:-6;      
% 制作油门标定表：由实车测试的数据进行插值得到新的表
brake_table = zeros(length(Vx_scope2), length(Ax_scope2));
% 填写油门标定表, 通过当前的车速和加速度确定要给多大的油门开度
for i = 1:length(Vx_scope2)
    for j = 1:length(Ax_scope2)
        brake_table(i, j) = F2(Vx_scope2(i), Ax_scope2(j));
    end
end
% 绘制油门标定的曲面图
[X2, Y2] = meshgrid(Vx_scope2, Ax_scope2);
Z2 = F2(X2, Y2);
for i = 1:length(Z2(:, 1))
    for j = 1:length(Z2(1, :))
        if Z2(i, j) < -100
            Z2(i, j) = -100;
        end
    end
end
figure;
surf(Y2, X2, Z2)

%% 油门-刹车合并的标定表
Vehspd_valueX = 0:4:120;
Accreq_valueY = [-6:0.2:-0.1,0.1:0.2:4.5]; 
Openness_valueZ = zeros(length(Accreq_valueY), length(Vehspd_valueX));
% Openness_valueZ = zeros(length(Accreq_valueY), length(Vehspd_valueX));
for i = 1:length(Vehspd_valueX)
    for j = 1:length(Accreq_valueY)
        if Accreq_valueY(j) > 0
            Openness_valueZ(j, i) = F1(Vehspd_valueX(i), Accreq_valueY(j));
        else
            Openness_valueZ(j, i) = F2(Vehspd_valueX(i), Accreq_valueY(j)); 
        end
        if Openness_valueZ(j, i) > 100
            Openness_valueZ(j, i) = 100;
        elseif Openness_valueZ(j, i) < -100
            Openness_valueZ(j, i) = -100;
        end
    end
end
save('Vehspd_valueX.mat', 'Vehspd_valueX')
save('Accreq_valueY.mat', 'Accreq_valueY')
save('Openness_valueZ.mat', 'Openness_valueZ')