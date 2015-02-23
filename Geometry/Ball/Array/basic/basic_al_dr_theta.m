clear all
close all
clc

load('arraysize_vs_dr_theta.mat');

dr = pdms100(:,12);
al = pdms100(:,22);
wd = pdms100(:,19);
btheta = pdms100(:,20);
theta = pdms100(:,21);

[drq,alq] = meshgrid(min(dr):1:max(dr),min(al):1:max(al));
[bdrq,balq] = meshgrid(min(dr):10:max(dr),min(al):10:max(al));

subplot(2,2,1);
scatter3(dr,al,theta,'.');
hold on;
thetaq = griddata(dr,al,theta,drq,alq);
mesh(drq,alq,thetaq);
bthetaq = griddata(dr,al,theta,bdrq,balq);
mesh(bdrq,balq,bthetaq);
title({'pdms lens to detector = 100', 'Effective \theta against Array Length and Detector Radius'});
xlabel('Detector Radius');
ylabel('Array Length');
zlabel('\theta_{eff}');


[drq,wdq] = meshgrid(min(dr):1:max(dr),min(wd):1:max(wd));
[bdrq,bwdq] = meshgrid(min(dr):10:max(dr),min(wd):10:max(wd));

subplot(2,2,2);
scatter3(dr,wd,theta,'.');
hold on;
thetaq = griddata(dr,al,theta,drq,wdq);
mesh(drq,wdq,thetaq);
bthetaq = griddata(dr,al,theta,bdrq,bwdq);
mesh(bdrq,bwdq,bthetaq);
title({'pdms lens to detector = 100', 'Effective \theta against Working Distance and Detector Radius'});
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');


[wdq,alq] = meshgrid(min(wd):1:max(wd),min(al):1:max(al));
[bwdq,balq] = meshgrid(min(wd):10:max(wd),min(al):10:max(al));

subplot(2,2,3);
scatter3(wd,al,theta,'.');
hold on;
thetaq = griddata(wd,al,theta,wdq,alq);
mesh(wdq,alq,thetaq);
bthetaq = griddata(wd,al,theta,bwdq,balq);
mesh(bwdq,balq,bthetaq);
title({'pdms lens to detector = 100', 'Effective \theta against Array Length and Working Distance'});
xlabel('Working Distance');
ylabel('Array Length');
zlabel('\theta_{eff}');
