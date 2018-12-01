% BB8Sim.m
% D Evangelista, 2018

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
    gamepad.update();
    bb8.update();
    bb8graphic.update(); 
    
    pause(world.UserData.dt);
end

