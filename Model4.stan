data {
  int<lower=0> Ncases;
  int<lower=0> Nid;
  int<lower=0> NidXstress;
  vector[Ncases] well_being;
  int<lower=0,upper=1> age[Ncases];
  int<lower=0,upper=1> stress[Ncases];
  int<lower=1,upper=Nid> ID[Ncases];
  int<lower=1,upper=NidXstress> IDxS[Ncases];
}
transformed data {
  int<lower=0,upper=1> ageXstress[Ncases];
  for (i in 1:Ncases) 
      ageXstress[i]=age[i]*stress[i];
}
parameters {
  real b0;
  real bAge;
  real bStress;
  real bStressXAge;
  
  real<lower=0> sRESID;
  
  vector[Nid] w;
  vector[NidXstress] u;
  
  real<lower=0> gu;
  real<lower=0> gw;
}
transformed parameters {
  vector[Ncases] yhat;
  real<lower=0> sINT;
  real<lower=0> sSLOPE;
  
  sINT=sqrt(Nid*gw/Ncases);
  sSLOPE=sqrt(NidXstress*gu/Ncases);
  
  for (i in 1:Ncases)
    yhat[i] = b0+age[i]*bAge+stress[i]*bStress+ageXstress[i]*bStressXAge+ w[ID[i]]+u[IDxS[i]];
  
}
model {
  gw ~ inv_gamma(0.5,0.5);
  gu ~ inv_gamma(0.5,0.5);

  w ~ normal(0, sINT);
  u ~ normal(0, sSLOPE);
  
  well_being ~ normal(yhat, sRESID);
  
  target +=-log(sRESID);// prior 1/sRESID
}
