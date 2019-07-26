clear
close all
clc
load('CompleteResultsAge01.mat')
index=1:7;

disp('SSTO')
var(NULLEFFECTSDATA.NA,'omitnan')

disp('Argument')
POINTargument = fid_nMLM_ci(VERTEXargument, WEIGHTargument, 0.5, pArgument, rArgument);
POINTargument = sum(VERTEXargument .* WEIGHTargument,2);
argument_table=[POINTargument(index,1),CIargument(index,:)];
argument_table(end-2:end,:)=argument_table(end-2:end,:).^2;
disp(argument_table)
fprintf('%6.2f  %6.2f  %6.2f \n', argument_table')

disp('Potential Argument')
POINTpotential_argument = fid_nMLM_ci(VERTEXpotential_argument, WEIGHTpotential_argument, 0.5, pPotential_argument, rPotential_argument);
POINTpotential_argument = sum(VERTEXpotential_argument .* WEIGHTpotential_argument,2);
potential_argument_table=[POINTpotential_argument(index,1),CIpotential_argument(index,:)];
potential_argument_table(end-2:end,:)=potential_argument_table(end-2:end,:).^2;
disp(potential_argument_table)
fprintf('%6.2f  %6.2f  %6.2f \n', potential_argument_table')


disp('Work')
POINTwork_stress = fid_nMLM_ci(VERTEXWork_stress, WEIGHTWork_stress, 0.5, pWork_stress, rWork_stress);
POINTwork_stress = sum(VERTEXWork_stress .* WEIGHTWork_stress,2);
work_table=[POINTwork_stress(index,1),CIWork_stress(index,:)];
work_table(end-2:end,:)=work_table(end-2:end,:).^2;
disp(work_table)
fprintf('%6.2f  %6.2f  %6.2f \n', work_table')

disp('Home')
POINThome = fid_nMLM_ci(VERTEXhome, WEIGHThome, 0.5, pHome, rHome);
POINThome = sum(VERTEXhome .* WEIGHThome,2);
home_table=[POINThome(index,1),CIhome(index,:)];
home_table(end-2:end,:)=home_table(end-2:end,:).^2;
disp(home_table)
fprintf('%6.2f  %6.2f  %6.2f \n', home_table')

disp('Network')
POINTnetwork = fid_nMLM_ci(VERTEXNetwork, WEIGHTNetwork, 0.5, pNetwork, rNetwork);
POINTnetwork = sum(VERTEXNetwork .* WEIGHTNetwork,2);
network_table=[POINTnetwork(index,1),CINetwork(index,:)];
network_table(end-2:end,:)=network_table(end-2:end,:).^2;
disp(network_table)
fprintf('%6.2f  %6.2f  %6.2f \n', network_table')

disp('Health')
POINThealth = fid_nMLM_ci(VERTEXHealth_stress, WEIGHTHealth_stress, 0.5, pHealth_stress, rHealth_stress);
POINThealth = sum(VERTEXHealth_stress .* WEIGHTHealth_stress,2);
health_table=[POINThealth(index,1),CIHealth_stress(index,:)];
health_table(end-2:end,:)=health_table(end-2:end,:).^2;
disp(health_table)
fprintf('%6.2f  %6.2f  %6.2f \n', health_table')