function data_dilated = pc_mo_dilate(data_eroded,data_discarted,SE)

% Estimate average distance between points
[~,dists] = knnsearch(data_eroded,data_eroded,'k',2);
d_d = mean(dists(:,2));

% Prepare variables
data_cell_dil = cell(1);
Md2 = KDTreeSearcher(data_discarted(:,1:3));

% Scroll points
for i = 1 : length(data_eroded) 
    % Calculate translation distance
    t = data_eroded(i,1:3) - SE(1,:);
    % Apply translation
    SE_to_data = [SE(2:end,1)+t(1) SE(2:end,2)+t(2) SE(2:end,3)+t(3)];   
    % Detect near point to recover
    Id = rangesearch(Md2,SE_to_data,d_d/1.2);
    % Save id
    data_cell_dil{i,1} = cell2mat(Id')';
end
% Clear repeated points
aux_dil = data_discarted(unique(cell2mat(data_cell_dil)),:);

% Merge
data_dilated = [data_eroded;aux_dil];

end