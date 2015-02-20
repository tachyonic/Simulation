clear all
close all
clc

load 'dr_wd_dist_ch25';
[wdq,drq] = meshgrid(0:1:150,12.5:0.5:112.5);
    
    dr_s = dr_wd_dist_sapphire(:,13);
    wd_s = dr_wd_dist_sapphire(:,10);
    baserays_s =dr_wd_dist_sapphire(:,15);
    nrays_s =dr_wd_dist_sapphire(:,14);
    dd_s =dr_wd_dist_sapphire(:,16);
    
    dr_c = dr_wd_disr_cubic(:,13);
    wd_c = dr_wd_disr_cubic(:,10);
    baserays_c = dr_wd_disr_cubic(:,15);
    nrays_c =dr_wd_disr_cubic(:,14);
    dd_c =dr_wd_disr_cubic(:,16);
%     
%     subplot(2,1,1);
%     scatter3(wd_s,dr_s,dd_s,'.');
%     hold on;
%     ddq_s = griddata(wd_s,dr_s,dd_s,wdq,drq);
%     mesh(wdq,drq,ddq_s);
%     hold on;
%     title({'sapphire ball', 'Distribution of rays along detector radius vs working distance', 'for channel and lens diameter = 25um'});
%     ylabel('Working Distance');
%     xlabel('Detector Radius');
%     zlabel('Additional Rays/Additonal Area');
%     
%     subplot(2,1,2);
%     scatter3(wd_c,dr_c,dd_s,'x');
%     hold on;
%     ddq_c = griddata(wd_c,dr_c,dd_c,wdq,drq);
%     mesh(wdq,drq,ddq_c);
%     hold on;
%     title({'cubic zirconia', 'Distribution of rays along detector radius vs working distance', 'for channel and lens diameter = 25um'});
%     ylabel('Working Distance');
%     xlabel('Detector Radius');
%     zlabel('Additional Rays/Additonal Area');
%     
    
    
    subplot(2,2,1);
    scatter3(wd_s,dr_s,nrays_s,'.');
    hold on;
    nraysq_s = griddata(wd_s,dr_s,nrays_s,wdq,drq);
    mesh(wdq,drq,nraysq_s);
    hold on;
    title({'sapphire ball', 'absolute rays', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Rays');
   
    subplot(2,2,2);
    scatter3(wd_s,dr_s,baserays_s,'.');
    hold on;
    rays_areaq_s = griddata(wd_s,dr_s,baserays_s,wdq,drq);
    mesh(wdq,drq,rays_areaq_s);
    hold on;
    title({'sapphire ball', 'rays/area', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Rays/area');
    
    subplot(2,2,3);
    scatter3(wd_c,dr_c,nrays_c,'.');
    hold on;
    nraysq_c = griddata(wd_c,dr_c,nrays_c,wdq,drq);
    mesh(wdq,drq,nraysq_c);
    hold on;
    title({'Cubic Zirconia ball', 'Absolute rays', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Rays');
    
    subplot(2,2,4);
    scatter3(wd_c,dr_c,baserays_c,'.');
    hold on;
    rays_areaq_c = griddata(wd_c,dr_c,baserays_c,wdq,drq);
    mesh(wdq,drq,rays_areaq_c);
    hold on;
    title({'Cubic Zirconia ball', 'arrays/area', 'for channel and lens diameter = 25um'});
    ylabel('Working Distance');
    xlabel('Detector Radius');
    zlabel('Rays/Area');
    