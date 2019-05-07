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
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Argument, M4")
s.argument.m4=summary(fit.argument.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.argument.m3=sampling(stan_model3, data = data.argument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.argument.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))+ ggtitle("Argument, M3")
s.argument.m3=summary(fit.argument.m3,
        pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))$summary



######################################################
#potential argument
IDxPArgument=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$potential_argument,drop = TRUE))
n.IDxPArgument=length(unique(IDxPArgument))

data.pargument=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxPArgument,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$potential_argument,ID=ID,IDxS=IDxPArgument)

fit.pargument.m4=sampling(stan_model4, data = data.pargument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.pargument.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Potential Argument, M4")
s.pargument.m4=summary(fit.pargument.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.pargument.m3=sampling(stan_model3, data = data.pargument,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.pargument.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))+ ggtitle("Potential Argument, M3")
s.pargument.m3=summary(fit.pargument.m3,
        pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))$summary

######################################################
#health
IDxHealth=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$health_stress,drop = TRUE))
n.IDxHealth=length(unique(IDxHealth))

data.health=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxHealth,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$health_stress,ID=ID,IDxS=IDxHealth)

fit.health.m4=sampling(stan_model4, data = data.health,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.health.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Health, M4")
s.health.m4=summary(fit.health.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.health.m3=sampling(stan_model3, data = data.health,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.health.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))+ ggtitle("Health, M3")
s.health.m3=summary(fit.health.m3,
        pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))$summary


######################################################
#network
IDxNetwork=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$network,drop = TRUE))
n.IDxNetwork=length(unique(IDxNetwork))

data.network=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxNetwork,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$network,ID=ID,IDxS=IDxNetwork)

fit.network.m4=sampling(stan_model4, data = data.network,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)

plot(fit.network.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Network, M4")
s.network.m4=summary(fit.network.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.network.m3=sampling(stan_model3, data = data.network,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.network.m3,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))+ ggtitle("Network, M3")
s.network.m3=summary(fit.network.m3,
        pars = c("b0","bAge","bStress","sINT","sSLOPE","sRESID"))$summary


######################################################
#work
IDxWork=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$work_stress,drop = TRUE))
n.IDxWork=length(unique(IDxWork))

data.work=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxWork,
                   well_being=NULLEFFECTSDATA$well_being,
                   age=Age,stress=NULLEFFECTSDATA$work_stress,ID=ID,IDxS=IDxWork)

fit.work.m4=sampling(stan_model4, data = data.work,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.work.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Work, M4")
s.work.m4=summary(fit.work.m4,
        pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.work.m1=sampling(stan_model1, data = data.work,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.work.m1,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sRESID"))+ ggtitle("Work, M1")
s.work.m1=summary(fit.work.m1,pars = c("b0","bAge","bStress","sINT","sRESID"))$summary

######################################################
#home
IDxHome=as.numeric(interaction(NULLEFFECTSDATA$ID, NULLEFFECTSDATA$home,drop = TRUE))
n.IDxHome=length(unique(IDxHome))

data.home=list(Ncases=n.cases,Nid=n.ID, NidXstress=n.IDxHome,
               well_being=NULLEFFECTSDATA$well_being,
               age=Age,stress=NULLEFFECTSDATA$home,ID=ID,IDxS=IDxHome)

fit.home.m4=sampling(stan_model4, data = data.home,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m4,show_density=TRUE,
     pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))+ ggtitle("Home, M4")
s.home.m4=summary(fit.home.m4,pars = c("b0","bAge","bStress","bStressXAge","sINT","sSLOPE","sRESID"))$summary

fit.home.m1=sampling(stan_model1, data = data.home, chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m1,show_density=TRUE,
     pars = c("b0","bAge","bStress","sINT","sRESID"))+ ggtitle("Home, M1")
s.home.m1=summary(fit.home.m1,pars = c("b0","bAge","bStress","sINT","sRESID"))$summary

fit.home.m0=sampling(stan_model0, data = data.home,chains=stan_core,cores=stan_core,iter=2*stan_sample_core)
plot(fit.home.m0,show_density=TRUE,
     pars = c("b0","bAge","sINT","sRESID"))+ ggtitle("Home, M0")
s.home.m0=summary(fit.home.m0,pars = c("b0","bAge","sINT","sRESID"))$summary

################Print Results##########################
print('Argument:')
s2.argument.m3=s.argument.m3[,c(1,4,8)]
s2.argument.m3[c(4,5,6),]=s2.argument.m3[c(4,5,6),]^2
print(round(s2.argument.m3,2))

print('Potential Argument:')
s2.pargument.m3=s.pargument.m3[,c(1,4,8)]
s2.pargument.m3[c(4,5,6),]=s2.pargument.m3[c(4,5,6),]^2
print(round(s2.pargument.m3,2))

print('Work')
s2.work.m1=s.work.m1[,c(1,4,8)]
s2.work.m1[c(4,5),]=s2.work.m1[c(4,5),]^2
print(round(s2.work.m1,2))

print('Home')
s2.home.m0=s.home.m0[,c(1,4,8)]
s2.home.m0[c(3,4),]=s2.home.m0[c(3,4),]^2
print(round(s2.home.m0,2))

print('Network')
s2.network.m3=s.network.m3[,c(1,4,8)]
s2.network.m3[c(4,5,6),]=s2.network.m3[c(4,5,6),]^2
print(round(s2.network.m3,2))

print('Health:')
s2.health.m3=s.health.m3[,c(1,4,8)]
s2.health.m3[c(4,5,6),]=s2.health.m3[c(4,5,6),]^2
print(round(s2.health.m3,2))

######################################################
save.image("BayesResults.RData")
