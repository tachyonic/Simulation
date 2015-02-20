clear all
close all
clc

load 'dr_wd_ch25';

dr_b = dr_wd_base(:,7);
wd_b = dr_wd_base(:,6);
nrays = dr_wd_base(:,8);
theta_b = acosd(1-2*(nrays/10000));

dr_s = dr_wd_sapphire(:,13);
wd_s = dr_wd_sapphire(:,12);
nrays_s =dr_wd_sapphire(:,14);
theta_s =acosd(1-2*(nrays_s/10000));

[wdq,drq] = meshgrid(25:1:175,12.5:0.5:112.5);

figure();
scatter3(wd_s,dr_s,theta_s,'.');
hold on;
thetaq = griddata(wd_s,dr_s,theta_s,wdq,drq);
mesh(wdq,drq,thetaq);
hold on;
thetab = griddata(wd_b,dr_b,theta_b,wdq,drq);
mesh(wdq,drq,thetab);
hold on;
title({'sapphire ball', 'collection angle', 'for channel and lens diameter = 25um'});
xlabel('Working Distance');
ylabel('Detector Radius');
zlabel('\theta');
    