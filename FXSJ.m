clc;
clear;

% 设置Excel文件名和数据起始行
filename = '418-504.xlsx';
data_start_row = 1;

% 读取Excel文件中的数据
[num, txt, raw] = xlsread(filename);

% 提取文件名、变量名和变量值
file_names = raw(data_start_row:end, 1);
variable_names = raw(data_start_row:end, 2);
variable_values = cell2mat(raw(data_start_row:end, 3));

% 处理每一行的数据
variable_meaning = cell(size(variable_names));
for i = 1:length(file_names)
    % 检查变量名，根据不同的变量名执行不同的操作
    if strcmp(variable_names{i}, 'PRCP')
        % 对 Variable 1 的数据执行操作
        variable_meaning{i} = '1小时相对降水';
    elseif strcmp(variable_names{i}, 'PAIR')
        % 对 Variable 2 的数据执行操作
        variable_meaning{i} = '地面气压';
    elseif strcmp(variable_names{i}, 'QAIR')
        % 对 Variable 3 的数据执行操作
        variable_meaning{i} = '比湿';
    elseif strcmp(variable_names{i}, 'SWDN')
        % 对 Variable 4 的数据执行操作
        variable_meaning{i} = '短波辐射';
    elseif strcmp(variable_names{i}, 'TAIR')
        % 对 Variable 5 的数据执行操作
        variable_meaning{i} = '2m气温';
    elseif strcmp(variable_names{i}, 'WIND')
        % 对 Variable 6 的数据执行操作
        variable_meaning{i} = '10m风速';
    elseif strcmp(variable_names{i}, 'TG')
        % 对 Variable 7 的数据执行操作
        variable_meaning{i} = '地表温度';
    elseif strcmp(variable_names{i}, 'SOILLIQ')
        % 对 Variable 8 的数据执行操作
        parts = strsplit(file_names{i}, '-');
        var_name = parts{end-1};  % 获取变量名
        time_str = parts{end};   % 获取时间字符串
        if strcmp(var_name, 'SM000005')
            variable_meaning{i} = '0-5cm土壤湿度';
        elseif strcmp(var_name, 'SM000010')
            variable_meaning{i} = '0-10cm土壤湿度';
        elseif strcmp(var_name, 'SM010040')
            variable_meaning{i} = '10-40cm土壤湿度';
        elseif strcmp(var_name, 'SM040100')
            variable_meaning{i} = '40-100cm土壤湿度';
        elseif strcmp(var_name, 'SM100200')
            variable_meaning{i} = '100-200cm土壤湿度';
        end
     elseif strcmp(variable_names{i}, 'TSOI')
        % 对 Variable 9 的数据执行操作
        parts = strsplit(file_names{i}, '-');
        var_name = parts{end-1};  % 获取变量名
        time_str = parts{end};   % 获取时间字符串
        if strcmp(var_name, 'GST005')
            variable_meaning{i} = '5cm土壤温度';
        elseif strcmp(var_name, 'GST010')
            variable_meaning{i} = '10cm土壤温度';
        elseif strcmp(var_name, 'GST040')
            variable_meaning{i} = '40cm土壤温度';
        elseif strcmp(var_name, 'GST100')
            variable_meaning{i} = '100cm土壤温度';
        elseif strcmp(var_name, 'GST200')
            variable_meaning{i} = '200cm土壤温度';
        end
     elseif strcmp(variable_names{i}, 'RSM')
        % 对 Variable 9 的数据执行操作
        parts = strsplit(file_names{i}, '-');
        var_name = parts{end-1};  % 获取变量名
        time_str = parts{end};   % 获取时间字符串
        if strcmp(var_name, 'RSM000010')
            variable_meaning{i} = '0-10cm土壤相对湿度';
        elseif strcmp(var_name, 'RSM000020')
            variable_meaning{i} = '0-20cm土壤相对湿度';
        elseif strcmp(var_name, 'RSM000050')
            variable_meaning{i} = '0-50cm土壤相对湿度';
        end   
    end
end

% 将文件名、变量名、变量值和变量含义合并为一个cell数组
data = [file_names, variable_names, num2cell(variable_values), variable_meaning];

% 将数据写入Excel文件
xlswrite(filename, data, 'Sheet2', 'A1');
% 显示结果
disp('Data with variable meanings:');
disp(data);




