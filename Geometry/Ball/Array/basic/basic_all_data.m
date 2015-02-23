clear all
close all
clc

load('basicballarray.mat');

dr = all_data(:,13);
al = all_data(:,23);
pdms = all_data(:,11);
pf = all_data(:,7);
pch = all_data(:,8);
ld = all_data(:,3);
wd = all_data(:,20);
btheta = all_data(:,21);
theta = all_data(:,22);


% %% al vs pdms
% subplot(2,2,1);
% [pdmsq,alq] = meshgrid(min(pdms):1:max(pdms),min(al):1:max(al));
% [bpdmsq,balq] = meshgrid(min(pdms):10:max(pdms),min(al):10:max(al));
% thetaq = griddata(pdms,al,theta,pdmsq,alq);
% mesh(pdmsq,alq,thetaq);
% hold on;
% bthetaq = griddata(pdms,al,btheta,bpdmsq,balq);
% mesh(bpdmsq,balq,bthetaq);
% 
% title('Effective \theta against Array Length and Distance above lens');
% xlabel('Distance above lens');
% ylabel('Array Length');
% zlabel('\theta_{eff}');
% 
% subplot(2,2,3);
% scatter3(pdms,al,theta,'.');
% xlabel('Distance above lens');
% ylabel('Array Length');
% zlabel('\theta_{eff}');

%% dr vs al
subplot(2,2,1);
[drq,alq] = meshgrid(min(dr):1:max(dr),min(al):1:max(al));
[bdrq,balq] = meshgrid(min(dr):10:max(dr),min(al):10:max(al));

thetaq = griddata(dr,al,theta,drq,alq);
mesh(drq,alq,thetaq);
hold on;
bthetaq = griddata(dr,al,btheta,bdrq,balq);
mesh(bdrq,balq,bthetaq);

title('Effective \theta against Detector Radius and Array Length');
xlabel('Detector Radius');
ylabel('Array Length');
zlabel('\theta_{eff}');

subplot(2,2,3);
scatter3(dr,al,theta,'.');
xlabel('Detector Radius');
ylabel('Array Length');
zlabel('\theta_{eff}');
%% dr vs wd
subplot(2,2,2);
[drq,wdq] = meshgrid(min(dr):1:max(dr),min(wd):1:max(wd));
[bdrq,bwdq] = meshgrid(min(dr):10:max(dr),min(wd):10:max(wd));

thetaq = griddata(dr,wd,theta,drq,wdq);
mesh(drq,wdq,thetaq);
hold on;
bthetaq = griddata(dr,wd,btheta,bdrq,bwdq);
mesh(bdrq,bwdq,bthetaq);

title('Effective \theta against Detector Radius and Working Distance');
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');

subplot(2,2,4);
scatter3(dr,wd,theta,'.');
xlabel('Detector Radius');
ylabel('Working Distance');
zlabel('\theta_{eff}');

% %% ld vs pf
% subplot(2,2,1);
% [ldq,pfq] = meshgrid(min(ld):0.5:max(ld),min(pf):0.01:max(pf));
% [bldq,bpfq] = meshgrid(min(ld):10:max(ld),min(pf):1:max(pf));
% 
% thetaq = griddata(ld,pf,theta,ldq,pfq);
% mesh(ldq,pfq,thetaq);
% hold on;
% bthetaq = griddata(ld,pf,btheta,bldq,bpfq);
% mesh(bldq,bpfq,bthetaq);
% 
% title('Effective \theta against Pitch Factor and Lens Diameter');
% xlabel('Pitch Factor');
% ylabel('Lens Diameter');
% zlabel('\theta_{eff}');
% 
% subplot(2,2,3);
% scatter3(ld,pf,theta,'.');
% xlabel('Pitch Factor');
% ylabel('Lens Diameter');
% zlabel('\theta_{eff}');
% 
% %% ld vs pch
% subplot(2,2,2);
% [ldq,pchq] = meshgrid(min(ld):0.5:max(ld),min(pch):0.1:max(pch));
% [bldq,bpchq] = meshgrid(min(ld):10:max(ld),min(pch):10:max(pch));
% thetaq = griddata(ld,pch,theta,ldq,pchq);
% mesh(ldq,pchq,thetaq);
% hold on;
% bthetaq = griddata(ld,pch,btheta,bldq,bpchq);
% mesh(bldq,bpchq,bthetaq);
% 
% title('Effective \theta against Pitch and Lens Diameter');
% xlabel('Pitch');
% ylabel('Lens Diameter');
% zlabel('\theta_{eff}');
% 
% subplot(2,2,4);
% scatter3(ld,pch,theta,'.');
% xlabel('Pitch');
% ylabel('Lens Diameter');
% zlabel('\theta_{eff}');