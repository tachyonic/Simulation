clear all
close all
clc

load 'dr50';
[lensdiaq,wdq] = meshgrid(20:5:75,10:1:50);
    
    lensdia_0 = r0_dr50(:,4);
    wd_0 = r0_dr50(:,10);
    rays_0 = r0_dr50(:,14);

    lensdia_1 = r1_dr50(:,4);
    wd_1 = r1_dr50(:,10);
    rays_1 = r1_dr50(:,14);
    
    figure(1);

    scatter3(lensdia_0,wd_0,rays_0,'.');
    hold on;
    zq = griddata(lensdia_0,wd_0,rays_0,lensdiaq,wdq);
    mesh(lensdiaq,wdq,zq);
    hold on;

    scatter3(lensdia_1,wd_1,rays_1,'o');
    hold on;
    zq = griddata(lensdia_1,wd_1,rays_1,lensdiaq,wdq);
    mesh(lensdiaq,wdq,zq);
    hold on;
    
    title('detector radius = 50um, rays');
    ylabel('WORKING DISTANCE');
    xlabel('DETECTOR RADIUS');
    zlabel('NUMBER OF RAYS');
    