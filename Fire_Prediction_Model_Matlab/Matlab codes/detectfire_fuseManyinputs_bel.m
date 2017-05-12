function [BelUpdatedFire]=detectfire_fuseManyinputs_bel(bellow_medium_hight,bellow_medium_highs,bellow_medium_highc,alpha,beta)


for j=1:1000


BelUpdatedFire(1)=0; 

% first order IIR filter
betax=beta/3;
BelUpdatedFire(j+1)=alpha*BelUpdatedFire(j)+betax*(bellow_medium_hight(j)+bellow_medium_highs(j)+bellow_medium_highc(j));
% PlUpdatedFire(j+1)=alpha*BelUpdatedFire(j)+betax*(pllow_medium_hight(j)+pllow_medium_highs(j)+pllow_medium_highc(j));

end
plot(BelUpdatedFire,'r');
xlabel('samples');
ylabel('output signal of the EF');
end