function out = model
%
% final_strain.m
%
% Model exported on Oct 7 2021, 21:04 by COMSOL 5.5.0.292.

for i=47614:50000
import com.comsol.model.*
import com.comsol.model.util.*

j=num2str(i);   
model = ModelUtil.create(strcat('Model',j));

model.modelPath('D:\D drive\collage\projects\Bioinspired');

model.param.set('E1', '1000[MPa]');
model.param.set('E2', '1[MPa]');
model.param.set('D1', '1150[kg/m^3]');
model.param.set('D2', '970[kg/m^3]');
s = RandStream('mt19937ar','Seed','shuffle');
x=sort(rand(s,2,1));
x=[0; x; 1];
y=rand(s,4,1)*1.95+0.05;
model.param.set('x1', strcat(num2str(x(1)),'[mm]'));
model.param.set('x2', strcat(num2str(x(2)),'[mm]'));
model.param.set('x3', strcat(num2str(x(3)),'[mm]'));
model.param.set('x4', strcat(num2str(x(4)),'[mm]'));
model.param.set('y1', strcat(num2str(y(1)),'[mm]'));
model.param.set('y2', strcat(num2str(y(2)),'[mm]'));
model.param.set('y3', strcat(num2str(y(3)),'[mm]'));
model.param.set('y4', strcat(num2str(y(4)),'[mm]'));

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').axisymmetric(true);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit('mm');
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', [1 4]);
model.component('comp1').geom('geom1').create('cb1', 'CubicBezier');
model.component('comp1').geom('geom1').feature('cb1').set('p', {'x1' 'x2' 'x3' 'x4'; 'y1' 'y2' 'y3' 'y4'});
model.component('comp1').geom('geom1').run;

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('lemm2', 'LinearElasticModel', 2);
model.component('comp1').physics('solid').feature('lemm2').selection.set([1]);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([2]);
model.component('comp1').physics('solid').create('disp1', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp1').selection.set([4]);

model.component('comp1').mesh('mesh1').create('fq1', 'FreeQuad');
model.component('comp1').mesh('mesh1').feature('fq1').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').selection.set([2]);

model.component('comp1').view('view1').axis.set('xmin', -2.5375852584838867);
model.component('comp1').view('view1').axis.set('xmax', 3.5375852584838867);
model.component('comp1').view('view1').axis.set('ymin', -0.09999999403953552);
model.component('comp1').view('view1').axis.set('ymax', 4.099999904632568);

model.component('comp1').physics('solid').feature('lemm1').set('E_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('E', 'E1');
model.component('comp1').physics('solid').feature('lemm1').set('nu_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('nu', 0.49);
model.component('comp1').physics('solid').feature('lemm1').set('rho_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('rho', 'D1');
model.component('comp1').physics('solid').feature('lemm2').set('E_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm2').set('E', 'E2');
model.component('comp1').physics('solid').feature('lemm2').set('nu_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm2').set('nu', 0.49);
model.component('comp1').physics('solid').feature('lemm2').set('rho_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm2').set('rho', 'D2');
model.component('comp1').physics('solid').feature('disp1').set('Direction', [0; 0; 1]);
model.component('comp1').physics('solid').feature('disp1').set('U0', {'0'; '0'; '0.0001'});

try
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('type', 'predefined');
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('elemcount', 500);
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('elemratio', 4);
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('method', 'geometric');
model.component('comp1').mesh('mesh1').run;
catch
csvwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\exception_curves\curve_',j),'.csv'),x);
dlmwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\exception_curves\curve_',j),'.csv'),y,'delimiter',',','-append');
disp(j);
clear x;
clear y;
continue;
end
model.study.create('std1');
model.study('std1').create('stat', 'Stationary');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.dataset.create('cln1', 'CutLine2D');
model.result.dataset.create('rev1', 'Revolve2D');
model.result.create('pg1', 'PlotGroup1D');
model.result.create('pg2', 'PlotGroup2D');
model.result.create('pg3', 'PlotGroup3D');
model.result('pg1').create('lngr1', 'LineGraph');
model.result('pg1').feature('lngr1').set('expr', 'solid.sz');
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', 'solid.mises');
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg3').create('surf1', 'Surface');
model.result('pg3').feature('surf1').set('expr', 'solid.mises');
model.result('pg3').feature('surf1').create('def', 'Deform');
model.result.export.create('plot1', 'Plot');

try
model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').runAll;
catch
csvwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\solver_error\curve_',j),'.csv'),x);
dlmwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\solver_error\curve_',j),'.csv'),y,'delimiter',',','-append');
disp(j);
clear x;
clear y;
continue;
end

model.result.dataset('rev1').set('startangle', -90);
model.result.dataset('rev1').set('revangle', 225);
model.result.dataset('rev1').set('hasspacevars', true);
model.result('pg1').set('data', 'cln1');
model.result('pg1').set('solrepresentation', 'solnum');
model.result('pg1').set('xlabel', 'Arc length (mm)');
model.result('pg1').set('ylabel', 'Stress tensor, z component (N/m<sup>2</sup>)');
model.result('pg1').set('xlabelactive', false);
model.result('pg1').set('ylabelactive', false);
model.result('pg1').feature('lngr1').set('data', 'cln1');
model.result('pg1').feature('lngr1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('lngr1').set('resolution', 'normal');
model.result('pg2').label('Stress (solid)');
model.result('pg2').feature('surf1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg2').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result('pg2').feature('surf1').feature('def').set('scale', 2.499999652019132);
model.result('pg2').feature('surf1').feature('def').set('scaleactive', false);
model.result('pg3').label('Stress, 3D (solid)');
model.result('pg3').feature('surf1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg3').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg3').feature('surf1').set('resolution', 'normal');
model.result('pg3').feature('surf1').feature('def').set('revcoordsys', 'cylindrical');
model.result('pg3').feature('surf1').feature('def').set('expr', {'u' '0' 'w'});
model.result('pg3').feature('surf1').feature('def').set('descractive', true);
model.result('pg3').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result.export('plot1').set('filename',strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\stress_data\stress_',j),'.csv'));
model.result.export('plot1').run;
csvwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\curve_data\curve_',j),'.csv'),x);
dlmwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\New Data\curve_data\curve_',j),'.csv'),y,'delimiter',',','-append');
out = model;
clear x;
clear y;
ModelUtil.remove(strcat('Model',j));
clear model;
end
