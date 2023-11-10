%"C:\Users\nicho\Downloads\crown component_component1 v1_35x26x32.txt"
% Open and read the file
fileID = fopen("filepath",'r');
formatSpec = '%d, %d, %d, %d, %d, %d';
sizeData = [6 Inf];
data = fscanf(fileID, formatSpec, sizeData);
fclose(fileID);

% Separate the coordinates and color values
% Add 1 to the coordinates to shift them from 0-based to 1-based
% k-wave cannot read <= 0
x = data(1,:) + 1;
y = data(2,:) + 1;
z = data(3,:) + 1;

% Find the size of the grid
gridSize = [max(x) max(y) max(z)];

% Create a 3D matrix of zeros
voxelGrid = zeros(gridSize);

% Set the voxels at the positions specified by the points to 1
for i = 1:length(x)
    voxelGrid(x(i), y(i), z(i)) = 1;
end


% Use k-Wave toolbox to visualize voxel grid
voxelPlot(voxelGrid);