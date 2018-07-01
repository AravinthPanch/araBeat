%Simple analog display
close all
clear all

%trash any existing analog i/o objects
delete(daqfind);

figure(1)

%Initialize
quitstop = 0;       %flag to exit the loop and exit the figure
index = 400;          %used to keep our position in time (dt*index)
notch = 1;
lowpass_cutoff = 20; %Hz
highpass_cutoff = 1; %Hz
bpmstatic = 0;
bpmstatprev = 80;
bpmmean = 0;
yRange = 1;
pauseb = 0;
threshold = .05;

%define the quitstop button
quitstopbutton=uicontrol('style','pushbutton',...
  'string','Quit', ...
  'fontsize',10, ...
  'position',[450,50,80,20], ...
  'callback', 'quitstop = 1;');

%define the pause button
pausebutton=uicontrol('style','pushbutton',...
  'string','Pause', ...
  'fontsize',10, ...
  'position',[370,50,80,20], ...
  'callback', 'pauseb = 1 - pauseb;');


%threshold
thresholdslider=uicontrol(gcf,...
    'style','slider',...
    'string','threshold',...
    'Min',0,'Max',.5, ...
    'position',[200,330,100,20], ...
    'value',.05,...
    'sliderstep',[1/50 1/50],...
    'backgroundcolor',[0.8 0.8 0.8],...
    'callback', ['threshold = get(thresholdslider, ''value'');',...
        'set(tlh,''ydata'', threshold*ones(1,length(time)));',...
        'set(thresholdsign,''string'',strcat(''threshold = '',num2str(threshold)))']);

    thresholdsign = uicontrol('style','text',...
    'string',strcat('threshold = ',num2str(threshold)),...
    'position',[200,350,100,20]);  

%range
rangeslider=uicontrol(gcf,...
    'style','slider',...
    'string','Y-axis Range',...
    'Min',1,'Max',30, ...
    'position',[90,330,100,20], ...
    'value',10,...
    'sliderstep',[1/29 1/29],...
    'backgroundcolor',[0.8 0.8 0.8],...
    'callback', ['yRange = get(rangeslider, ''value'')/10;',...
        'set(gca,''YLim'', [-yRange/2 yRange]); set(yRangesign,''string'',strcat(''yRange = '',num2str(yRange)))']);
    
yRangesign = uicontrol('style','text',...
    'string',strcat('yRange = ',num2str(yRange)),...
    'position',[90,350,100,20]);   

%define the highpass and lowpass filter cutoff sliders

%highpass
highpassslider=uicontrol(gcf,...
    'style','slider',...
    'string','HP cutoff',...
    'Min',1,'Max',10, ...
    'position',[80,50,100,20], ...
    'value',1,...
    'sliderstep',[1/10 1/10],...
    'backgroundcolor',[0.8 0.8 0.8],...
    'callback', ['highpass_cutoff = round(get(highpassslider, ''value''));',...
        'set(HPsign,''string'', strcat(''HP = '',num2str(highpass_cutoff)))']);

%lowpass
lowpassslider=uicontrol(gcf,...
    'style','slider',...
    'string','HP cutoff',...
    'Min',1,'Max',20, ...
    'position',[200,50,100,20], ...
    'value',20,...
    'sliderstep',[1/20 1/20],...
    'backgroundcolor',[0.8 0.8 0.8],...
    'callback', ['lowpass_cutoff = round(get(lowpassslider, ''value''));',...
        'set(LPsign,''string'', strcat(''LP = '',num2str(lowpass_cutoff)))']);

HPsign = uicontrol('style','text',...
    'string',strcat('HP = ',num2str(highpass_cutoff)),...
    'position',[80,70,80,20]);

LPsign = uicontrol('style','text',...
    'string',strcat('LP = ',num2str(lowpass_cutoff)),...
    'position',[200,70,80,20]);

%Create the text display for BPM and time
bpmsign = uicontrol('style','text',...
    'string','0',...
    'position',[400,350,80,20]);

bpmstaticsign = uicontrol('style','text',...
    'string','0',...
    'position',[320,350,80,20]);


timesign = uicontrol('style','text',...
    'string','0',...
    'position',[400,380,80,20]);


% %define the input
 adaptor = 'nidaq';
 adaptorData = daqhwinfo(adaptor);
% 
% %get the adaptor id, but note that the brackets are curly {}
% %because the struct is an cellarray
 id = adaptorData.InstalledBoardIds{1} ;
