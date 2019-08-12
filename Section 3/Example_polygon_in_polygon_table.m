% Example_polygon_in_polygon_table.m
% Nasser, June 9, 2019
clear;clc
% This code compute the values in Table 2 of the polygon in polygon domain 
% in Section 4.13 of the paper:
% COMPUTATION OF CONFORMAL INVARIANTS
% (see the file: Example_polygon_in_polygon.m)
%
% choose a vector of values for m (number of vertices)
mvc   =  [3,4,5,7,9,15,30].';
for itr=1:length(mvc)
    tic  
    
    nvert      =  mvc(itr);
    vert       =  exp(-i.*[0:2*pi/nvert:2*pi-2*pi/nvert].'); % Vertices of the polygon
    anq        =  0.5;
    n          =  9*5*7*2^7; 
    t          = (0:2*pi/n:2*pi-2*pi/n).';
    %  The parametization of boundaries
    p           =  3;
    [s  , sp  ] = deltw (t , nvert , p);
    for k=1:nvert
        sv{k}  =  s((k-1)*n/nvert+1:k*n/nvert); 
    end
    vert(nvert+1)=vert(1);
    for k=1:nvert
        etv{k}   = vert(k)+(nvert/(2*pi))*(vert(k+1)-vert(k)).*(sv{k}-sv{k}(1));
        etvp{k}  =         (nvert/(2*pi))*(vert(k+1)-vert(k)).*(ones(size(sv{k})));
    end
    for k=1:nvert
        eto((k-1)*n/nvert+1:k*n/nvert,1)    =  etv{k}; 
        etopo((k-1)*n/nvert+1:k*n/nvert,1)  =  etvp{k}; 
    end
    etop         =  sp.*etopo;    
    et(1:n,1)        =  conj(eto);
    etp(1:n,1)       =  conj(etop);
    et(n+1:2*n,1)    =  anq.*eto;
    etp(n+1:2*n,1)   =  anq.*etop;
    alpha            =  0.5*(anq+1);
    z2               =  0;
    
    [~,app_cap(itr,1)] =  annq (et,etp,n,alpha,z2,'b');
    ann_cap(itr,1)     =  2*pi/log(1/anq);
    
    time(itr,1)        =  toc;
end
%%
format long
[mvc  app_cap  time]
%%