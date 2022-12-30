% Arguments for forward function:
% joint = a 6*1 vector containing the six joint angles
% myrobot = the robot structure generated by mypuma560 function

% Return value of forward function:
% H = homogeneous transformation matrix for Frame 6 with respect to Frame 0
%       (encodes info about the end effector)

function H = forwardkuka(joint, myrobot)
        
    
    % Get the number of joint angles
    sz = size(joint,1);
    %disp(size(joint))
    for i = 1:sz
        
        % Get DH parameters for link i
        theta = joint(i);
        link = myrobot.links(i);
        d = link.d;
        a = link.a;
        alpha = link.alpha;
        
        % Construct homogeneous matrix for Frame i with respect to Frame
        % i-1
        homogeneous_matrix = [ cos(theta) -sin(theta)*cos(alpha) sin(theta)*sin(alpha) a*cos(theta) ; 
                        sin(theta) cos(theta)*cos(alpha) -cos(theta)*sin(alpha) a*sin(theta) ;
                        0 sin(alpha) cos(alpha) d ;
                        0 0 0 1 ];
                    
        if i == 1
           % Initialize H
           H = homogeneous_matrix;
        else
            % Update H matrix by premultiplying with the homogenous matrix for
            % Frame i with respect to Frame i-1
            H = H * homogeneous_matrix;
        end
%         disp(H)
    end
    
    
end