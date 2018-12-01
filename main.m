% bb8.m
% D Evangelista 2018
% spherical robot simulation
% robot is a sphere with a texture that is moved using hgtransforms



% close all plots
close all

% create figure and world
fig = figure(1);
world = axes(fig);
world.DataAspectRatio = [1 1 1]; % sets so that sphere will look spherical
view(3); % sets view so it looks isometric
world.UserData.dt = 0.1;

% instantiate gamepad
% instantiate bb8 

%  main game loop
while(1)
    % update gamepad
    % update bb8
    %ballt.Matrix = makehgtform('zrotate',pi/20)*ballt.Matrix;
    pause(0.1);
end
