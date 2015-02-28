clear all
close all
clc

load('cy5_saph150.mat')

dr_snr = snr_data(:,12);
wd_snr = snr_data(:,9);
snr = snr_data(:,20);

dr_all = all_data(:,12);
wd_all = all_data(:,9);
theta = all_data(:,19);

dr_base = base_data(:,12);
wd_base = base_data(:,9);
theta_base = base_data(:,19);

subplot(2,1,1);
[wdq,drq] = meshgrid(min(wd_snr):0.5:max(wd_snr),min(dr_snr):2.5:max(dr_snr));
scatter3(wd_snr,dr_snr,snr,'.');
hold on;
snrq = griddata(wd_snr,dr_snr,snr,wdq,drq);
mesh(wdq,drq,snrq);
hold on;
set(gca, 'ZScale', 'log')
title({'150um Sapphire Ball', 'SNR against Working Distance and Detector Radius'});
ylabel('DETECTOR RADIUS');
xlabel('WORKING DISTANCE');
zlabel('SNR');

subplot(2,1,2);
[drq,wdq] = meshgrid(min(dr_all):2.5:max(dr_all),min(wd_all):0.5:max(wd_all));
scatter3(dr_all,wd_all,theta,'.');
hold on;
thetaq = griddata(dr_all,wd_all,theta,drq,wdq);
mesh(drq,wdq,thetaq);
hold on;

[drbq,wdbq] = meshgrid(min(dr_base):2.5:max(dr_base),min(wd_base):0.5:max(wd_base));
scatter3(dr_base,wd_base,theta_base,'x');
hold on;
thetabq = griddata(dr_base,wd_base,theta_base,drbq,wdbq);
mesh(drbq,wdbq,thetabq);
hold on;

title({'150um Sapphire Ball', '\theta against Working Distance and Detector Radius'});
xlabel('DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
zlabel('\theta');
