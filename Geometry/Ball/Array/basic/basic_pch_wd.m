clear all
close all
clc

load('pch_vs_wd.mat');

pch_fact = dr105(:,7);
pch = dr105(:,8);
wd = dr105(:,11);
base_rays = dr105(:,14);
n_rays =dr105(:,15);
diff_improvement = dr105(:,18);

[pchq,wdq] = meshgrid(10:.25:90,10:1:400);
[pch_factq,wd_factq] = meshgrid(2:.25:4,10:1:400);

figure(1);
scatter3(pch,wd,n_rays,'.');
hold on;
scatter3(pch,wd,base_rays,'x');
zq = griddata(pch,wd,n_rays,pchq,wdq);
mesh(pchq,wdq,zq);
zq = griddata(pch,wd,base_rays,pchq,wdq);
mesh(pchq,wdq,zq);
title('RAYS against WORKING DISTANCE and ABSOLUTE PITCH');
ylabel('WORKING DISTANCE');
xlabel('PITCH');
zlabel('NUMBER OF RAYS');

figure(2);
scatter3(pch_fact,wd,n_rays,'.');
hold on;
scatter3(pch_fact,wd,base_rays,'x');
zq = griddata(pch_fact,wd,n_rays,pch_factq,wd_factq);
mesh(pch_factq,wd_factq,zq);
zq = griddata(pch_fact,wd,base_rays,pch_factq,wd_factq);
mesh(pch_factq,wd_factq,zq);
title('RAYS against WORKING DISTANCE and PITCH FACTOR');
ylabel('WORKING DISTANCE');
xlabel('PITCH FACTOR');
zlabel('NUMBER OF RAYS');

figure(3);
scatter3(pch,wd,diff_improvement,'.');
hold on;
zq = griddata(pch,wd,diff_improvement,pchq,wdq);
mesh(pchq,wdq,zq);
title('DIFFERENTIAL IMPROVEMENT against WORKING DISTANCE and ABSOLUTE PITCH');
ylabel('WORKING DISTANCE');
xlabel('PITCH');
zlabel('DIFFERENTIAL IMPROVEMENT');

figure(4);
scatter3(pch_fact,wd,diff_improvement,'.');
hold on;
zq = griddata(pch_fact,wd,diff_improvement,pch_factq,wd_factq);
mesh(pch_factq,wd_factq,zq);
title('DIFFERENTIAL IMPROVEMENT against WORKING DISTANCE and PITCH FACTOR');
ylabel('WORKING DISTANCE');
xlabel('PITCH FACTOR');
zlabel('DIFFERENTIAL IMPROVEMENT');