setwd('~/Dropbox/Documents/Research/Shevaun/Null Effects paper/RStan')
rm(list=ls())
#http://www.maths.bath.ac.uk/~jjf23/stan/multilevel.html

library(readr)
NULLEFFECTSDATA <- read_csv("NULLEFFECTSDATA_missingDeleted.csv")

n.cases=length(NULLEFFECTSDATA$ID)
ID=as.numeric(factor(NULLEFFECTSDATA$ID))
n.ID=length(unique(ID))
Age=as.numeric(NULLEFFECTSDATA$age>40)

#stan models
library(rstan)
library(rstanarm)
stan_model4=stan_model(file='Model4.stan')
stan_model3=stan_model(file='Model3.stan')
stan_model1=stan_model(file='Model1.stan')
stan_model0=stan_model(file='Model0.stan')

######################################################
stan_core=8 #4
stan_sample_core=4000 #1000


######################################################
#argument
IDxArgument=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$argument,drop = TRUE))
n.IDxArgument=length(unique(IDxArgument))

data.argument=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxArgument,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$argument,ID=ID,IDxS=IDxArgument)

fit.argument.m4=sampling(stan_model4, data = data.argument, chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.argument.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Argument, M4")
s.argument.m4=summary(fit.argument.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.argument.m3=sampling(stan_model3, data = data.argument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.argument.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))+ ggtitle("Argument, M3")
s.argument.m3=summary(fit.argument.m3,
        pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))$summary


######################################################
#potential argument
IDxPArgument=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$potential_argument,drop = TRUE))
n.IDxPArgument=length(unique(IDxPArgument))

data.pargument=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxPArgument,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$potential_argument,ID=ID,IDxS=IDxPArgument)

fit.pargument.m4=sampling(stan_model4, data = data.pargument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.pargument.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Potential Argument, M4")
s.pargument.m4=summary(fit.pargument.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.pargument.m3=sampling(stan_model3, data = data.pargument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.pargument.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))+ ggtitle("Potential Argument, M3")
s.pargument.m3=summary(fit.pargument.m3,
        pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))$summary

######################################################
#health
IDxHealth=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$health_stress,drop = TRUE))
n.IDxHealth=length(unique(IDxHealth))

data.health=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxHealth,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$health_stress,ID=ID,IDxS=IDxHealth)

fit.health.m4=sampling(stan_model4, data = data.health,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.health.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Health, M4")
s.health.m4=summary(fit.health.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.health.m3=sampling(stan_model3, data = data.health,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.health.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))+ ggtitle("Health, M3")
s.health.m3=summary(fit.health.m3,
        pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))$summary


######################################################
#network
IDxNetwork=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$network,drop = TRUE))
n.IDxNetwork=length(unique(IDxNetwork))

data.network=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxNetwork,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$network,ID=ID,IDxS=IDxNetwork)

fit.network.m4=sampling(stan_model4, data = data.network,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.network.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Network, M4")
s.network.m4=summary(fit.network.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.network.m3=sampling(stan_model3, data = data.network,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.network.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))+ ggtitle("Network, M3")
s.network.m3=summary(fit.network.m3,
        pars = c("b0","bAge","bStress","sRESID","sINT","sSLOPE"))$summary


######################################################
#work
IDxWork=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$work_stress,drop = TRUE))
n.IDxWork=length(unique(IDxWork))

data.work=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxWork,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$work_stress,ID=ID,IDxS=IDxWork)

fit.work.m4=sampling(stan_model4, data = data.work,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.work.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Work, M4")
s.work.m4=summary(fit.work.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.work.m1=sampling(stan_model1, data = data.work,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.work.m1,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT"))+ ggtitle("Work, M1")
s.work.m1=summary(fit.work.m1,pars = c("b0","bAge","bStress","sRESID","sINT"))$summary

######################################################
#home
IDxHome=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$home,drop = TRUE))
n.IDxHome=length(unique(IDxHome))

data.home=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxHome,
               well_being=NULLEFFECTSDATA$well_being,
               age=Age,stress=NULLEFFECTSDATA$home,ID=ID,IDxS=IDxHome)

fit.home.m4=sampling(stan_model4, data = data.home,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))+ ggtitle("Home, M4")
s.home.m4=summary(fit.home.m4,pars = c("b0","bAge","bStress","bStressXAge","sRESID","sINT","sSLOPE"))$summary

fit.home.m0=sampling(stan_model0, data = data.home,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m0,show_density=TRUE,
     pars = c("b0","bAge","sRESID","sINT"))+ ggtitle("Home, M0")
s.home.m0=summary(fit.home.m0,pars = c("b0","bAge","sRESID","sINT"))$summary

fit.home.m1=sampling(stan_model1, data = data.home, chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m1,show_density=TRUE,
     pars = c("b0","bAge","bStress","sRESID","sINT"))+ ggtitle("Home, M1")
s.home.m1=summary(fit.home.m1,pars = c("b0","bAge","bStress","sRESID","sINT"))$summary

######################################################
save.image("BayesResults")
