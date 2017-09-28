%clear all; close all; clc;
addpath('../Utils','../AnalysisOperators','../LMC','../RegressionProblems');
% Goals:
% * Establish the EWA estimators with l1, FIRM and SCAD regularized
% functions by SemiFBLMC algorithm to estimate a 2-D image in three 
% numerical problems: Inpainting, deconvolution and compressed sensing.
% * Reconstruct the numerical results in the figures 3, 4 and 5 in the paper.

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
choice = struct('reg_vect','cameraman','ana_op','sep_block_diff','nb_it'...
                ,2e5,'Linit',[]);
choice.theta0 = A;

choice.prior = 'l1';
choice.reg_fun = 'inpainting'; thetahatl1_inp = perform_LMC(choice);
choice.reg_fun = 'deconvolution'; thetahatl1_deconv = perform_LMC(choice);
choice.reg_fun = 'compressed_sensing'; thetahatl1_cs = perform_LMC(choice);

choice.prior = 'firm';
choice.reg_fun = 'inpainting'; thetahatFIRM_inp = perform_LMC(choice);
choice.reg_fun = 'deconvolution'; thetahatFIRM_deconv = perform_LMC(choice);
choice.reg_fun = 'compressed_sensing'; thetahatFIRM_cs = perform_LMC(choice);

choice.prior = 'scad';
choice.reg_fun = 'inpainting'; thetahatSCAD_inp = perform_LMC(choice);
choice.reg_fun = 'deconvolution'; thetahatSCAD_deconv = perform_LMC(choice);
choice.reg_fun = 'compressed_sensing'; thetahatSCAD_cs = perform_LMC(choice);



% _________________ Reconstruct the numerical results _____________________
% Figure 3: CS Impaint Deconv with EWA-l1
figure(1); colormap('gray')
subplot(1,3,[1]); imagesc(thetahatl1_inp); axis image; axis off; h=title('(a)');
subplot(1,3,[2]); imagesc(thetahatl1_cs); axis image; axis off; h=title('(b)');
subplot(1,3,[3]); imagesc(thetahatl1_deconv); axis image; axis off; h=title('(c)');

% Figure 4: CS Impaint Deconv with EWA-FIRM
figure(2); colormap('gray')
subplot(1,3,[1]); imagesc(thetahatFIRM_inp); axis image; axis off; h=title('(a)'); 
subplot(1,3,[2]); imagesc(thetahatFIRM_cs); axis image; axis off; h=title('(b)');
subplot(1,3,[3]); imagesc(thetahatFIRM_deconv); axis image; axis off; h=title('(c)');

% Figure 5: CS Impaint Deconv with EWA-SCAD
figure(3); colormap('gray')
subplot(1,3,[1]); imagesc(thetahatSCAD_inp); axis image; axis off; h=title('(a)'); 
subplot(1,3,[2]); imagesc(thetahatSCAD_cs); axis image; axis off; h=title('(b)');
subplot(1,3,[3]); imagesc(thetahatSCAD_deconv); axis image; axis off; h=title('(c)');

