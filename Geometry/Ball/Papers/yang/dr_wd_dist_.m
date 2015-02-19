clear all
close all
clc

load 'dr_wd_dist_ch25';
[wdq,drq] = meshgrid(0:50:150,12.5:12.5:112.5);
    
    dr = dr_wd_dist(:,13);
    wd = dr_wd_dist(:,10);
    dd =dr_wd_dist(:,16);
    
    figure(1);
    scatter3(wd,dr,dd,'.');
    hold on;
    ddq = griddata(wd,dr,dd,wdq,drq);
    mesh(wdq,drq,ddq);
    hold on;
    title('Distribution of rays along detector radius vs working distance \nfor channel and lens diameter = 25um');
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Additional Rays/Additonal Area');
    