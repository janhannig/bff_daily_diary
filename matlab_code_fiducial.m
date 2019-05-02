clear
load('data')


%% Preprocessing for sample
%Generate Upper and lower bounds on dependent variable
indexnan=logical((1-isnan(NULLEFFECTSDATA.NA)).*(1-isnan(NULLEFFECTSDATA.age)).*(1-isnan(NULLEFFECTSDATA.argument)).*(1-isnan(NULLEFFECTSDATA.home)));
ncases=sum(indexnan);

%rng(125); %set seed
%rng(27111972)
rng(2691976)
permutedcases=find(indexnan);
newdataorder=randperm(ncases);
permutedcases=permutedcases(newdataorder);
mynulldata=NULLEFFECTSDATA(permutedcases,:);

%allowing for different slopes for young and old
old_indicator=mynulldata.age>40;
%slope_old=(mynulldata.age-mean(mynulldata.age(old_indicator))).*old_indicator;
%slope_young=(mynulldata.age-mean(mynulldata.age(~old_indicator))).*(~old_indicator);
age_group=old_indicator+0;


naint=mynulldata.NA+[-.05,+.05];

levelsrandom=grp2idx(categorical(string(mynulldata.ID)));
                       %convertingto string and back to categorical removes                     
                      %phantom categories removed by subseting
                      
                      
%% Run the with no stressor -  random intercept
% 
% designfixedNone=ones(ncases,1);
% 
% levelsrandomNone=levelsrandom;
% 
% 
% designNone=struct('FE',designfixedNone,'RE',levelsrandomNone,'N',2000);
% [VERTEXnone,WEIGHTnone,ESSnone, pNone, rNone] = fid_nMLM(naint,designNone);
% 
% [CInone] = fid_nMLM_ci(VERTEXnone, WEIGHTnone, 0.05, pNone, rNone)
% 
% save

%% Run the with age only -  random intercept


designfixedAge=[ones(ncases,1),age_group];

levelsrandomAge=levelsrandom;


designAge=struct('FE',designfixedAge,'RE',levelsrandomAge,'N',2000);
[VERTEXage,WEIGHTage,ESSage, pAge, rAge] = fid_nMLM(naint,designAge);

[CIage] = fid_nMLM_ci(VERTEXage, WEIGHTage, 0.05, pAge, rAge)

save

%% Run the with Argument stressor -  random intercept + slope

designfixedArgument=[ones(ncases,1),age_group,mynulldata.argument, old_indicator.*mynulldata.argument];

levelsrandomArgument=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.argument))))];


designArgument=struct('FE',designfixedArgument,'RE',levelsrandomArgument,'N',2000);
[VERTEXargument,WEIGHTargument,ESSargument, pArgument, rArgument] = fid_nMLM(naint,designArgument);

[CIargument] = fid_nMLM_ci(VERTEXargument, WEIGHTargument, 0.05, pArgument, rArgument)

save
%% Run the model with home stressor -  random intercept + slope
designfixedHome=[age_group,mynulldata.home,...
    old_indicator.*mynulldata.home];
designfixedHome=[ones(ncases,1),designfixedHome];

levelsrandomHome=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.home))))];

designHome=struct('FE',designfixedHome,'RE',levelsrandomHome,'N',2000);
[VERTEXhome,WEIGHThome,ESShome, pHome, rHome] = fid_nMLM(naint,designHome);

[CIhome] = fid_nMLM_ci(VERTEXhome, WEIGHThome, 0.05, pHome, rHome)

save
%% Run the with Potential_argument stressor -  random intercept + slope

designfixedPotential_argument=[age_group,mynulldata.potential_argument,...
    old_indicator.*mynulldata.potential_argument];
designfixedPotential_argument=[ones(ncases,1),designfixedPotential_argument];

levelsrandomPotential_argument=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.potential_argument))))];


designPotential_argument=struct('FE',designfixedPotential_argument,'RE',levelsrandomPotential_argument,'N',2000);
[VERTEXpotential_argument,WEIGHTpotential_argument,ESSpotential_argument, pPotential_argument, rPotential_argument] = fid_nMLM(naint,designPotential_argument);

[CIpotential_argument] = fid_nMLM_ci(VERTEXpotential_argument, WEIGHTpotential_argument, 0.05, pPotential_argument, rPotential_argument)

save
%% Run the with Work_stress stressor -  random intercept + slope

designfixedWork_stress=[age_group,mynulldata.work_stress,...
    old_indicator.*mynulldata.work_stress];
designfixedWork_stress=[ones(ncases,1),designfixedWork_stress];

levelsrandomWork_stress=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.work_stress))))];


designWork_stress=struct('FE',designfixedWork_stress,'RE',levelsrandomWork_stress,'N',2000);
[VERTEXWork_stress,WEIGHTWork_stress,ESSWork_stress, pWork_stress, rWork_stress] = fid_nMLM(naint,designWork_stress);

[CIWork_stress] = fid_nMLM_ci(VERTEXWork_stress, WEIGHTWork_stress, 0.05, pWork_stress, rWork_stress)

save
%% Run the with Network stressor -  random intercept + slope

designfixedNetwork=[age_group,mynulldata.network,...
    old_indicator.*mynulldata.network];
designfixedNetwork=[ones(ncases,1),designfixedNetwork];

levelsrandomNetwork=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.network))))];


designNetwork=struct('FE',designfixedNetwork,'RE',levelsrandomNetwork,'N',2000);
[VERTEXNetwork,WEIGHTNetwork,ESSNetwork, pNetwork, rNetwork] = fid_nMLM(naint,designNetwork);

[CINetwork] = fid_nMLM_ci(VERTEXNetwork, WEIGHTNetwork, 0.05, pNetwork, rNetwork)

save
%% Run the with Health_stress stressor -  random intercept + slope

designfixedHealth_stress=[age_group,mynulldata.health_stress,...
    old_indicator.*mynulldata.health_stress];
designfixedHealth_stress=[ones(ncases,1),designfixedHealth_stress];

levelsrandomHealth_stress=[levelsrandom, ...
    grp2idx(categorical(string(mynulldata.ID.*categorical(mynulldata.health_stress))))];


designHealth_stress=struct('FE',designfixedHealth_stress,'RE',levelsrandomHealth_stress,'N',2000);
[VERTEXHealth_stress,WEIGHTHealth_stress,ESSHealth_stress, pHealth_stress, rHealth_stress] = fid_nMLM(naint,designHealth_stress);

[CIHealth_stress] = fid_nMLM_ci(VERTEXHealth_stress, WEIGHTHealth_stress, 0.05, pHealth_stress, rHealth_stress)

save



