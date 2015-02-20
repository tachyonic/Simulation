clear all
close all
clc

load 'wd_dr';

    dr = untitled(:,7);
    wd = untitled(:,6);
    theta = atand(dr./wd);    % for calculation of numerical aperture
    rays = untitled(:,8);
    rays_area = untitled(:,9);
    [theta_wdq,wdq] = meshgrid(0:1:90,0:1:301);
    [theta_drq,drq] = meshgrid(0:1:90,20:1:200);
    
    subplot(2,1,1);
    scatter3(theta, dr, rays, '.');
    hold on;
    raysq = griddata(theta,dr,rays,theta_drq,drq);
    mesh(theta_drq,drq,raysq);
    hold on;
    title('NUMBER OF RAYS vs angle from source to detector');
    xlabel('\theta');
    ylabel('detector radius');     
      
    subplot(2,1,2);
    scatter3(theta, wd, rays, '.');
    hold on;
    raysq = griddata(theta,wd,rays,theta_wdq,wdq);
    mesh(theta_wdq,wdq,raysq);
    hold on;
    title('NUMBER OF RAYS vs angle from source to detector');
    xlabel('\theta');
    ylabel('working distance');

%    [drq,wdq] = meshgrid(20:1:200,0:1:301);
    
%     
%     scatter3(dr,rays,'.');
%      hold on;
%     raysq = griddata(dr,wd,rays,drq,wdq);
%      mesh(drq,wdq,raysq);
%      hold on;
%      title('NUMBER OF RAYS');
%      ylabel('WORKING DISTANCE');
%      xlabel('DETECTOR RADIUS');
%      zlabel('NUMBER OF RAYS');
    
%     subplot(2,1,2);
%     scatter3(dr,wd,rays_area,'.');
%     hold on;
%    raysareaq = griddata(dr,wd,rays_area,drq,wdq);
%     mesh(drq,wdq,raysareaq);
%     hold on;
%     title('NUMBER OF RAYS/AREA');
%     ylabel('WORKING DISTANCE');
%     xlabel('DETECTOR RADIUS');
%     zlabel('NUMBER OF RAYS/AREA');
    