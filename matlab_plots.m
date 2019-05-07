close all
clear

load('CompleteResultsAge01.mat');

stress_title={'argument', 'home','potential argument','work','network','health'};

generic_title={'intercept','age', 'stressor','stressor X age',...
               'SD intercept','SD stressor X intercept','SD residual'};
           
VERTEX={VERTEXargument,VERTEXhome,VERTEXpotential_argument,VERTEXWork_stress,VERTEXNetwork, VERTEXHealth_stress};
WEIGHT={WEIGHTargument,WEIGHThome,WEIGHTpotential_argument,WEIGHTWork_stress,WEIGHTNetwork, WEIGHTHealth_stress};

CC={};

for i=1:6
    cc = fid_nMLN_cc(VERTEX{i}, WEIGHT{i}, 0.05,stress_title{i},generic_title);  
    CC{i}=cc;
    
    fid_nMLN_2d(VERTEX{i}, WEIGHT{i},15, stress_title{i},generic_title); 
end

cc = fid_nMLN_cc(VERTEXage, WEIGHTage, 0.05,'none',generic_title([1:2,5,7])); 
fid_nMLN_2d(VERTEXage, WEIGHTage,15, 'none',generic_title([1:2,5,7])); 
CC{7}=cc;

close all