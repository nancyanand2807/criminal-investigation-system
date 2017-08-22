function varargout = matchedDetails(varargin)
% MATCHEDDETAILS MATLAB code for matchedDetails.fig
%      MATCHEDDETAILS, by itself, creates a new MATCHEDDETAILS or raises the existing
%      singleton*.
%
%      H = MATCHEDDETAILS returns the handle to a new MATCHEDDETAILS or the handle to
%      the existing singleton*.
%
%      MATCHEDDETAILS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATCHEDDETAILS.M with the given input arguments.
%
%      MATCHEDDETAILS('Property','Value',...) creates a new MATCHEDDETAILS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matchedDetails_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matchedDetails_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matchedDetails

% Last Modified by GUIDE v2.5 14-Apr-2017 02:33:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matchedDetails_OpeningFcn, ...
                   'gui_OutputFcn',  @matchedDetails_OutputFcn, ...
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


% --- Executes just before matchedDetails is made visible.
function matchedDetails_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matchedDetails (see VARARGIN)

% Choose default command line output for matchedDetails
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

test = getappdata(0,'testImage');
axis(handles.axes1);
imshow(test,'Parent',handles.axes1);
title(handles.axes1,'Test');

matched = getappdata(0,'matchedImage');
axis(handles.axes2);
imshow(matched,'Parent',handles.axes2);
title(handles.axes2,'Matched');

cis_id = getappdata(0,'imageID');
set(handles.text14,'string',cis_id);


% database connetion code
conn = database('cis','root','password','com.mysql.jdbc.Driver','jdbc:mysql://localhost:3306/cis');
selectquery = ['SELECT * FROM records where id = ',num2str(cis_id)];
curs = exec(conn,selectquery);
curs = fetch(curs,0);
myData = curs.Data;

set(handles.text3,'string',myData(2));
set(handles.text5,'string',myData(3));
set(handles.text7,'string',myData(4));
set(handles.text9,'string',myData(5));
set(handles.text11,'string',myData(6));




% UIWAIT makes matchedDetails wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = matchedDetails_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function text14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
front;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf);
