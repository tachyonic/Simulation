clear all
close all
clc

load 'dr_wd';
data={r0_chan25, r11_chan25, r33_chan25, r44_chan25, r66_chan25, r100_chan25};
mark=['.' 'x' '+' 'o' '.' 'x'];
figtitle=[0 0.11 0.33 0.44 0.66 1];

for n = 1:6
    dr = data{1,n}(:,7);%(:,9*(n-1)+7);
    wd = data{1,n}(:,6);%(:,9*(n-1)+6);
    rays = data{1,n}(:,8);%(:,9*(n-1)+8);
    rays_area = data{1,n}(:,9);%(:,9*(n-1)+9);
    [drq,wdq] = meshgrid(20:1:200,10:1:500);
    
    subplot(2,3,n);
%     scatter3(dr,wd,rays,mark(n));
%     hold on;
%     zq = griddata(dr,wd,rays,drq,wdq);
%     mesh(drq,wdq,zq);
%     hold on;
%     title(['REFLECTIVITY = ' num2str(figtitle(n))]);
%     ylabel('WORKING DISTANCE');
%     xlabel('DETECTOR RADIUS');
%     zlabel('NUMBER OF RAYS');
    
%     subplot(2,6,6+n);
    scatter3(dr,wd,rays_area,mark(n));
    hold on;
    zq = griddata(dr,wd,rays_area,drq,wdq);
    mesh(drq,wdq,zq);
    hold on;
    title(['REFLECTIVITY = ' num2str(figtitle(n))]);
    ylabel('WORKING DISTANCE');
    xlabel('DETECTOR RADIUS');
    zlabel('NUMBER OF RAYS/AREA');
 end
    