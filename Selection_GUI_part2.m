function [] = Selection_GUI_2()

%% set figure & instructions

H.fig = figure('units','pixels',...
               'position',get(0, 'Screensize'),... ext to modify the response to help simple_gui % [left bottom width height]
               'outerposition', get(0, 'Screensize'),...
               'menubar','none',... %none/figure
               'numbertitle','on',... %off/on
               'name','Selection GUI 2',...
               'resize','on'); %off/on

H.text = uicontrol('style','text',...
                  'units','pixels',...
                  'position',[1600-350 50*11 300 150],... %[left bottom width height]
                  'fontsize',14,...
                  'string','Click on droplets to select, right click to delete selection. Only click on current axis. Press "n" after each sample selection.');
%% set axis

global n;
global i;
global aTopDrops;
global aTopPlots;

aTopDrops = cell(100,n);
aTopPlots = cell(100,n);


if n < 5

    for (i=1:1:n)
        if i == 1
            axes1 = axes('units','pixels',...
                            'position',[10 20+1*400 600 400]); %[left bottom width height]
            set(axes1,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 2
            axes2 = axes('units','pixels',...
                            'position',[10 20+0*400 600 400]); %[left bottom width height]
            set(axes2,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 3
            axes3 = axes('units','pixels',...
                            'position',[10+600 20+1*400 600 400]); %[left bottom width height]
            set(axes3,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        else
            axes4 = axes('units','pixels',...
                            'position',[10+600 20+0*400 600 400]); %[left bottom width height]
            set(axes4,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        end
    end

else

    for (i=1:1:n)
        if i == 1
            axes1 = axes('units','pixels',...
                         'position',[15 20+2*270 405 270]); %[left bottom width height]
            set(axes1,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 2
            axes2 = axes('units','pixels',...
                         'position',[15 20+1*270 405 270]); %[left bottom width height]
            set(axes2,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 3
            axes3 = axes('units','pixels',...
                         'position',[15 20+0*270 405 270]); %[left bottom width height]
            set(axes3,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 4
            axes4 = axes('units','pixels',...
                         'position',[15+405 20+2*270 405 270]); %[left bottom width height]
            set(axes4,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 5
            axes5 = axes('units','pixels',...
                         'position',[15+405 20+1*270 405 270]); %[left bottom width height]
            set(axes5,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 6
            axes6 = axes('units','pixels',...
                         'position',[15+405 20+0*270 405 270]); %[left bottom width height]
            set(axes6,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 7
            axes7 = axes('units','pixels',...
                         'position',[15+405*2 20+2*270 405 270]); %[left bottom width height]
            set(axes7,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        elseif i == 8
            axes8 = axes('units','pixels',...
                         'position',[15+405*2 20+1*270 405 270]); %[left bottom width height]
            set(axes8,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        else
            axes9 = axes('units','pixels',...
                         'position',[15+405*2 20+0*270 405 270]); %[left bottom width height]
            set(axes9,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off
            find_circle(i);
        end
    end
end
%% set other components

h = 1600 - 250 ;

H.start = uicontrol('style','push',...
                  'units','pixels',...
                  'position',[h 50*2 125 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','START');

if n<5
    for(a=1:1:n)
        if a<3
            H.enter(a) = uicontrol('style','edit',...
                                   'units','pixels',...
                                   'position',[h-100 50*11-50*a 120 30],... %[left bottom width height]
                                   'fontsize',14,...
                                   'string','');
        else
            H.enter(a) = uicontrol('style','edit',...
                                   'units','pixels',...
                                   'position',[h + 50 50*11-50*(a-2) 120 30],... %[left bottom width height]
                                   'fontsize',14,...
                                   'string','');
        end
    end
else
    for(a=1:1:n)
        if a<4
            H.enter(a) = uicontrol('style','edit',...
                                   'units','pixels',...
                                   'position',[h-100 50*11-50*(a-1) 100 30],... %[left bottom width height]
                                   'fontsize',14,...
                                   'string','');
        elseif a<7
            H.enter(a) = uicontrol('style','edit',...
                                   'units','pixels',...
                                   'position',[h+10 50*11-50*(a-4) 100 30],... %[left bottom width height]
                                   'fontsize',14,...
                                   'string','');
        else
            H.enter(a) = uicontrol('style','edit',...
                                   'units','pixels',...
                                   'position',[h+120 50*11-50*(a-7) 100 30],... %[left bottom width height]
                                   'fontsize',14,...
                                   'string','');
        end
    end
end
%%%%% set callback %%%%%
if n==1
    set(H.start,'call',{@call_start,H.enter(1)});
elseif n==2
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2)});
elseif n==3
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3)});
elseif n==4
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4)});
elseif n==5
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4),H.enter(5)});
elseif n==6
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4),H.enter(5),H.enter(6)});
elseif n==7
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4),H.enter(5),H.enter(6),H.enter(7)});
elseif n==8
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4),H.enter(5),H.enter(6),H.enter(7),H.enter(8)});
elseif n==9
    set(H.start,'call',{@call_start,H.enter(1),H.enter(2),H.enter(3),H.enter(4),H.enter(5),H.enter(6),H.enter(7),H.enter(8),H.enter(9)});
