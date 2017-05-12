function [BelUpdatedFire,PlUpdatedFire,uninput,unoutput,betax,alphax,beta]=firstOrdertimevaryingEvidenceFiltering(belfusefireFinal,plfusefireFinal)


for j=1:1000


BelUpdatedFire(1)=0; 
PlUpdatedFire(1)=0; 
% first order IIR filter
uninput(j)=plfusefireFinal(j)-belfusefireFinal(j);
if(uninput(j)==0)
    betax(j)=0.1;
else

betax(j)=1/(uninput(j));
end


unoutput(j)=PlUpdatedFire(j)-BelUpdatedFire(j);

if(unoutput(j)==0)
    alphax(j)=0.9;
else

alphax(j)=1/(unoutput(j));
end

sum(j)=betax(j)+alphax(j);
if(sum(j)==0)
    beta(j)=0.1;
else

beta(j)=betax(j)/(sum(j));
end

BelUpdatedFire(j+1)=(1-beta(j))*BelUpdatedFire(j)+beta(j)*belfusefireFinal(j);
PlUpdatedFire(j+1)=(1-beta(j))*PlUpdatedFire(j)+beta(j)*plfusefireFinal(j);
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