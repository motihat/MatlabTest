
% TODO - Replace the [] with channel ID to read data from:
readChannelID = 2615509;
% TODO - Enter the Read API Key between the '' below:
readAPIKey = 'NPYSI3IF4JF60BOE';

% TODO - Replace the [] with channel ID to write data to:
writeChannelID = 2615536;
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = 'A23G4L39WKA7QI1M';

%% Read Data %%
data = thingSpeakRead(readChannelID, 'ReadKey', readAPIKey);
%data = thingSpeakRead(readChannelID,'Fields',[1,2,3],NumPoints=1);
%disp(data);
gdd = data(1);
gmm = data(2);
gyy = data(3);

%% Analyze Data %%

if ~libisloaded('hijrilib')
    loadlibrary('hijrilib.so','hijrilib.h');
end
hddPtr = libpointer('int16Ptr',0); 
hmmPtr = libpointer('int16Ptr',0);  
hyyPtr = libpointer('int16Ptr',0);  
gddPtr = libpointer('int16Ptr',0); 
gmmPtr = libpointer('int16Ptr',0);  
gyyPtr = libpointer('int16Ptr',0);  
wkdayPtr = libpointer('int16Ptr',0);  


%libfunctions('hijrilib','-full')
[rc, hdd, hmm, hyy, wkday] = calllib('hijrilib','GetHijriDate',gdd,gmm,gyy,gddPtr,gmmPtr,gyyPtr,wkdayPtr);
%[rc, gdd, gmm, gyy, wkday] = calllib('hijrilib','GetGregorianDate',5,3,1446,gddPtr,gmmPtr,gyyPtr,wkdayPtr);

analyzedData = data;
analyzedData(4)=wkday;
analyzedData(5)=hdd;
analyzedData(6)=hmm;
analyzedData(7)=hyy;

%% Write Data %%
thingSpeakWrite(writeChannelID, analyzedData, 'WriteKey', writeAPIKey);
