% 设置文件夹路径
folder_path = 'D:\兰大参与的项目\媛媛文件\数据\502-504';

% 获取文件夹中的所有nc文件名
file_list = dir(fullfile(folder_path, '*.nc'));

% 创建一个空的元胞数组
data_cell = {};

% 创建 Excel 文件
excel_file = 'data.xlsx';
if exist(excel_file, 'file')
    delete(excel_file);
end

% 循环读取每个nc文件
for i = 1:numel(file_list)
    % 读取nc文件信息

    file_path = fullfile(folder_path, file_list(i).name);
    nc_info = ncinfo(file_path);
    data_cell{end+1, 1} = file_list(i).name;
    data_cell{end, 2} = nc_info.Variables(end).Name;
    
    % 读取最后一个变量数据   如果要读取所有的变量则需要循环
    var_data = ncread(file_path, nc_info.Variables(end).Name);
    data_cell{end, 3} = var_data;

    
end

% disp(data_cell)
% 指定要写入 Excel 文件的文件名和工作表名
filename = '502-504.xlsx';   %注意删除
sheetname = 'Sheet1';

% 将元胞数组写入 Excel 文件中
xlswrite(filename, data_cell, sheetname);
