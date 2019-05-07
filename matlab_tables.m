clear
close all
load('CompleteResultsAge01.mat')
index=1:7;

disp('SSTO')
std(NULLEFFECTSDATA.NA,'omitnan')

disp('Argument')
POINTargument = fid_nMLM_ci(VERTEXargument, WEIGHTargument, 0.5, pArgument, rArgument);
disp([POINTargument(index,1),CIargument(index,:)]);

disp('Potential Argument')
POINTpotential_argument = fid_nMLM_ci(VERTEXpotential_argument, WEIGHTpotential_argument, 0.5, pPotential_argument, rPotential_argument);
disp([POINTpotential_argument(index,1),CIpotential_argument(index,:)]);

disp('Work')
POINTWork_stress = fid_nMLM_ci(VERTEXWork_stress, WEIGHTWork_stress, 0.5, pWork_stress, rWork_stress);
disp([POINTWork_stress(index,1),CIWork_stress(index,:)]);

disp('Home')
POINThome = fid_nMLM_ci(VERTEXhome, WEIGHThome, 0.5, pHome, rHome);
disp([POINThome(index,1),CIhome(index,:)]);

disp('Network')
POINTnetwork = fid_nMLM_ci(VERTEXNetwork, WEIGHTNetwork, 0.5, pNetwork, rNetwork);
disp([POINTnetwork(index,1),CINetwork(index,:)]);

disp('Health')
POINTHealth_stress = fid_nMLM_ci(VERTEXHealth_stress, WEIGHTHealth_stress, 0.5, pHealth_stress, rHealth_stress);
disp([POINTHealth_stress(index,1),CIHealth_stress(index,:)]);