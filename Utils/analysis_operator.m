function ana_param = analysis_operator(ana_op,signal_param)
% Define analysis_operator

stheta0 = signal_param.stheta0;
if (strcmpi(ana_op,'sep_block_diff'))
    size_sep_block = 64;
    D = @(x) sep_block(dif(x),size_sep_block,stheta0(1));
    DT = @(x) difT(sep_blockT(x,size_sep_block,stheta0(1))); 
    r = rand(stheta0); Dr =  D(r);
    sDtheta0 = size(Dr); P = numel(Dr);
    G = 2; L = floor(P/G);
    ana_param = struct('D',D,'DT',DT,'sDtheta0',sDtheta0,'P',P,'G',G,'L',L);
elseif (strcmpi(ana_op,'id'))
    D = @(x) x;
    sDtheta0 = stheta0; P = signal_param.M;
    G = 1; L = P;
    ana_param = struct('D',D,'DT',D,'Dinv',D,'sDtheta0',sDtheta0,'P',P,'G',G,'L',L);
else
    error('Unknown choice of analysis operator')
end


end