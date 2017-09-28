function [thetahat,theta0] = perform_LMC(choice)
% Prepare the required inputs and perform proximal LMC algorithms.


% __________________ Prepare the required inputs __________________________
% Regression vector 
[signal_param,theta0] = regression_vector(choice);
% Analysis operator 
ana_param = analysis_operator(choice.ana_op,signal_param);
% Regression function 
[X,XT] = regression_function(choice.reg_fun,signal_param,ana_param);
% Create regression model
model_param = create_model(theta0,X,XT,choice.reg_fun);
% Posterior parameters
pos_param = posterior_parameters(choice.prior,model_param,ana_param,signal_param);
% LMC Parameters
LMC_param = LMC_parameters(choice.nb_it,choice.Linit,model_param,pos_param);
% Merge parameters
options = merge_structs({signal_param,ana_param,model_param,pos_param,LMC_param});


% ___________________ Perform proximal LMC algorithms _____________________
if (strcmpi(options.prior,'linfty') && strcmpi(options.reg_vect,'flat_signal'))
    thetahat = FBLMC(@nablaL,@proxJ,options);
else
    thetahat = semiFBLMC(@nablaL,@proxJ,options);
end

end




