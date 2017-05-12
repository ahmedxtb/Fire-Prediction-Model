function [BelUpdatedFire,PlUpdatedFire,uninputtin,unoutputtin]=firstOrderEvidenceFiltering(belfusefireFinal,plfusefireFinal,alpha,beta)


for j=1:1000


BelUpdatedFire(1)=0; 
PlUpdatedFire(1)=0; 
uninputtin(j)=plfusefireFinal(j)-belfusefireFinal(j);
unoutputtin(j)=PlUpdatedFire(j)-BelUpdatedFire(j);
% first order IIR filter
BelUpdatedFire(j+1)=alpha*BelUpdatedFire(j)+beta*belfusefireFinal(j);
PlUpdatedFire(j+1)=alpha*PlUpdatedFire(j)+beta*plfusefireFinal(j);
end
plot(BelUpdatedFire,'r');hold;plot(belfusefireFinal);
xlabel('samples');
ylabel('output and input signals of the EF');
% plot(BelUpdatedFire,'r');hold;plot(fire)
% title('1st order time invariant Evidence Filter');
% xlabel('samples');
% ylabel('(BelUpdatedFire and BelFire)');
r=struct('BelUpdatedFire',BelUpdatedFire,'belfusefireFinal',belfusefireFinal);
end