function BelUpdatedFire=detectfire_fuseWeightedAvg(bellow_medium_high,alpha,beta)


for j=1:1000


BelUpdatedFire(1)=0; 
% first order IIR filter

BelUpdatedFire(j+1)=alpha*BelUpdatedFire(j)+beta*(bellow_medium_high(j));

end
plot(BelUpdatedFire,'r');
xlabel('samples');
ylabel('output signal of the EF');
end