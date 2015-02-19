clear all
close all
clc

load('pch_vs_dia.mat');

pch_fact = wd340_dr105(:,7);
pch = wd340_dr105(:,8);
dia = wd340_dr105(:,3);
base_rays = wd340_dr105(:,14);
n_rays =wd340_dr105(:,15);
diff_improvement = wd340_dr105(:,18);

[pchq,diaq] = meshgrid(10:.25:90,10:0.5:50);
[pch_factq,dia_factq] = meshgrid(2:.25:4,10:0.5:50);

figure(1);
scatter3(pch,dia,n_rays,'.');
hold on;
scatter3(pch,dia,base_rays,'x');
zq = griddata(pch,dia,n_rays,pchq,diaq);
mesh(pchq,diaq,zq);
zq = griddata(pch,dia,base_rays,pchq,diaq);
mesh(pchq,diaq,zq);
title('RAYS against LENS DIAMETER and ABSOLUTE PITCH');
ylabel('LENS DIAMETER');
xlabel('PITCH');
zlabel('NUMBER OF RAYS');

figure(2);
scatter3(pch_fact,dia,n_rays,'.');
hold on;
scatter3(pch_fact,dia,base_rays,'x');
zq = griddata(pch_fact,dia,n_rays,pch_factq,dia_factq);
mesh(pch_factq,dia_factq,zq);
zq = griddata(pch_fact,dia,base_rays,pch_factq,dia_factq);
mesh(pch_factq,dia_factq,zq);
title('RAYS against LENS DIAMETER and PITCH FACTOR');
ylabel('LENS DIAMETER');
xlabel('PITCH FACTOR');
zlabel('NUMBER OF RAYS');

figure(3);
scatter3(pch,dia,diff_improvement,'.');
hold on;
zq = griddata(pch,dia,diff_improvement,pchq,diaq);
mesh(pchq,diaq,zq);
title('DIFFERENTIAL IMPROVEMENT against LENS DIAMETER and ABSOLUTE PITCH');
ylabel('LENS DIAMETER');
xlabel('PITCH');
zlabel('DIFFERENTIAL IMPROVEMENT');

figure(4);
scatter3(pch_fact,dia,diff_improvement,'.');
hold on;
zq = griddata(pch_fact,dia,diff_improvement,pch_factq,dia_factq);
mesh(pch_factq,dia_factq,zq);
title('DIFFERENTIAL IMPROVEMENT against LENS DIAMETER and PITCH FACTOR');
ylabel('LENS DIAMETER');
xlabel('PITCH FACTOR');
zlabel('DIFFERENTIAL IMPROVEMENT');