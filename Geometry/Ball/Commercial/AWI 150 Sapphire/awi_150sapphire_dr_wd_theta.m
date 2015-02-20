clear all
close all
clc

load('dr_wd.mat')

rays_total=10000;
b_dr = baseline(:,7);
b_wd = baseline(:,5)+baseline(:,6);
b_rays = baseline(:,8);
b_theta = acosd(1-2*(b_rays/rays_total));

s_dr = sapphire(:,9);
s_wd = sapphire(:,3)+sapphire(:,6)+sapphire(:,7)+sapphire(:,8);
sb_rays = sapphire(:,10);
s_rays =sapphire(:,11);
s_theta = acosd(1-2*(s_rays/rays_total));
sb_theta = acosd(1-2*(sb_rays/rays_total));

[drq,wdq] = meshgrid(min(s_dr):.5:max(s_dr),min(s_wd):1:max(s_wd));

subplot(2,1,1);
scatter3(s_dr,s_wd,s_theta,'.');
hold on;
s_thetaq = griddata(s_dr,s_wd,s_theta,drq,wdq);
mesh(drq,wdq,s_thetaq);
hold on;

scatter3(s_dr,s_wd,sb_theta,'o');
hold on;
sb_thetaq = griddata(s_dr,s_wd,sb_theta,drq,wdq);
mesh(drq,wdq,sb_thetaq);
hold on;

title({'150um Sapphire Ball', 'Collection Angle against Working Distance and Detector Radius', 'with Self-Simulated Baseline'});
xlabel('DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
zlabel('\theta');


subplot(2,1,2);
scatter3(s_dr,s_wd,sb_theta,'o');
hold on;
sb_thetaq = griddata(s_dr,s_wd,sb_theta,drq,wdq);
mesh(drq,wdq,sb_thetaq);
hold on;

b_thetaq = griddata(b_dr,b_wd,b_theta,drq,wdq);
mesh(drq,wdq,b_thetaq);
hold on;

title({'Comparison of self simulated and', 'lensless simulated baselines'});
xlabel('DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
zlabel('\theta');