function [] = Selection_GUI_1()

%% set figure

H.fig = figure('units','pixels',...
               'position', get(0, 'Screensize'),... ext to modify the response to help simple_gui % [left bottom width height]
               'outerposition', get(0, 'Screensize'),...
               'menubar','none',... %none/figure
               'numbertitle','on',... %off/on
               'name','GUIImageMaskSample',...
               'resize','on'); %off/on

%% set axis

H.img = axes('units','pixels',...
             'position',[20 20 1230 820]); %[left bottom width height]
set(H.img,'xtick',[],'ytick',[])  %Set ticks (numbered ticks on the graph) off

%% set other components

h = 1600 - 250 ;

H.load = uicontrol('style','push',...
                  'units','pixels',...
                  'position',[h 50*5 120 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','LOAD');

H.save = uicontrol('style','push',...
                  'units','pixels',...
                  'position',[h 50*4 120 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','SAVE');

H.text = uicontrol('style','text',...
                  'units','pixels',...
                  'position',[h-35 50*10-30 190 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','Number of Samples');
              
H.enter = uicontrol('style','edit',...
                  'units','pixels',...
                  'position',[h-10 50*10 140 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','');
              
H.selection = uicontrol('style','push',...
                  'units','pixels',...
                  'position',[h-15 50*9-30 150 30],... %[left bottom width height]
                  'fontsize',14,...
                  'string','Start Selection');

%%%%% set callback %%%%%

set(H.load,'call',{@call_load,H});
set(H.save,'call',{@call_save,H});
set(H.enter,'call',{@call_enter,H});
set(H.selection,'call',{@call_selection,H.enter});
end

%% --- Executes on button press of LOAD button.
function [] = call_load(varargin)

%why is this here?
H.load = varargin{3};  % Get the structure. (unessicary as of now)

global filename;
global directory;
[filename, directory] = uigetfile( '*.*', 'Load Image');

global img;
global msk;
global imSize;

img = imread([directory filename]);
imSize = size(img);
msk = zeros(imSize(1),imSize(2),'uint8');
imshow( img );

end


%% --- Executes on button press of Start selection button.
function [] = call_selection(object_handle,event,enter_handle) % Callback for the start selection button.

global n;

str_entered = get(enter_handle, 'string');
n = str2num(str_entered);

%If the number entered is bigger than 9, then display "too many samples"
if n > 9
    set(enter_handle, 'string', 'too many samples');
    return
end


global img;

for(i=1:1:n)
    
    % Use ginput to select corner points of a rectangular
    % region by pointing and clicking the mouse twice
    [X(:,i),Y(:,i)] = ginput(2);
    %X,Y has i columns and 2 lines
    % : means all elements
    
    % Get the x and y corner coordinates as integers
    global slideposition;
    c=1;
    slideposition((c-1)*4+1,i) = floor(X((c-1)*2+1,i)); %xmin
    slideposition((c-1)*4+2,i) = floor(Y((c-1)*2+1,i)); %ymin
    slideposition((c-1)*4+3,i) = ceil(X(c*2,i));   %xmax
    slideposition((c-1)*4+4,i) = ceil(Y(c*2,i));   %ymax
    
   
    global slideX1;
    global slideY1;
    hold on;
    slideX1(i,:) = [slideposition(1,i), slideposition(1,i), slideposition(3,i), slideposition(3,i), slideposition(1,i)];
    slideY1(i,:) = [slideposition(2,i), slideposition(4,i), slideposition(4,i), slideposition(2,i), slideposition(2,i)];
    plot(slideX1(i,:),slideY1(i,:),'r-') 
    
    % Index into the original image to create the new image
    slideNI1{i} = img(slideposition(2,i):slideposition(4,i), slideposition(1,i): slideposition(3,i),:);
 
    % Write image to graphics file. x=
    imwrite(slideNI1{i},['img',num2str(i),'.JPG']) 
    
end
end

%% --- Executes on button press of SAVE button.
function [] = call_save(hObject, eventdata, handles)
% hObject    handle to save button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% close current GUI and open droplet selection GUI
close;
Selection_GUI_2;

end

%% --- Place holder for text edit object
function [] = call_enter(hObject, eventdata, handles)
% hObject    handle to edit textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end