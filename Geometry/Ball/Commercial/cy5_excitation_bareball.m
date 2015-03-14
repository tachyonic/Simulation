clear all
close all
clc

load('cy5_excite_data.mat')

% goal: determine which ball to buy and feasible fabrication diameters
% see SNR and theta data for bare channel case with 150 and 250 diameter sapphire balls

%titlestr='250um Cubic Zirconia Ball, xdiff=50, Bare Channel';
data=cz250_bot_side_lens;
bdata=cz250_bot_side_base;
diff=50;

dr = data(data(:,10)==diff,11);
pdms = data(data(:,10)==diff,6);
wd = data(data(:,10)==diff,7);
snr = data(data(:,10)==diff,19);
theta = data(data(:,10)==diff,18);
btheta = bdata(bdata(:,10)==diff,18);
taper = bdata(bdata(:,10)==diff,8);
dtheta = theta-btheta;

dataset=[dr pdms wd taper btheta theta dtheta snr snr];

% [drq,wdq] = meshgrid(min(dr):2.5:max(dr),min(wd):0.5:max(wd));
% 
% subplot(3,1,1);
% scatter3(dr,wd,snr,'.');
% hold on;
% snrq = griddata(dr,wd,snr,drq,wdq);
% mesh(drq,wdq,snrq);
% hold on;
% set(gca, 'ZScale', 'log')
% title({titlestr, 'SNR against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('SNR');
% 
% subplot(3,1,2);
% scatter3(dr,wd,theta,'.');
% hold on;
% thetaq = griddata(dr,wd,theta,drq,wdq);
% mesh(drq,wdq,thetaq);
% alpha(.4);
% hold on;
% 
% title({titlestr, '\theta against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('\theta');
% 
% subplot(3,1,3);
% scatter3(dr,wd,theta-btheta,'x');
% hold on;
% thetabq = griddata(dr,wd,theta-btheta,drq,wdq);
% mesh(drq,wdq,thetabq);
% hold on;
% 
% title({titlestr, '\theta Improvement against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('\Delta\theta');

%%

% load('cy5_dia250_tol20.mat')
% 
% 
% titlestr='250 +/- 20um Sapphire Ball, xdiff=0, Bare Channel';
% data=dia250_tol20;
% bdata=s250_bare_base;
% diff=0;
% nlens=1.76;
% 
% dr = data(and(data(:,10)==diff,data(:,3)==nlens),11);
% wd = data(and(data(:,10)==diff,data(:,3)==nlens),6);
% snr = data(and(data(:,10)==diff,data(:,3)==nlens),19);
% theta = data(and(data(:,10)==diff,data(:,3)==nlens),18);
% snr_lo = data(and(data(:,10)==diff,data(:,3)==nlens),27);
% theta_lo = data(and(data(:,10)==diff,data(:,3)==nlens),26);
% snr_hi= data(and(data(:,10)==diff,data(:,3)==nlens),35);
% theta_hi = data(and(data(:,10)==diff,data(:,3)==nlens),34);
% 
% bdr = data(bdata(:,10)==diff,11);
% bwd = data(bdata(:,10)==diff,6);
% btheta = bdata(bdata(:,10)==diff,18);
% 
% [drq,wdq] = meshgrid(min(dr):2.5:max(dr),min(wd):0.5:max(wd));
% [drb,wdb] = meshgrid(min(bdr):2.5:max(bdr),min(bwd):0.5:max(bwd));
% 
% %
% 
% subplot(3,1,1);
% scatter3(dr,wd,snr,'o');
% hold on;
% snrq = griddata(dr,wd,snr,drq,wdq);
% mesh(drq,wdq,snrq);
% hold on;
% 
% 
% scatter3(dr,wd,snr_hi,'+');
% hold on;
% snrhiq = griddata(dr,wd,snr_hi,drq,wdq);
% C=zeros(numel(snrhiq),3);
% C(:,2)=1;
% mesh(drq,wdq,snrhiq,C);
% hold on;
% 
% scatter3(dr,wd,snr_lo,'.');
% hold on;
% snrloq = griddata(dr,wd,snr_lo,drq,wdq);
% C=zeros(numel(snrloq),3);
% C(:,3)=1;
% mesh(drq,wdq,snrloq,C);
% hold on;
% 
% set(gca, 'ZScale', 'log')
% title({titlestr, 'SNR against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('SNR');
% 
% %
% 
% subplot(3,1,2);
% 
% scatter3(dr,wd,theta,'o');
% hold on;
% thetaq = griddata(dr,wd,theta,drq,wdq);
% mesh(drq,wdq,thetaq);
% hold on;
% 
% scatter3(dr,wd,theta_hi,'+');
% hold on;
% %thetahiq = griddata(dr,wd,theta_hi,drq,wdq);
% %mesh(drq,wdq,thetahiq);
% %hold on;
% 
% scatter3(dr,wd,theta_lo,'.');
% hold on;
% %thetaloq = griddata(dr,wd,theta_lo,drq,wdq);
% %mesh(drq,wdq,thetaloq);
% %hold on;
% 
% title({'\theta against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('\theta');
% 
% %
% 
% subplot(3,1,3);
% 
% scatter3(bdr,bwd,btheta,'x');
% hold on;
% thetabq = griddata(bdr,bwd,btheta,drb,wdb);
% mesh(drb,wdb,thetabq);
% hold on;
% 
% title({'Baseline \theta against Working Distance and Detector Radius'});
% xlabel('DETECTOR RADIUS');
% ylabel('WORKING DISTANCE');
% zlabel('\theta');
