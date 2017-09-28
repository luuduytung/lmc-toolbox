function theta0=create_flat_signal(M,lambda)
% Create a flat signal whose coordinates are valued in {-1,1}

random_sample = poissrnd(lambda,1,M);
theta0 = zeros(M,1);
s = 1;
for k=1:length(random_sample)
    if random_sample(k)~=0
        s = -s;
    end
    theta0(k) = s;
end
