clear all
close all
clc

load('cy5_excite_data.mat')

% goal: determine which ball to buy and feasible fabrication diameters
% see SNR and theta data for bare channel case with 150 and 250 diameter sapphire balls

titlestr='150um Sapphire Ball, xdiff=0, Reflective Bottom';
data=s150_bot_lens;
bdata=s150_bot_base;
diff=0;

dr = data(data(:,10)==diff,11);
wd = data(data(:,10)==diff,6);
snr = data(data(:,10)==diff,19);
theta = data(data(:,10)==diff,18);
btheta = bdata(bdata(:,10)==diff,18);

[drq,wdq] = meshgrid(min(dr):2.5:max(dr),min(wd):0.5:max(wd));

subplot(2,1,1);
scatter3(dr,wd,snr,'.');
hold on;
snrq = griddata(dr,wd,snr,drq,wdq);
mesh(drq,wdq,snrq);
hold on;
set(gca, 'ZScale', 'log')
title({titlestr, 'SNR against Working Distance and Detector Radius'});
xlabel('DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
zlabel('SNR');

subplot(2,1,2);
scatter3(dr,wd,theta,'.');
hold on;
thetaq = griddata(dr,wd,theta,drq,wdq);
mesh(drq,wdq,thetaq);
hold on;

scatter3(dr,wd,btheta,'x');
hold on;
thetabq = griddata(dr,wd,btheta,drq,wdq);
mesh(drq,wdq,thetabq);
hold on;

title({titlestr, '\theta against Working Distance and Detector Radius'});
xlabel('DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
zlabel('\theta');
