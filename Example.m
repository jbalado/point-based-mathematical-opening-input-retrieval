%% Load data
data = load("cubo3d_RGB.txt");

%% Example for a vertical (Z-oriented) opeining

% SE definition (first point is the Reference point)
SE = [0 0 0; 0 0 -0.1; 0 0 0.1];
SE = SE * 5;

% Erosion
[data_eroded,data_discarted] = pc_mo_erode(data,SE);

dlmwrite("data_eroded.txt",data_eroded,'delimiter',' ','precision',10);
dlmwrite("data_discarted.txt",data_discarted,'delimiter',' ','precision',10);

% Dilation
data_dilated = pc_mo_dilate(data_eroded,data_discarted,SE);

% Export to HDD
dlmwrite("cubo3d_opened_Z.txt",data_dilated,'delimiter',' ','precision',10);


%% Example for a horizontal (X-oriented) opeining

% SE definition (first point is the Reference point)
SE = [0 0 0; -0.3 0 0; 0.3 0 0];

% Erosion
[data_eroded,data_discarted] = pc_mo_erode(data,SE);

dlmwrite("data_eroded.txt",data_eroded,'delimiter',' ','precision',10);
dlmwrite("data_discarted.txt",data_discarted,'delimiter',' ','precision',10);

% Dilation
data_dilated = pc_mo_dilate(data_eroded,data_discarted,SE);

% Export to HDD
dlmwrite("cubo3d_opened_X.txt",data_dilated,'delimiter',' ','precision',10);