# bff_daily_diary
Software for BFF: Bayesian, Fiducial, Frequentist Analysis of Age Effects in Daily Diary Data

Contains code that generating the results in the paper.

Frequentist: 
The results were generated in SAS. The code is in 
   frequentist models in SAS.sas

Bayesian: 
Bayes factors were computed in Mathematica using one notebook for each stressor
    BayesFactorV5argument.nb
    BayesFactorV5health.nb
    BayesFactorV5home.nb
    BayesFactorV5network.nb
    BayesFactorV5potential_argument.nb
    BayesFactorV5work.nb
    
The credible sets were comupted using R implementation of STAN. 
The file to run:
    BayesCI.R
Uses
    Model0.stan. Model1.stan, Model2.stan, Model3.stan, Model4.stan
    
The fiducial confidence intervals were computed in MATLAB using 
     matlab_code_fiducial.m
     (Requires MATLAB files available at https://hannig.cloudapps.unc.edu//download/LinearMixedModel_MATLAB.zip)
The figures and tables were created using
     matlab_plots.m, matlab_tables.m
All fiducial figures are in 
   GFI_Plots.zip

   
    

