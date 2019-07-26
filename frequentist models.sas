options ps=54 ls=75 date number pageno=1 compress=yes fmterr=off;
options obs=max;

footnote 'Neupert & Hannig null effects paper';


*frequentist models with age dichotomous (agegr, 0 = younger, 1 = older);
*dataset name = merged;
*Level 2 id variable = id;

ods graphics on;
proc mixed data = merged noclprint covtest;
title 'argument model';
class id;
model na = argument agegr argument*agegr/cl residual
solution ddfm=bw;
random intercept argument/ subject = id type = un;
run;*interaction = no;


proc mixed data = merged noclprint covtest;
title 'potential argument model';
class id;
model na = potential_argument agegr potential_argument*agegr/cl residual
solution ddfm=bw;
random intercept potential_argument/ subject = id type = un;
run;*interaction = no;


proc mixed data = merged noclprint covtest;
title 'work stressor model';
class id;
model na = work_stress agegr work_stress*agegr/cl residual
solution ddfm=bw;
random intercept work_stress/ subject = id type = un;
run;*interaction = no;


proc mixed data = merged noclprint covtest;
title 'home stressor model';
class id;
model na = home agegr home*agegr/cl residual
solution ddfm=bw;
random intercept home/ subject = id type = un;
run;*interaction = no;


proc mixed data = merged noclprint covtest;
title 'social network model';
class id;
model na = network agegr network*agegr/cl residual
solution ddfm=bw;
random intercept network/ subject = id type = un;
run;*sig interaction;

*decomposing above;

proc mixed data = merged noclprint covtest;
title 'social network model - younger';
where agegr = 0;
class id;
model na = network /cl
solution ddfm=bw;
random intercept network/ subject = id type = un;
run;*.42 and sig p = .0016;

proc mixed data = merged noclprint covtest;
title 'social network model - older';
where agegr = 1;
class id;
model na = network /cl
solution ddfm=bw;
random intercept network/ subject = id type = un;
run;*.02 and not sig p = .6661;

proc mixed data = merged noclprint covtest;
title 'health stressor model';
class id;
model na = health_stress agegr health_stress*agegr/cl residual
solution ddfm=bw;
random intercept health_stress/ subject = id type = un;
run;*no interaction;
ods graphics off;


