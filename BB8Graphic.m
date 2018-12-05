classdef BB8Graphic < handle
% BB8Graphic is for rendering 3D animated BB8; 
% done this way to try to separate the representation of physics
% and movement from the graphic implementation. 
    
    properties
        world; % axes containing the plot
        bb8; % link to the bb8 physics model
        ballt; % homogeneous transform (hgtransform) object 
        ball; % handle to the ball mesh surface
    end % properties list
    
    methods
        function self = BB8Graphic(world,bb8) 
        % BB8Graphic(world,bb8) constructor
        % @param world is a handle to Axes object 
        % @param bb8 is a BB8 object representing the robot
            self.world = world; 
            self.bb8 = bb8; 
            
            % create homogeneous transform for moving bb8 graphic
            % remember homogeneous coordinates are x y z 1... 
            % the transform matrices are 4x4 and can handle things
            % like rotation and translation (affine transformation) 
            self.ballt = hgtransform;
            % initially zero rotation and height z=D/2
            self.ballt.Matrix = makehgtform('axisrotate',[0 0 1],0,... 
                                            'translate',...
                                            [0 0 self.bb8.D/2]); 
            self.ballt.Parent = world; % hgtransform is child of
                                       % root world axes
            
            % create graphic
            tempfig = figure;
            [X,Y,Z] = sphere; % sphere with 20 x 20 points
            [img,map] = imread('soccerballtexture.jpg'); % skin
            self.ball = warp(X,Y,Z,img); % create mesh with texture mapping
            self.ball.Parent = self.ballt; % mesh is child of hgtransform
            close(tempfig);            
        end % BB8Graphic(world,bb8) constructor
        
        function update(self)
        % BB8Graphic.update() updates the BB-8 graphic based on the
        % current state of its BB-8 physics model
            
            % bb8.x state is [x y th phi]
            tvec = [self.bb8.x(1) self.bb8.x(2) self.bb8.D/2];
            th = self.bb8.x(3);
            phi = self.bb8.x(4); 
            
            % update the homogeneous transform accordingly 
            self.ballt.Matrix = makehgtform('translate',tvec,...
                                            'zrotate',th,...
                                            'yrotate',phi);
        end % BB8Graphic.update(self) method
        
    end % methods

end % BB8Graphic class definition


