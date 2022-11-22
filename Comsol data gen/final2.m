function out = model
%
% final2.m
%
% Model exported on Feb 14 2021, 13:04 by COMSOL 5.5.0.292.

for i= 401481:402000
import com.comsol.model.*
import com.comsol.model.util.*

j=num2str(i);   
model = ModelUtil.create(strcat('Model',j));

model.modelPath('D:\D drive\solidworks\practice');

model.label('mesh.mph');

model.param.set('E1', '1000[MPa]');
model.param.set('E2', '1[MPa]');
model.param.set('D1', '1150[kg/m^3]');
model.param.set('D2', '970[kg/m^3]');
s = RandStream('mt19937ar','Seed','shuffle');
x=rand(s,2,1);
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
model.component('comp1').geom('geom1').run('fin');

model.view.create('view2', 3);

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material.create('mat5', 'Common');
model.component('comp1').material('mat3').selection.set([1]);
model.component('comp1').material('mat3').propertyGroup('def').func.create('sigma', 'Analytic');
model.component('comp1').material('mat3').propertyGroup('def').func.create('alpha', 'Analytic');
model.component('comp1').material('mat3').propertyGroup('def').func.create('k', 'Analytic');
model.component('comp1').material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').propertyGroup.create('linzRes', 'Linearized resistivity');
model.component('comp1').material('mat5').selection.set([2]);
model.component('comp1').material('mat5').propertyGroup('def').func.create('k_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('res_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('Syt_solid_annealed_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('alpha_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('C_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('sigma_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('HC_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('VP_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('epsilon', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('rho_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('def').func.create('elong_solid_annealed_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup.create('ThermalExpansion', 'Thermal expansion');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func.create('dL_solid_1', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func.create('CTE', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat5').propertyGroup('Enu').func.create('E', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('Enu').func.create('nu', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup.create('KG', 'Bulk modulus and shear modulus');
model.component('comp1').material('mat5').propertyGroup('KG').func.create('mu', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup('KG').func.create('kappa', 'Piecewise');
model.component('comp1').material('mat5').propertyGroup.create('ElastoplasticModel', 'Elastoplastic material model');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').func.create('Sys_solid_annealed_1', 'Piecewise');

model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').create('fix1', 'Fixed', 1);
model.component('comp1').physics('solid').feature('fix1').selection.set([2]);
model.component('comp1').physics('solid').create('disp1', 'Displacement1', 1);
model.component('comp1').physics('solid').feature('disp1').selection.set([4]);

model.component('comp1').mesh('mesh1').create('fq1', 'FreeQuad');
model.component('comp1').mesh('mesh1').feature('fq1').selection.geom('geom1', 2);
model.component('comp1').mesh('mesh1').feature('fq1').selection.set([1 2]);
model.component('comp1').mesh('mesh1').feature('fq1').create('dis1', 'Distribution');
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').selection.set([2]);
model.component('comp1').mesh('mesh1').feature('size').set('hauto', 3);

model.component('comp1').view('view1').axis.set('xmin', -1.863462209701538);
model.component('comp1').view('view1').axis.set('xmax', 2.8004748821258545);
model.component('comp1').view('view1').axis.set('ymin', -0.10620886087417603);
model.component('comp1').view('view1').axis.set('ymax', 4.354564189910889);

model.component('comp1').material('mat3').label('Polysilicon');
model.component('comp1').material('mat3').set('family', 'custom');
model.component('comp1').material('mat3').set('specular', 'custom');
model.component('comp1').material('mat3').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat3').set('diffuse', 'custom');
model.component('comp1').material('mat3').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat3').set('ambient', 'custom');
model.component('comp1').material('mat3').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat3').set('noise', true);
model.component('comp1').material('mat3').set('noisefreq', 1);
model.component('comp1').material('mat3').set('lighting', 'cooktorrance');
model.component('comp1').material('mat3').set('fresnel', 0.7);
model.component('comp1').material('mat3').set('roughness', 0.5);
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('expr', '1/(2e-5*(1+1.25e-3*(T-298.15)))');
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('args', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('dermethod', 'manual');
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('argders', {'T' 'd(1/(2e-5*(1+1.25e-3*(T-298.15))), T)'});
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('fununit', 'S/m');
model.component('comp1').material('mat3').propertyGroup('def').func('sigma').set('plotargs', {'T' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('expr', '(3.725*(1-exp(-5.88e-3*(T-125)))+5.548e-4*T)*1e-6');
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('args', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('dermethod', 'manual');
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('argders', {'T' 'd((3.725*(1-exp(-5.88e-3*(T-125)))+5.548e-4*T)*1e-6, T)'});
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('fununit', '1/K');
model.component('comp1').material('mat3').propertyGroup('def').func('alpha').set('plotargs', {'T' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('expr', '1/(-2.2e-11*T^3 + 9e-8*T^2 - 1e-5*T + 0.014)');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('args', 'T');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('dermethod', 'manual');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('argders', {'T' 'd(1/(-2.2e-11*T^3 + 9e-8*T^2 - 1e-5*T + 0.014), T)'});
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('argunit', 'K');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('fununit', 'W/(m*K)');
model.component('comp1').material('mat3').propertyGroup('def').func('k').set('plotargs', {'T' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'sigma(T)' '0' '0' '0' 'sigma(T)' '0' '0' '0' 'sigma(T)'});
model.component('comp1').material('mat3').propertyGroup('def').descr('electricconductivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', {'alpha(T)' '0' '0' '0' 'alpha(T)' '0' '0' '0' 'alpha(T)'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalexpansioncoefficient_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', '678[J/(kg*K)]');
model.component('comp1').material('mat3').propertyGroup('def').descr('heatcapacity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'4.5' '0' '0' '0' '4.5' '0' '0' '0' '4.5'});
model.component('comp1').material('mat3').propertyGroup('def').descr('relpermittivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('density', 'D2');
model.component('comp1').material('mat3').propertyGroup('def').descr('density_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'k(T)' '0' '0' '0' 'k(T)' '0' '0' '0' 'k(T)'});
model.component('comp1').material('mat3').propertyGroup('def').descr('thermalconductivity_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat3').propertyGroup('Enu').set('youngsmodulus', 'E2');
model.component('comp1').material('mat3').propertyGroup('Enu').descr('youngsmodulus_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('Enu').set('poissonsratio', '0.49');
model.component('comp1').material('mat3').propertyGroup('Enu').descr('poissonsratio_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('rho0', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('alpha', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('Tref', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('rho0', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('alpha', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('Tref', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('rho0', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('alpha', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('Tref', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('rho0', '2e-5');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('alpha', '1.25e-3');
model.component('comp1').material('mat3').propertyGroup('linzRes').set('Tref', '298.15[K]');
model.component('comp1').material('mat3').propertyGroup('linzRes').descr('rho0_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').descr('alpha_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').descr('Tref_symmetry', '');
model.component('comp1').material('mat3').propertyGroup('linzRes').addInput('temperature');
model.component('comp1').material('mat5').label('Nickel [solid,annealed]');
model.component('comp1').material('mat5').set('family', 'custom');
model.component('comp1').material('mat5').set('specular', 'custom');
model.component('comp1').material('mat5').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat5').set('diffuse', 'custom');
model.component('comp1').material('mat5').set('customdiffuse', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat5').set('ambient', 'custom');
model.component('comp1').material('mat5').set('customambient', [0.7843137254901961 0.7843137254901961 0.7843137254901961]);
model.component('comp1').material('mat5').set('noise', true);
model.component('comp1').material('mat5').set('noisefreq', 1);
model.component('comp1').material('mat5').set('lighting', 'cooktorrance');
model.component('comp1').material('mat5').set('fresnel', 0.9);
model.component('comp1').material('mat5').propertyGroup('def').func('k_solid_1').label('Piecewise 2');
model.component('comp1').material('mat5').propertyGroup('def').func('k_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('k_solid_1').set('pieces', {'0.0' '18.0' '214.0436*T^1+2.199849*T^2-0.4089829*T^3-0.02700268*T^4+0.001304208*T^5';  ...
'18.0' '34.5' '-5208.712+1431.939*T^1-103.9216*T^2+3.410781*T^3-0.05321568*T^4+3.189215E-4*T^5';  ...
'34.5' '75.1' '4648.872-225.3013*T^1+4.520693*T^2-0.0414926*T^3+1.439157E-4*T^4';  ...
'75.1' '205.0' '904.9102-16.54678*T^1+0.1325449*T^2-4.75388E-4*T^3+6.33262E-7*T^4';  ...
'205.0' '631.0' '185.3755-0.6437058*T^1+0.00164864*T^2-2.193597E-6*T^3+1.131921E-9*T^4';  ...
'631.0' '1500.0' '50.42098+0.02143115*T^1'});
model.component('comp1').material('mat5').propertyGroup('def').func('res_solid_1').label('Piecewise 1');
model.component('comp1').material('mat5').propertyGroup('def').func('res_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('res_solid_1').set('pieces', {'100.0' '633.0' '-3.610912E-8+5.575728E-10*T^1-1.189788E-12*T^2+1.811005E-15*T^3';  ...
'633.0' '800.0' '5.696199E-8+4.544983E-10*T^1-1.128754E-13*T^2';  ...
'800.0' '1300.0' '9.614177E-8+3.152233E-10*T^1';  ...
'1300.0' '1715.0' '1.06E-7+3.456E-10*T^1-2.92E-14*T^2'});
model.component('comp1').material('mat5').propertyGroup('def').func('Syt_solid_annealed_1').label('Piecewise 2.1');
model.component('comp1').material('mat5').propertyGroup('def').func('Syt_solid_annealed_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('Syt_solid_annealed_1').set('pieces', {'77.0' '644.0' '7.215399E8-2463963.0*T^1+5666.31*T^2-5.387338*T^3+0.001198245*T^4'; '644.0' '1088.0' '6.106184E8-477284.4*T^1-235.4998*T^2+0.1737128*T^3'});
model.component('comp1').material('mat5').propertyGroup('def').func('alpha_solid_1').label('Piecewise 3');
model.component('comp1').material('mat5').propertyGroup('def').func('alpha_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('alpha_solid_1').set('pieces', {'0.0' '255.0' '7.613874E-6+3.35753E-8*T^1-5.879278E-11*T^2'; '255.0' '500.0' '7.24503E-6+4.503271E-8*T^1-1.564717E-10*T^2+2.721998E-13*T^3-1.695788E-16*T^4'; '500.0' '1173.0' '4.931202E-6+3.05557E-8*T^1-2.958128E-11*T^2+1.004274E-14*T^3'});
model.component('comp1').material('mat5').propertyGroup('def').func('C_solid_1').label('Piecewise 4');
model.component('comp1').material('mat5').propertyGroup('def').func('C_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('C_solid_1').set('pieces', {'100.0' '599.0' '-90.3858223+4.50469105*T^1-0.0146741332*T^2+2.22312447E-5*T^3-1.18767944E-8*T^4';  ...
'599.0' '631.0' '-29261.0634+162.961737*T^1-0.297217929*T^2+1.80908503E-4*T^3';  ...
'631.0' '700.0' '8011.77424-20.0860911*T^1+0.0134144647*T^2';  ...
'700.0' '1728.0' '572.533121-0.212217375*T^1+2.3992148E-4*T^2-5.1865115E-8*T^3'});
model.component('comp1').material('mat5').propertyGroup('def').func('sigma_solid_1').label('Piecewise 5');
model.component('comp1').material('mat5').propertyGroup('def').func('sigma_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('sigma_solid_1').set('pieces', {'100.0' '633.0' '1/(1.811005E-15*T^3-1.189788E-12*T^2+5.575728E-10*T-3.610912E-08)';  ...
'633.0' '800.0' '1/(-1.128754E-13*T^2+4.544983E-10*T+5.696199E-08)';  ...
'800.0' '1300.0' '1/(3.152233E-10*T+9.614177E-08)';  ...
'1300.0' '1715.0' '1/(-2.920000E-14*T^2+3.456000E-10*T+1.060000E-07)'});
model.component('comp1').material('mat5').propertyGroup('def').func('HC_solid_1').label('Piecewise 6');
model.component('comp1').material('mat5').propertyGroup('def').func('HC_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('HC_solid_1').set('pieces', {'100.0' '599.0' '-5.30564672+0.264425453*T^1-8.61371377E-4*T^2+1.30497412E-6*T^3-6.97167786E-10*T^4';  ...
'599.0' '631.0' '-1717.62447+9.5658541*T^1-0.0174466942*T^2+1.06193309E-5*T^3';  ...
'631.0' '700.0' '470.291223-1.17905371*T^1+7.87429218E-4*T^2';  ...
'700.0' '1728.0' '32.8224214-0.0101491874*T^1+1.19082247E-5*T^2-2.38565195E-9*T^3'});
model.component('comp1').material('mat5').propertyGroup('def').func('VP_solid_1').label('Piecewise 7');
model.component('comp1').material('mat5').propertyGroup('def').func('VP_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('VP_solid_1').set('pieces', {'293.0' '1728.0' '(exp((-2.26060000e+04/T-8.71700000e-01*log10(T)+1.34378100e+01)*log(10.0)))*1.33320000e+02'});
model.component('comp1').material('mat5').propertyGroup('def').func('epsilon').label('Piecewise 8');
model.component('comp1').material('mat5').propertyGroup('def').func('epsilon').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('epsilon').set('pieces', {'245.0' '1093.0' '0.05021919+2.137239E-4*T^1-2.976342E-7*T^2+1.846619E-10*T^3'});
model.component('comp1').material('mat5').propertyGroup('def').func('rho_solid_1').label('Piecewise 9');
model.component('comp1').material('mat5').propertyGroup('def').func('rho_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('rho_solid_1').set('pieces', {'0.0' '30.0' '8960.466'; '30.0' '280.0' '8959.339+0.08118937*T^1-0.001509887*T^2+1.865826E-6*T^3'; '280.0' '1173.0' '8957.209-0.01644238*T^1-7.716327E-4*T^2+6.255458E-7*T^3-1.883567E-10*T^4'});
model.component('comp1').material('mat5').propertyGroup('def').func('elong_solid_annealed_1').label('Piecewise 10');
model.component('comp1').material('mat5').propertyGroup('def').func('elong_solid_annealed_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('def').func('elong_solid_annealed_1').set('pieces', {'77.0' '1088.0' '80.39804-0.134346*T^1+1.823587E-4*T^2-1.545278E-8*T^3-3.859654E-11*T^4'});
model.component('comp1').material('mat5').propertyGroup('def').set('thermalconductivity', {'k_solid_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_1(T[1/K])[W/(m*K)]' '0' '0' '0' 'k_solid_1(T[1/K])[W/(m*K)]'});
model.component('comp1').material('mat5').propertyGroup('def').set('thermalconductivity_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('def').set('resistivity', {'res_solid_1(T[1/K])[ohm*m]' '0' '0' '0' 'res_solid_1(T[1/K])[ohm*m]' '0' '0' '0' 'res_solid_1(T[1/K])[ohm*m]'});
model.component('comp1').material('mat5').propertyGroup('def').set('resistivity_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('def').set('Syt', 'Syt_solid_annealed_1(T[1/K])[Pa]');
model.component('comp1').material('mat5').propertyGroup('def').set('thermalexpansioncoefficient', {'(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))' '0' '0' '0' '(alpha_solid_1(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha_solid_1(T[1/K])[1/K]-alpha_solid_1(Tempref[1/K])[1/K])/(T-Tempref),d(alpha_solid_1(T[1/K])[1/K],T)))/(1+alpha_solid_1(Tempref[1/K])[1/K]*(Tempref-293[K]))'});
model.component('comp1').material('mat5').propertyGroup('def').set('thermalexpansioncoefficient_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('def').set('heatcapacity', 'C_solid_1(T[1/K])[J/(kg*K)]');
model.component('comp1').material('mat5').propertyGroup('def').set('electricconductivity', {'sigma_solid_1(T[1/K])[S/m]' '0' '0' '0' 'sigma_solid_1(T[1/K])[S/m]' '0' '0' '0' 'sigma_solid_1(T[1/K])[S/m]'});
model.component('comp1').material('mat5').propertyGroup('def').set('electricconductivity_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('def').set('HC', 'HC_solid_1(T[1/K])[J/(mol*K)]');
model.component('comp1').material('mat5').propertyGroup('def').set('VP', 'VP_solid_1(T[1/K])[Pa]');
model.component('comp1').material('mat5').propertyGroup('def').set('emissivity', 'epsilon(T[1/K])');
model.component('comp1').material('mat5').propertyGroup('def').set('density', 'D1');
model.component('comp1').material('mat5').propertyGroup('def').set('elong', 'elong_solid_annealed_1(T[1/K])');
model.component('comp1').material('mat5').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat5').propertyGroup('def').addInput('strainreferencetemperature');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('dL_solid_1').label('Piecewise 2');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('dL_solid_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('dL_solid_1').set('pieces', {'0.0' '30.0' '-0.002241764'; '30.0' '240.0' '-0.002199851-3.015419E-6*T^1+5.600574E-8*T^2-6.870731E-11*T^3'; '240.0' '1173.0' '-0.00392508052+1.848384E-5*T^1-3.75054E-8*T^2+9.133189E-11*T^3-8.532584E-14*T^4+2.807789E-17*T^5'});
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('CTE').label('Piecewise 1');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('CTE').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').func('CTE').set('pieces', {'50.0' '350.0' '-5.87011E-6+1.938799E-7*T^1-8.26993E-10*T^2+1.664025E-12*T^3-1.249417E-15*T^4';  ...
'350.0' '635.0' '3.858532E-6+5.641275E-8*T^1-1.218844E-10*T^2+1.07478E-13*T^3';  ...
'635.0' '650.0' '7.005974E-4-2.020734E-6*T^1+1.489546E-9*T^2';  ...
'650.0' '800.0' '4.61122E-5-7.991209E-8*T^1+5.274725E-11*T^2'});
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('alphatan', '');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('dL', '');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('alphatanIso', '');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('dLIso', '');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('alphatan', {'CTE(T[1/K])[1/K]' '0' '0' '0' 'CTE(T[1/K])[1/K]' '0' '0' '0' 'CTE(T[1/K])[1/K]'});
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('dL', {'(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))' '0' '0' '0' '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))' '0' '0' '0' '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))'});
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('alphatanIso', 'CTE(T[1/K])[1/K]');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('dLIso', '(dL_solid_1(T[1/K])-dL_solid_1(Tempref[1/K]))/(1+dL_solid_1(Tempref[1/K]))');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('alphatan_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').set('dL_symmetry', '0');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').addInput('temperature');
model.component('comp1').material('mat5').propertyGroup('ThermalExpansion').addInput('strainreferencetemperature');
model.component('comp1').material('mat5').propertyGroup('Enu').func('E').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('Enu').func('E').set('pieces', {'0.0' '773.0' '2.198604E11-4.976173E7*T^1-6940.452*T^2'; '773.0' '1323.0' '3.675636E11-5.264939E8*T^1+511021.8*T^2-191.9755*T^3'});
model.component('comp1').material('mat5').propertyGroup('Enu').func('nu').label('Piecewise 1');
model.component('comp1').material('mat5').propertyGroup('Enu').func('nu').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('Enu').func('nu').set('pieces', {'293.0' '773.0' '0.2970106-4.70622E-5*T^1+3.902138E-8*T^2'});
model.component('comp1').material('mat5').propertyGroup('Enu').set('youngsmodulus', 'E1');
model.component('comp1').material('mat5').propertyGroup('Enu').set('poissonsratio', '0.49');
model.component('comp1').material('mat5').propertyGroup('Enu').addInput('temperature');
model.component('comp1').material('mat5').propertyGroup('KG').func('mu').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('KG').func('mu').set('pieces', {'293.0' '773.0' '8.483201E10-1.654608E7*T^1-5055.849*T^2'});
model.component('comp1').material('mat5').propertyGroup('KG').func('kappa').label('Piecewise 1');
model.component('comp1').material('mat5').propertyGroup('KG').func('kappa').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('KG').func('kappa').set('pieces', {'293.0' '773.0' '1.789167E11-7.188841E7*T^1+22477.8*T^2'});
model.component('comp1').material('mat5').propertyGroup('KG').set('K', '');
model.component('comp1').material('mat5').propertyGroup('KG').set('G', '');
model.component('comp1').material('mat5').propertyGroup('KG').set('K', 'kappa(T[1/K])[Pa]');
model.component('comp1').material('mat5').propertyGroup('KG').set('G', 'mu(T[1/K])[Pa]');
model.component('comp1').material('mat5').propertyGroup('KG').addInput('temperature');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').func('Sys_solid_annealed_1').label('Piecewise');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').func('Sys_solid_annealed_1').set('arg', 'T');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').func('Sys_solid_annealed_1').set('pieces', {'77.0' '1088.0' '1.42427E8-320861.9*T^1+678.0062*T^2-0.7322205*T^3+2.658365E-4*T^4'});
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('sigmags', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('Et', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('Ek', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('sigmagh', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('Hillcoefficients', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('ys', '');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('sigmags', 'Sys_solid_annealed_1(T[1/K])[Pa]');
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('Hillcoefficients', {'0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').set('ys', {'0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat5').propertyGroup('ElastoplasticModel').addInput('temperature');

model.component('comp1').physics('solid').feature('disp1').set('Direction', [0 0 1]);
model.component('comp1').physics('solid').feature('disp1').set('U0', {'0' '0' '0.0001'});

model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('type', 'predefined');
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('elemcount', 500);
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('elemratio', 4);
model.component('comp1').mesh('mesh1').feature('fq1').feature('dis1').set('method', 'geometric');
model.component('comp1').mesh('mesh1').run;

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

model.result.dataset.create('rev1', 'Revolve2D');
model.result.dataset.create('cln1', 'CutLine2D');
model.result.dataset.create('cln2', 'CutLine2D');
model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup3D');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', 'solid.sz');
model.result('pg1').feature('surf1').create('def', 'Deform');
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', 'solid.mises');
model.result('pg2').feature('surf1').create('def', 'Deform');
model.result('pg3').create('lngr1', 'LineGraph');
model.result('pg3').feature('lngr1').set('expr', 'solid.sz');
model.result.export.create('plot5', 'Plot');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol1').runAll;

model.result.dataset('rev1').set('startangle', -90);
model.result.dataset('rev1').set('revangle', 225);
model.result.dataset('rev1').set('hasspacevars', true);
model.result('pg1').label('Stress (solid)');
model.result('pg1').feature('surf1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg1').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg1').feature('surf1').feature('def').set('scale', 2.4835558032297724);
model.result('pg1').feature('surf1').feature('def').set('scaleactive', false);
model.result('pg2').label('Stress, 3D (solid)');
model.result('pg2').feature('surf1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg2').feature('surf1').set('colortable', 'RainbowLight');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result('pg2').feature('surf1').feature('def').set('revcoordsys', 'cylindrical');
model.result('pg2').feature('surf1').feature('def').set('expr', {'u' '0' 'w'});
model.result('pg2').feature('surf1').feature('def').set('descractive', true);
model.result('pg2').feature('surf1').feature('def').set('scale', 2.5627603593219015);
model.result('pg2').feature('surf1').feature('def').set('descr', 'Displacement field');
model.result('pg2').feature('surf1').feature('def').set('scaleactive', false);
model.result('pg3').set('data', 'cln1');
model.result('pg3').set('xlabel', 'Arc length (mm)');
model.result('pg3').set('ylabel', 'Stress tensor, z component (N/m<sup>2</sup>)');
model.result('pg3').set('showlegends', false);
model.result('pg3').set('xlabelactive', false);
model.result('pg3').set('ylabelactive', false);
model.result('pg3').feature('lngr1').set('data', 'cln1');
model.result('pg3').feature('lngr1').set('const', {'solid.refpntr' '0' 'Reference point for moment computation, r coordinate'; 'solid.refpntphi' '0' 'Reference point for moment computation, phi coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg3').feature('lngr1').set('legend', true);
model.result('pg3').feature('lngr1').set('resolution', 'normal');
model.result.export('plot5').set('plotgroup', 'pg3');
model.result.export('plot5').set('plot', 'lngr1');
model.result.export('plot5').set('filename', strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\stress\stress',j),'.csv'));
model.result.export('plot5').run;
csvwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\curve\curve',j),'.csv'),x);
dlmwrite(strcat(strcat('C:\Users\Rohit Varre\Desktop\Project Spidy\curve\curve',j),'.csv'),y,'delimiter',',','-append');
out = model;
end
