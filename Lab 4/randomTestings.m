q1=0.6855;

   q2=[ 0.6855,0.2089];

  q3=[  0.6855,
    0.2089,
    0.4806
];
q4= [ 0.6855,
    0.2089,
    0.4806,
    0.8145
];
 q5=[   0.6855,
    0.2089,
    0.4806,
    0.8145,
    1.0558
];
q6=[ 0.6855,
    0.2089,
    0.4806,
    0.8145,
    1.0558,
   -0.4811];

DHForces = [ 0 400 25 pi/2 ; 0 0 315 0 ; 0 0 35 pi/2 ; 0 365 0 -pi/2 ; 0 0 0 pi/2 ; 0 161.44 0 0 ];
kukaForces=mykuka(DHForces);

q=q3;


 H_current = forwardkuka(q', kukaForces);
 
 
 
 
 