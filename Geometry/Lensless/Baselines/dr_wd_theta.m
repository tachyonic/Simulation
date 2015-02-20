clear all
close all
clc

load 'wd_dr';

dr = untitled(:,7);
wd = untitled(:,6);
ag = untitled(:,5);
rays_total = untitled(:,2);
rays = untitled(:,8);
theta_calc = atand(dr./(wd+ag));    % for calculation of numerical aperture
theta_rays = acosd(1-2*(rays./rays_total));
[drq,wdq] = meshgrid(20:1:200,0:1:301);

subplot(3,1,1);
scatter3(dr, wd, theta_calc, '.');
hold on;
theta_calcq = griddata(dr,wd,theta_calc,drq,wdq);
mesh(drq,wdq,theta_calcq);
hold on;
title('Collection Angle against Working Distance and Detector Radius');
xlabel('detector radius');
ylabel('working distance');
zlabel('\theta_{calculated}');

subplot(3,1,2);
scatter3(dr, wd, theta_rays, '.');
hold on;
theta_raysq = griddata(dr,wd,theta_rays,drq,wdq);
mesh(drq,wdq,theta_raysq);
hold on;
title('Collection Angle against Working Distance and Detector Radius');
xlabel('detector radius');
ylabel('working distance');
zlabel('\theta_{simulated}');


subplot(3,1,3);
% mesh(drq,wdq,theta_calcq);
% hold on;
% mesh(drq,wdq,theta_raysq);
% hold on;
theta_diffq=theta_calcq-theta_raysq;
mesh(drq,wdq,theta_diffq);
hold on;
title('Collection Angle against Working Distance and Detector Radius');
xlabel('detector radius');
ylabel('working distance');
zlabel('\theta_{diff}');
    