end
end

%% Used in axis creation to find circle position
function [] = find_circle(index)

global Rmin;
global Rmax;
global i;
global centers_rad;
global circleNum;
global cent;
global rad;
global x; % x will be the "index" which is the axis number of the current run of the function.
global aTopDrops;
global aTopPlots;
global dropWidth;
global dropHeight;
global FinalCirNum;

Rmin = 33; %%%%%%%%%% radius min
Rmax = 48; %%%%%%%%%% radius max
x = index; %current active axis

m{i} = imread(['img',num2str(i),'.JPG']);
[cent, rad] = imfindcircles(m{i},[Rmin Rmax],'ObjectPolarity','bright','sensitivity',0.95,'Method','twostage','EdgeThreshold',0.1);
[circleNum,aa] = size(cent);
cirCountNew = circleNum;
imshow(m{i});
%h = viscircles(cent,rad);

%this value is saved for later use
centers_rad{i} = [cent, rad];

while 1
	[X, Y, buttons] = ginput(1);

%	buttons % used for testing
    dropWidth = 20;  %%%%%%%%%Droplet width 
    dropHeight = 20; %%%%%%%%%Droplet width

    Col = aTopDrops{:,x};
    
    if buttons == 1 %left click
		% begin to mark drops in the top.section
        if(isempty(Col) == 1)
                for circleCounter = 1:circleNum
                  	dropCenterY = floor(cent(circleCounter,2));
					dropCenterX = floor(cent(circleCounter,1));

                    dropBoxX = [dropCenterX-dropWidth dropCenterX-dropWidth dropCenterX+dropWidth dropCenterX+dropWidth dropCenterX-dropWidth];
					dropBoxY = [dropCenterY-dropHeight dropCenterY+dropHeight dropCenterY+dropHeight dropCenterY-dropHeight dropCenterY-dropHeight];
					hold on;
                    hPlotData = plot(dropBoxX, dropBoxY, 'ro--'); % save for removing
					aTopPlots{circleCounter,x} = [aTopPlots{circleCounter,x}; hPlotData];
					aTopDrops{circleCounter,x} = [aTopDrops{circleCounter,x}; dropCenterX, dropCenterY];
                end
        end
			dropCenterY = floor(Y(1));	%center(clicked) of the drop
			dropCenterX = floor(X(1));
		for aDropsCounter = 1:cirCountNew
            if aTopDrops{aDropsCounter,x} > 0
				preDropCenterY = aTopDrops{aDropsCounter,x}(1,2);	%center(read) of the drop
				preDropCenterX = aTopDrops{aDropsCounter,x}(1,1);
				if dropCenterX >= preDropCenterX - dropWidth && dropCenterX <= preDropCenterX + dropWidth &&  dropCenterY >= preDropCenterY - dropHeight && dropCenterY <= preDropCenterY + dropHeight
					dropCenterX = -1;
					dropCenterY = -1;
					break;
				end
            end
        end
        
			if ( dropCenterX > 0)
				dropBoxX = [dropCenterX-dropWidth dropCenterX-dropWidth dropCenterX+dropWidth dropCenterX+dropWidth dropCenterX-dropWidth];
				dropBoxY = [dropCenterY-dropHeight dropCenterY+dropHeight dropCenterY+dropHeight dropCenterY-dropHeight dropCenterY-dropHeight];
				hPlotData = plot(dropBoxX, dropBoxY, 'ro--'); % save for removing
                cirCountNew = cirCountNew + 1;
				aTopPlots{cirCountNew,x} = [aTopPlots{cirCountNew,x}; hPlotData];
                aTopDrops{cirCountNew,x} = [aTopDrops{cirCountNew,x}; dropCenterX, dropCenterY];
			end
		% end of marking drops

	% begin to remove selection, right click
	elseif buttons == 3

			dropCenterY = floor(Y(1));	%center of the drop
			dropCenterX = floor(X(1));
        for aDropsCounter = 1:cirCountNew
            if aTopDrops{aDropsCounter,x} > 0
				preDropCenterY = aTopDrops{aDropsCounter,x}(1,2);	%center(read) of the drop
				preDropCenterX = aTopDrops{aDropsCounter,x}(1,1);
                if dropCenterX >= preDropCenterX - dropWidth && dropCenterX <= preDropCenterX + dropWidth &&  dropCenterY >= preDropCenterY - dropHeight && dropCenterY <= preDropCenterY + dropHeight
					aTopDrops{aDropsCounter,x} = 0; % remove this drop.
					delete(aTopPlots{aDropsCounter,x});
					aTopPlots{aDropsCounter,x} = []; % remove this plot.
                    break;
                end
            end
        end
	% end of removing
	%%%begin elseif103(g) 110(n)
    elseif buttons == 110
        if (isempty(Col) == 1)
            disp(aTopDrops{x});
			continue; % not marked top drops correctly
        else
            FinalCirNum{x} = cirCountNew;
            break
        end
    end
		
