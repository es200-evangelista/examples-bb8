classdef BB8Graphic < handle
% BB8Graphic is for rendering 3D animated BB8; 
% done this way to try to separate the representation of physics
% and movement from the graphic implementation. 
    
    properties
        world; 
        bb8; 
        ballt;
        ball; 
    end % properties list
    
    methods
        function self = BB8Graphic(world,bb8) 
        % BB8Graphic(world,bb8) constructor
        % @param world is a handle to Axes object 
        % @param bb8 is a BB8 object representing the robot
            self.world = world; 
            self.bb8 = bb8; 
            
            % create homogeneous transform for moving bb8 graphic
            self.ballt = hgtransform;
            self.ballt.Matrix = makehgtform('axisrotate',[0 0 1],0,...
                                            'translate',...
                                            [0 0 self.bb8.D/2]); 
            self.ballt.Parent = world;
            
            % create graphic
            tempfig = figure;
            [X,Y,Z] = sphere; % sphere with 20 nodes
            [img,map] = imread('soccerballtexture.jpg'); % skin
            self.ball = warp(X,Y,Z,img);
            self.ball.Parent = self.ballt;
            close(tempfig);            
        end % BB8Graphic(world,bb8) constructor
        
        function update(self)
            tvec = [self.bb8.x(1) self.bb8.x(2) self.bb8.D/2];
            th = self.bb8.x(3);
            phi = self.bb8.x(4); 
            self.ballt.Matrix = makehgtform('translate',tvec,...
                                            'zrotate',th,...
                                            'yrotate',phi);
        end % BB8Graphic.update(self) method
        
    end % methods

end % BB8Graphic class definition


