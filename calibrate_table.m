load Vel_0_Throttle_10.mat
load Vel_0_Throttle_20.mat
load Vel_0_Throttle_30.mat
load Vel_0_Throttle_40.mat
load Vel_0_Throttle_50.mat
load Vel_0_Throttle_60.mat
load Vel_0_Throttle_70.mat
load Vel_0_Throttle_80.mat
load Vel_0_Throttle_90.mat
load Vel_0_Throttle_100.mat
load Vel_20_Brake_5.mat
load Vel_30_Brake_10.mat
load Vel_40_Brake_20.mat
load Vel_50_Brake_30.mat
load Vel_60_Brake_40.mat
load Vel_70_Brake_50.mat
load Vel_80_Brake_60.mat
load Vel_90_Brake_70.mat
load Vel_100_Brake_80.mat
load Vel_110_Brake_90.mat
load Vel_120_Brake_100.mat

figure
plot(Vel_0_Throttle_10.Data(:, 1), Vel_0_Throttle_10.Data(:, 2), 'LineWidth', 1.5)
hold on
plot(Vel_0_Throttle_20.Data(:, 1), Vel_0_Throttle_20.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_30.Data(:, 1), Vel_0_Throttle_30.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_40.Data(:, 1), Vel_0_Throttle_40.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_50.Data(:, 1), Vel_0_Throttle_50.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_60.Data(:, 1), Vel_0_Throttle_60.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_70.Data(:, 1), Vel_0_Throttle_70.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_80.Data(:, 1), Vel_0_Throttle_80.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_90.Data(:, 1), Vel_0_Throttle_90.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_0_Throttle_100.Data(:, 1), Vel_0_Throttle_100.Data(:, 2), 'LineWidth', 1.5)

plot(Vel_20_Brake_5.Data(:, 1), Vel_20_Brake_5.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_30_Brake_10.Data(:, 1), smooth(Vel_30_Brake_10.Data(:, 2)), 'LineWidth', 1.5)
plot(Vel_40_Brake_20.Data(:, 1), Vel_40_Brake_20.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_50_Brake_30.Data(:, 1), smooth(Vel_50_Brake_30.Data(:, 2)), 'LineWidth', 1.5)
plot(Vel_60_Brake_40.Data(:, 1), smooth(Vel_60_Brake_40.Data(:, 2)), 'LineWidth', 1.5)
plot(Vel_70_Brake_50.Data(:, 1), Vel_70_Brake_50.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_80_Brake_60.Data(:, 1), Vel_80_Brake_60.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_90_Brake_70.Data(:, 1), Vel_90_Brake_70.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_100_Brake_80.Data(:, 1), Vel_100_Brake_80.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_110_Brake_90.Data(:, 1), Vel_110_Brake_90.Data(:, 2), 'LineWidth', 1.5)
plot(Vel_120_Brake_100.Data(:, 1), Vel_120_Brake_100.Data(:, 2), 'LineWidth', 1.5)
