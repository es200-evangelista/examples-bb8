classdef BB8 < handle
%BB8 is a class for handling a simulation of a spherical robot
    
    properties        
        % state variables
        x; % position is (x,y,theta,phi)
        % kinda lame i shoulda used quaternions
        
        % inputs
        joystick; % es200 PS3Controller or KeyboardEmulator
        u; % input from joystick, consists of wy_r, wz_r
        
        % geometry and physical world
        D; % diameter in meters
        dt; % time step in seconds
    end
    
    methods
        function self = BB8(joystick,dt)
        % BB8(joystick,dt) constructor
        % @param joystick ES200 PS3Controller/KeyboardEmulator
        % @param dt is the timestep in seconds for updates
                        
            self.x = zeros(4,1); % x y theta phi

            self.joystick = joystick;
            self.u = zeros(2,1); % input from joysticks, wy_r, wz_r
            
            self.D = 0.506; % diameter in meters
            self.dt = dt; 
        end % BB8(joystick) constructor
        
        function update(self)
            % update u later
            self.u = 10*([self.joystick.jly; self.joystick.jrx]-512)/512; 
            % u(1) is wy_r, want -1 to 1 
            % u(2) is wz_r, want -1 to 1
            
            th = self.x(3); % th is heading, rotation about z axis
            dxdt = zeros(size(self.x)); 
            
            % vx and vy from Jacobian * v in body fixed frame... 
            dxdt(1) = cos(th)*self.u(1)*self.D/2*2; % not sure why 2 needed here
            dxdt(2) = sin(th)*self.u(1)*self.D/2*2;
            
            dxdt(3) = -self.u(2); % heading change is right stick steering 
            dxdt(4) = self.u(1);  % rolling about y is left stick throttle
            
            % update x using one step of Forward Euler
            self.x = self.x + dxdt * self.dt;
        end % BB8.update(self)
                
    end % methods
    
end % BB8 classdef