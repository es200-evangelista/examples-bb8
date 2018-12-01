classdef KeyboardEmulator < handle
   
    properties
        jlx = 512; %joystick position
        jly = 512;
        jrx = 512;
        jry = 512; 
        btnstate = zeros(1,15);
        btnmap = cell(15,1)
        reload=0;
        upgrade=0;
    end
    
    methods
        function this = KeyboardEmulator(h)
            h.KeyPressFcn = @(src,event)keyPressed(this,src,event);
            h.KeyReleaseFcn = @(src,event)keyReleased(this,src,event);
            for i = 1:15
                this.btnmap{i} = 'empty';
            end
        end
        function keyPressed(this,~,event)
            switch event.Key
                case 'leftarrow'
                    this.jrx = 0;
                case 'rightarrow'
                    this.jrx = 1024;
                case 'uparrow'
                    this.jly = 1024;
                case 'downarrow'
                    this.jly = 0;                   
            end
            for i=1:15
                if strcmp(event.Key,this.btnmap{i})==1
                    this.btnstate(i)=1;
                end
            end
        end
        function keyReleased(this,~,event)
            switch event.Key
                case 'leftarrow'
                    this.jrx = 512;
                case 'rightarrow'
                    this.jrx = 512;
                case 'uparrow'
                    this.jly = 512;
                case 'downarrow'
                    this.jly = 512;                
            end
            for i=1:15
                if strcmp(event.Key,this.btnmap{i})==1
                    this.btnstate(i)=0;
                end
            end
        end
        function mapButton(this,key,button)
            this.btnmap{button}=key;
        end
        function [result] = isPressed(this,key)
            result = this.btnstate(key);
        end
        function update(~)
            %nop, for compatibility with PS3 controller
        end
    end
    
end

