function varargout = second(varargin)
% SECOND MATLAB code for second.fig
%      SECOND, by itself, creates a new SECOND or raises the existing
%      singleton*.
%
%      H = SECOND returns the handle to a new SECOND or the handle to
%      the existing singleton*.
%
%      SECOND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SECOND.M with the given input arguments.
%
%      SECOND('Property','Value',...) creates a new SECOND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before second_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to second_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help second

% Last Modified by GUIDE v2.5 14-Apr-2017 02:40:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @second_OpeningFcn, ...
                   'gui_OutputFcn',  @second_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before second is made visible.
function second_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to second (see VARARGIN)

% Choose default command line output for second
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);


x = getappdata(0,'im_value');
%x = 'C:\Users\ravis\Pictures\mahadev-god-wallpaper.jpg';
axis(handles.axes1);
imshow(x,'Parent',handles.axes1);
title(handles.axes1,'Original');
end

% UIWAIT makes second wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = second_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%x = getappdata(0,'im_value_1');
%img = imread(x);

img = getappdata(0,'im_value_1');
A = imnoise(img,'Gaussian',0.04,0.003);
H = fspecial('Gaussian',[9 9],1.76);
GaussF = imfilter(A,H);
axis(handles.axes2);
imshow(GaussF,'Parent',handles.axes2);
title(handles.axes2,'Smoothing');
setappdata(0,'im_value',GaussF);

end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%x = getappdata(0,'im_value_1');
x = getappdata(0,'im_value_1');
b = imsharpen(x);
axis(handles.axes2);
imshow(b,'Parent',handles.axes2);
title(handles.axes2,'Sharpened');
setappdata(0,'im_value',b);


% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
clear all
clc
%x = getappdata(0,'im_value_1');
a = getappdata(0,'im_value_1');
a=double(a);
[row col]=size(a);
h=zeros(1,300);
for n=1:1:row
    for m=1:1:col
        if a(n,m)==0
            a(n,m)=1;
        end
    end
end
for n=1:1:row
    for m=1:1:col
        t=a(n,m);
        h(t)=h(t)+1;
    end
end

figure(2)
bar(h)


end
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%x = getappdata(0,'im_value_1');
x = getappdata(0,'im_value_1');
level = graythresh(x);
segimage = im2bw(x,level);


axis(handles.axes2);
imshow(segimage,'Parent',handles.axes2);
title(handles.axes2,'Segmentation for bad illuminated Image');
setappdata(0,'im_value',segimage);

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
%x = getappdata(0,'im_value_1');
x = getappdata(0,'im_value_1');
y = rgb2gray(x);
equalisedimage = histeq(y);
figure(2)
imhist(equalisedimage);
axis off, axis tight;
title('Histogram of the Equalized Image');



axis(handles.axes2);
imshow(equalisedimage,'Parent',handles.axes2);
title(handles.axes2,'Histogram-Equalized final Image');
setappdata(0,'im_value',equalisedimage);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
%x = getappdata(0,'im_value_1');
myimage = getappdata(0,'im_value_1');

myadjustedimage = imadjust(myimage,stretchlim(myimage),[]);
imshow(myadjustedimage);
setappdata(0,'im_value',myadjustedimage);
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
close(gcbf);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
example;
end
