clear all
close all
clc

load('dia_vs_wd_theta.mat');

ld = dr200_pch25(:,3);
pdms = dr200_pch25(:,11);
wd = dr200_pch25(:,20);
base_theta = dr200_pch25(:,21);
lens_theta = dr200_pch25(:,22);

[ld1q,pdmsq] = meshgrid(min(ld):1:max(ld),min(pdms):1:max(pdms));
[ld2q,wdq] = meshgrid(min(ld):1:max(ld),min(wd):1:max(wd));

subplot(2,1,1);
scatter3(ld,pdms,lens_theta,'.');
hold on;
scatter3(ld,pdms,base_theta,'x');
lens_thetaq = griddata(ld,pdms,lens_theta,ld1q,pdmsq);
mesh(ld1q,pdmsq,lens_thetaq);
base_thetaq = griddata(ld,pdms,base_theta,ld1q,pdmsq);
mesh(ld1q,pdmsq,base_thetaq);
title('Effective \theta against pdms above lens and lens diameter');
xlabel('Lens diameter');
ylabel('PDMS above lens');
zlabel('\theta_{eff}');

subplot(2,1,2);
scatter3(ld,wd,lens_theta,'.');
hold on;
scatter3(ld,wd,base_theta,'x');
lens_thetaq = griddata(ld,wd,lens_theta,ld2q,wdq);
mesh(ld2q,wdq,lens_thetaq);
base_thetaq = griddata(ld,wd,base_theta,ld2q,wdq);
mesh(ld2q,wdq,base_thetaq);
title('Effective \theta against working distance and lens diameter');
xlabel('Lens Diameter');
ylabel('Working Distance');
zlabel('\theta_{eff}');