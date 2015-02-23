clear all
close all
clc

load('dr_vs_wd_theta.mat');

dr_20 = ld50_pf20(:,13);
pdms_20 = ld50_pf20(:,11);
wd_20 = ld50_pf20(:,20);
base_theta_20 = ld50_pf20(:,21);
theta_20 = ld50_pf20(:,22);

dr_30 = ld50_pf30(:,13);
pdms_30 = ld50_pf30(:,11);
wd_30 = ld50_pf30(:,20);
base_theta_30 = ld50_pf30(:,21);
theta_30 = ld50_pf30(:,22);

dr_35 = ld50_pf35(:,13);
pdms_35 = ld50_pf35(:,11);
wd_35 = ld50_pf35(:,20);
base_theta_35 = ld50_pf35(:,21);
theta_35 = ld50_pf35(:,22);

[dr1q,pdmsq] = meshgrid(min(dr_20):1:max(dr_20),min(pdms_20):1:max(pdms_20));
[dr2q,wdq] = meshgrid(min(dr_20):1:max(dr_20),min(wd_20):1:max(wd_20));

[bdr1q,bpdmsq] = meshgrid(min(dr_20):10:max(dr_20),min(pdms_20):10:max(pdms_20));
[bdr2q,bwdq] = meshgrid(min(dr_20):10:max(dr_20),min(wd_20):10:max(wd_20));

subplot(2,3,1);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
theta_20q = griddata(dr_20,pdms_20,theta_20,dr1q,pdmsq);
% theta_30q = griddata(dr_30,pdms_30,theta_30,dr1q,pdmsq);
% theta_35q = griddata(dr_35,pdms_35,theta_35,dr1q,pdmsq);
mesh(dr1q,pdmsq,theta_20q);
% mesh(dr1q,pdmsq,theta_30q);
% mesh(dr1q,pdmsq,theta_35q);
hold on;
basetheta_20q = griddata(dr_20,pdms_20,base_theta_20,bdr1q,bpdmsq);
mesh(bdr1q,bpdmsq,basetheta_20q);
title({'pitch factor = 20', 'Effective \theta against pdms above lens and Detector Radius'});
xlabel('Detector Radius');
ylabel('PDMS above lens');
zlabel('\theta_{eff}');

subplot(2,3,2);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
% theta_20q = griddata(dr_20,pdms_20,theta_20,dr1q,pdmsq);
 theta_30q = griddata(dr_30,pdms_30,theta_30,dr1q,pdmsq);
% theta_35q = griddata(dr_35,pdms_35,theta_35,dr1q,pdmsq);
% mesh(dr1q,pdmsq,theta_20q);
 mesh(dr1q,pdmsq,theta_30q);
% mesh(dr1q,pdmsq,theta_35q);
hold on;
basetheta_30q = griddata(dr_30,pdms_30,base_theta_30,bdr1q,bpdmsq);
mesh(bdr1q,bpdmsq,basetheta_30q);
title({'pitch factor = 30', 'Effective \theta against pdms above lens and Detector Radius'});
xlabel('Detector Radius');
ylabel('PDMS above lens');
zlabel('\theta_{eff}');

subplot(2,3,3);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
% theta_20q = griddata(dr_20,pdms_20,theta_20,dr1q,pdmsq);
% theta_30q = griddata(dr_30,pdms_30,theta_30,dr1q,pdmsq);
 theta_35q = griddata(dr_35,pdms_35,theta_35,dr1q,pdmsq);
% mesh(dr1q,pdmsq,theta_20q);
% mesh(dr1q,pdmsq,theta_30q);
 mesh(dr1q,pdmsq,theta_35q);
hold on;
basetheta_35q = griddata(dr_35,pdms_35,base_theta_35,bdr1q,bpdmsq);
mesh(bdr1q,bpdmsq,basetheta_35q);
title({'pitch factor = 35', 'Effective \theta against pdms above lens and Detector Radius'});
xlabel('Detector Radius');
ylabel('PDMS above lens');
zlabel('\theta_{eff}');


subplot(2,3,4);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
 theta_20q = griddata(dr_20,pdms_20,theta_20,dr2q,wdq);
% theta_30q = griddata(dr_30,pdms_30,theta_30,dr2q,wdq);
% theta_35q = griddata(dr_35,pdms_35,theta_35,dr2q,wdq);
 mesh(dr2q,wdq,theta_20q);
% mesh(dr2q,wdq,theta_30q);
% mesh(dr2q,wdq,theta_35q);
hold on;
basetheta_20q = griddata(dr_20,pdms_20,base_theta_20,bdr2q,bwdq);
mesh(bdr2q,bwdq,basetheta_20q);
title({'pitch factor = 20', 'Effective \theta against working distance and Detector Radius'});
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');


subplot(2,3,5);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
% theta_20q = griddata(dr_20,pdms_20,theta_20,dr2q,wdq);
 theta_30q = griddata(dr_30,pdms_30,theta_30,dr2q,wdq);
% theta_35q = griddata(dr_35,pdms_35,theta_35,dr2q,wdq);
% mesh(dr2q,wdq,theta_20q);
 mesh(dr2q,wdq,theta_30q);
% mesh(dr2q,wdq,theta_35q);
hold on;
basetheta_30q = griddata(dr_30,pdms_30,base_theta_30,bdr2q,bwdq);
mesh(bdr2q,bwdq,basetheta_30q);
title({'pitch factor = 30', 'Effective \theta against working distance and Detector Radius'});
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');


subplot(2,3,6);
% scatter3(dr_20,pdms_20,theta_20,'x');
% hold on;
% scatter3(dr_30,pdms_30,theta_30,'.');
% scatter3(dr_35,pdms_35,theta_35,'+');
% theta_20q = griddata(dr_20,pdms_20,theta_20,dr2q,wdq);
% theta_30q = griddata(dr_30,pdms_30,theta_30,dr2q,wdq);
 theta_35q = griddata(dr_35,pdms_35,theta_35,dr2q,wdq);
% mesh(dr2q,wdq,theta_20q);
% mesh(dr2q,wdq,theta_30q);
 mesh(dr2q,wdq,theta_35q);
hold on;
basetheta_35q = griddata(dr_35,pdms_35,base_theta_35,bdr2q,bwdq);
mesh(bdr2q,bwdq,basetheta_35q);
title({'pitch factor = 35', 'Effective \theta against working distance and Detector Radius'});
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');