clear all
close all
clc

load 'dr_wd_dist_ch25';
[wdq,drq] = meshgrid(0:50:150,12.5:12.5:112.5);
    
    dr_s = dr_wd_dist_sapphire(:,13);
    wd_s = dr_wd_dist_sapphire(:,10);
    dd_s =dr_wd_dist_sapphire(:,16);
    
    dr_c = dr_wd_disr_cubic(:,13);
    wd_c = dr_wd_disr_cubic(:,10);
    dd_c =dr_wd_disr_cubic(:,16);
    
    subplot(2,1,1);
    scatter3(wd_s,dr_s,dd_s,'.');
    hold on;
    ddq_s = griddata(wd_s,dr_s,dd_s,wdq,drq);
    mesh(wdq,drq,ddq_s);
    hold on;
    title({'sapphire ball', 'Distribution of rays along detector radius vs working distance', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Additional Rays/Additonal Area');
    
    subplot(2,1,2);
    scatter3(wd_c,dr_c,dd_s,'x');
    hold on;
    ddq_c = griddata(wd_c,dr_c,dd_c,wdq,drq);
    mesh(wdq,drq,ddq_c);
    hold on;
    title({'cubic zirconia', 'Distribution of rays along detector radius vs working distance', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Additional Rays/Additonal Area');
    