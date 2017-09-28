clear all; close all; clc;
addpath('../Utils','../AnalysisOperators','../LMC','../RegressionProblems');
% Goals:
% * Establish the EWA estimators with linfty regularized functions by FBLMC
% algorithm to estimate a flat vector in an overdetermined compressed 
% sensing problems.
% * Reconstruct the numerical results in the figure 6 in the paper.

% ___________________ Establish the EWA estimators ________________________
% Settings:
% * choice.reg_vect: Regression vector. 2 options: 'cameraman' - a close up
% of the image cameraman.tif, and 'flat' - a flat vector whose coordinates
% are valued in {-1,1}.
% * choice.ana_op: Analysis operator. 2 options: 'sep_bloc_diff' - the
% composition of the finite difference and the separator of overlapping
% blocks, and 'id' - the identity matrix.
% * choice.reg_fun: Regression function. 4 options: 'inpainting' - an
% inpainting problem, 'deconvolution' - a deconvolution problem,
% 'compressed_sensing' - a classical compressed sensing problem (with M>n),
% and 'compressed_sensing_overdetermined' - an overdetermined compressed
% sensing problem (with M<n). 
% * choice.prior: priors. 4 options: 'l1' - l1 regularized prior, 'firm' -
% FIRM prior, 'scad' -  SCAD prior, and 'linfty' l_infty prior.
% * nb_it: number of interations which is a postive integer.
% * Linit: initial value l_0 of SDE. [] - unknown.
choice = struct('reg_vect','flat_signal','ana_op','id','nb_it',5e5,'Linit',[]);

choice.prior = 'linfty'; choice.reg_fun = 'compressed_sensing_overdeterminded'; 
[thetahatlinfty_cs,theta0] = perform_LMC(choice);


% _________________ Reconstruct the numerical results _____________________
% Figure 6: CS with EWA-linfty
figure(1); hold on;
stem(thetahatlinfty_cs(:),'black'); stem(theta0(:),'black','*');
axis tight; hold off; 






