function disp_iter(t,d)
% Display the d-th iteration

    if ~mod(t,d) disp(['Iteration = ', num2str(t)])
end