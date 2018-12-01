% soccerballtest.m
% D Evangelista 2018
% draws a sphere with a soccer ball texture on it and then makes it
% spin using a homogeneous transform. 

% close all plots
close all

% create figure
fig = figure(1);
world = axes(fig);
world.DataAspectRatio = [1 1 1]; % sets so that sphere will look spherical
view(3); % sets view so it looks isometric

% create a homogeneous transform object for rotating the ball with
ballt = hgtransform; 
ballt.Parent = world; 
ballt.Matrix = makehgtform('zrotate',0); 

% make sphere geometry
[X,Y,Z] = sphere;

% load image
[balltexture, ballmap] = imread('soccerballtexture.jpg');

% render the ball with the texture map, then parent it to the hgtransform
figure(2)
hball = warp(X,Y,Z,balltexture);
hball.Parent = ballt;
close(2)

% this last bit will rotate the ball at 1 rotation per 4 seconds. 
while(1)
    ballt.Matrix = makehgtform('zrotate',pi/20)*ballt.Matrix;
    pause(0.1);
end
