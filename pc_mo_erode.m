function [data_eroded,data_discarted] = pc_mo_erode(data,SE)

% Estimate average distance between points
[~,dists] = knnsearch(data,data,'k',2);
d_d = mean(dists(:,2));

% Prepare variables
Mdl = KDTreeSearcher(data(:,1:3));
data_cell_er = cell(1);
data_cell_n_er = cell(1);

% Scroll points
for i = 1 : length(data)
    % Calculate translation distance
    t = data(i,1:3) - SE(1,:);
    % Apply translation
    SE_data = [SE(2:end,1)+t(1) SE(2:end,2)+t(2) SE(2:end,3)+t(3)]; 
    % Estimate point distances
    [~,dist] = knnsearch(Mdl,SE_data,'k',1);       
    % Check overlap and save
    idx = dist > d_d/1.2; 
    if (sum(idx)) == 0
        data_cell_er{i,1} = data(i,:);
    else
        data_cell_n_er{i,1} = data(i,:);
    end
end

% Save as matrix
data_eroded  = cell2mat(data_cell_er);
data_discarted = cell2mat(data_cell_n_er);

end

