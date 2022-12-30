function q=deltajoint(delta)

kuka=mykuka_search(delta);
   
%--- Calibration Foundings   ----------------------------------------%
    X1=[524.8800  -52.2700   76.1200]';
    X2=[566.7600  139.4700   78.8700]';
    X3=[547.1900 -236.5100   81.4000]';    
    Q1=[-0.1803    0.8835   -0.6137    0.1541    1.3420    0.2838];
    Q2=[0.2578    0.7667   -0.5187         0    1.5755   -0.0002];
    Q3=[-0.4105    0.7817   -0.4531   -0.2716    1.4210   -0.0881];
%-------------------------------------------------------------------%

    H1=forward_kuka(Q1,kuka);
    H2=forward_kuka(Q2,kuka);
    H3=forward_kuka(Q3,kuka);
    
    q=norm(H1(1:3,4)-X1)+norm(H2(1:3,4)-X2)+norm(H3(1:3,4)-X3);
    %q=1;
end