% 
% % Create an analog input object with two channels.
 ai = analoginput(adaptor, id);
 set(ai,'inputtype','singleended');
 ch = addchannel(ai, 0);
 set(ai,'SampleRate',1000); %1000 samples per second
 realtime = 100;
 set(ai,'SamplesPerTrigger',realtime);
 set(ai, 'TriggerRepeat', 1);
 set(ai, 'TriggerType', 'Manual');
% Timing
dt = 0.001; %seconds per sample
maxt = 5; %time window size that is displayed
time = 0:dt:maxt;
v = zeros(1, length(time)); %initialize ECG reading

x = []; %initialize x vector for storing time position of heart beats
y = []; %initialize y vector used to display heart beat locations
bpmstring = [80]; %stores all BPM readings on a given run

%build a plot with zero data
hold on
lh = plot(time, zeros(1,length(time)),'r');
plh = plot(time, zeros(1,length(time)),'b');
tlh = plot(time, threshold*ones(1,length(time)),'c:');
hold off

title('ECG reading');
    xlabel('time');         %sets axis and plot titles
    ylabel('voltage');
    
set(gca, 'YLim', [-yRange/2 yRange]);


%and draw it 
drawnow

%set up ai so peekdata can be used consecutively
start(ai); %starts sampling the ai device
trigger(ai); 
getdata(ai,realtime);

pause(1) %delays so the data buffer can be filled
while(quitstop == 0)
    
    tic
    sample = peekdata(ai,realtime); 
    
    %adds new data into the end of the vector allowing for continous view
    if index > length(time)
        v = circshift(v,[0 -length(sample)]);
    end
    
    v(min(index,length(time))-length(sample)+1:min(index,length(time))) = sample;
     
   
    mu2e =.001 ; % LMS convergence parameter
    f = 60.5 ; %notch filter target frequency
    ref = sin(2*pi*f*time);

    %highpass filter
    [b,a] = butter(2, lowpass_cutoff/(200/2));
    sig1 = filter(b, a, v );
    
    %lowpass filter
    [b,a] = butter(2, highpass_cutoff/(200/2),'high');
    sig2 = filter(b, a, sig1 );

    w1 = 0;
    w2 = 0;
    
    %notch filter   
    for i=5:length(time)
        out(i) = sig2(i) -  (w1*ref(i) + w2*ref(i-4)) ; %90 degreee phase shift
        w1 = w1 + mu2e*out(i)*sign(ref(i)) ;
        w2 = w2 + mu2e*out(i)*sign(ref(i-4)) ;
    end
    
    %cuts out transients
    out(1:end - round(length(out)/15)) = out(round(length(out)/15)+1:end);
    out(end - round(length(out)/15):end) = 0;
    out = out*10;
    %pan tompkins
    out2 = out.^2;
    h = ones(1,150);
    h = h/length(h);
    out2 = 10*conv(out2,h,'same');
    out = out.*abs(out);
   
    %finds heartbeats and populates the x and y vectors
    prev = 0;
    x = [];
    for i = 1:length(out2)
       curr = out2(i);
       if prev < threshold && curr >= threshold
          x = [x i*dt];
       end
       prev = curr;
    end

    
    
    %if a heartbeat calculation is outside the reasonable range it is
    %tossed
    if (mod(index*dt,.5) == 0)
        if length(x) < 2
            bpm = 80;
            bpmstatic = 80;
        else
            bpmstatprev = bpmstatic;
            bpmstatic = 60/(x(end)-x(end-1));
            set(bpmstaticsign,'string',num2str(round(bpmstatic)));
        end
        if (abs(bpmstatic - bpmstring(end)) > 25); %if the bpm reading changes
            bpm = bpmstring(end);               %too quickly it is tossed
        else
            bpm = bpmstatic;
        end

        if (bpm > 30 && bpm < 180)
            bpmstring=[bpmstring bpm];
        else
            bpmstring = [bpmstring bpmstring(end)];
        end

        if (length(bpmstring) < 5)
            set(bpmsign,'string',num2str(round(bpm)))
        else
            bpmmean = mean(bpmstring(length(bpmstring)-4:length(bpmstring)));
            set(bpmsign,'string',num2str(round(bpmmean)));
        end
    end
    
    if (pauseb == 0)
        set(lh, 'ydata', out) 
        set(plh, 'ydata', out2) 
    end
    
    set(timesign,'string',num2str(floor(index*dt)))
    
    %increment index
    index = index + length(sample); %sampling 100 points at a time
    pause(dt*length(sample)-toc) %regulates time
end

close all;

delete(ai); %erases the ai device





