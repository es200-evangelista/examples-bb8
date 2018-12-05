% BB8Sim.m
% D Evangelista, 2018
% This code does a low budget simulation of BB-8 from Star Wars. 
% The dynamics / physics are contained in a BB8 object; rendering
% is accomplished with a separate BB8Graphic object. This code
% is meant to illustrate (1) use of classes; (2) separating the
% physics and graphics; (3) use of homogeneous transforms; (4) 
% equations of motion and Jacobian for a simple two wheel robot;
% and (5) how to use textures mapped onto a mesh for 3D graphics. 

close all

% create figure and world
fig = figure(1);
world = axes(fig); 
world.XLim = [-10 10];
world.YLim = [-10 10];
world.ZLim = [-0.5 1.5];
world.DataAspectRatio = [1 1 1];
world.UserData.dt = 0.02; 
%view(2);
view(3);
grid on
htitle = title(world,'Low Budget USNA Virtual BB-8');

% instantiate joystick, bb8,
gamepad = KeyboardEmulator(fig); 
% gamepad = PS3Controller('COM9'); % uncomment to use joystick
bb8 = BB8(gamepad,world.UserData.dt); % bb8 mechanics simulation
bb8graphic = BB8Graphic(world,bb8);  % bb8 graphics driven by sim

% main game loop here
while(1)
    % looks simpler when you use abstractions; no monster main!
    gamepad.update(); % update the controls
    
    bb8.update(); % update the bb8 physics model
    bb8graphic.update(); % update the graphics
    
    pause(world.UserData.dt); % this controls loop execution time
end

% TODO
% make camera move to point at BB-8 (independent of physics)
% add hemisphere top to BB-8 model (independent of physics)