end
end


function [] = call_start(object_handle,event,enter_handle,varargin)

global aTopDrops;
global filename;
global directory;
global n; %number entered as total sample number
global dropWidth;
global FinalCirNum;
global slideposition;

PicName = dir([directory '*.JPG']);
L = length(PicName);
disp('Initializing analysis');
sub = 0;


close all;

for c=1:1:n
    
    disp(['Processing sample ', num2str(c)]);
    CurrentCirNum = FinalCirNum{c};
    Fnum(c) = 0; % # of drops that froze

    for k=1:1:L
        img = imread([directory PicName(k).name]);
        sample = img(slideposition(2,c):slideposition(4,c), slideposition(1,c): slideposition(3,c),:);

        for m=1:1:CurrentCirNum
            if aTopDrops{m,c}(1) > 0 %eliminate blank/0 entries
                DropPic = imcrop(sample,[aTopDrops{m,c}(1)-dropWidth aTopDrops{m,c}(2)-dropWidth dropWidth*2 dropWidth*2]);
                mean{m,k,c} = mean2(DropPic);
            else
                mean{m,k,c} = 0; %blank/0 entries gets the mean value of 0
            end
        end 
    end           
    
    
    for k=2:1:L
        
        Fnum = 0;
        mDiff = gsubtract(mean(:,k,c),mean(:,k-1,c));
        
        for m=1:1:CurrentCirNum
        
            if abs(mDiff{m,1})>5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Mean diff value, ajust according to experience
                
                Fnum = Fnum + 1;
                for a=1:1:L
                    mean{m,a,c} = 0;
                end
            end
        end
        
        if Fnum>0
        Fpic = PicName(k).name;
        Fnum;
        disp(Fpic);
        disp(Fnum);
        end
    end
    
    
end
end
