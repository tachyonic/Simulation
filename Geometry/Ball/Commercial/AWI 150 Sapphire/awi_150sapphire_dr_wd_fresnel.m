%clear all
%close all
%clc

%load awi_150sapphire_dr_wd_fresnel

dr = awi_150sapphire_dr_wd_fresnel(:,9);
wd = awi_150sapphire_dr_wd_fresnel(:,7);
base_rays = awi_150sapphire_dr_wd_fresnel(:,10);
n_rays = awi_150sapphire_dr_wd_fresnel(:,11);
base_rays_area = awi_150sapphire_dr_wd_fresnel(:,14);
n_rays_area = awi_150sapphire_dr_wd_fresnel(:,15);
diff_improvement = awi_150sapphire_dr_wd_fresnel(:,16);
diff_improvement_area = awi_150sapphire_dr_wd_fresnel(:,17);
[xq,yq] = meshgrid(20:.5:70,10:1:400);

figure(1);
scatter3(dr,wd,n_rays,'.');
hold on;
scatter3(dr,wd,base_rays,'x');
zq = griddata(dr,wd,n_rays,xq,yq);
mesh(xq,yq,zq);
zq = griddata(dr,wd,base_rays,xq,yq);
mesh(xq,yq,zq);
title('RAYS against WORKING DISTANCE and DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
xlabel('DETECTOR RADIUS');
zlabel('NUMBER OF RAYS');

figure(2);
scatter3(dr,wd,n_rays_area,'.');
hold on;
scatter3(dr,wd,base_rays_area,'x');
zq = griddata(dr,wd,n_rays_area,xq,yq);
mesh(xq,yq,zq);
zq = griddata(dr,wd,base_rays_area,xq,yq);
mesh(xq,yq,zq);
title('RAYS/AREA against WORKING DISTANCE and DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
xlabel('DETECTOR RADIUS');
zlabel('NUMBER OF RAYS/AREA');

figure(3);
scatter3(dr,wd,diff_improvement,'.');
hold on;
zq = griddata(dr,wd,diff_improvement,xq,yq);
mesh(xq,yq,zq);
title('DIFFERENTIAL IMPROVEMENT against WORKING DISTANCE and DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
xlabel('DETECTOR RADIUS');
zlabel('DIFFERENTIAL IMPROVEMENT');

figure(4);
scatter3(dr,wd,diff_improvement_area,'.');
hold on;
zq = griddata(dr,wd,diff_improvement_area,xq,yq);
mesh(xq,yq,zq);
title('DIFFERENTIAL IMPROVEMENT/AREA against WORKING DISTANCE and DETECTOR RADIUS');
ylabel('WORKING DISTANCE');
xlabel('DETECTOR RADIUS');
zlabel('DIFFERENTIAL IMPROVEMENT/AREA');