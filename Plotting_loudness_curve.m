%================= plotting loudness curve ==================%
% NaN values have been replced with the nanvalue
% hearing threshold loudness level has been marked
for i = 1:4
    nanvalue = -2.5;
    subplot(2,1,1);
    loudness_data = readtable(['N',num2str(i),'_LoudnessData_F1.txt'],Delimiter='/t');
    loudness_data_ = table2array(loudness_data);
    no_nans = sum(isnan(loudness_data_(:,[2])));
    index = no_nans+1;
    required_data = loudness_data_(:,[1 3]);
    required_data(isnan(required_data))=nanvalue;
    plot(required_data(:,[1]),required_data(:,2),'o-','MarkerFaceColor','red','MarkerEdgeColor','red','MarkerIndices',index);
    title(['Loudness Curve F1 N',num2str(i)]);
    xlabel('Loudness Level');
    ylabel('');
    subplot(2,1,2);
    loudness_data = readtable(['N',num2str(i),'_LoudnessData_F4.txt'],Delimiter='/t');
    loudness_data_ = table2array(loudness_data);
    no_nans = sum(isnan(loudness_data_(:,[2])));
    index = no_nans+1;
    required_data = loudness_data_(:,[1 3]);
    required_data(isnan(required_data))=nanvalue;
    plot(required_data(:,[1]),required_data(:,2),'o-','MarkerFaceColor','red','MarkerEdgeColor','red','MarkerIndices',index);
    title(['Loudness Curve F4 N',num2str(i)]);
    xlabel('Loudness Level');
    ylabel('');
    legend('Threshold');
    savefig(['N',num2str(i),'_Loudness_Growth']);
end
%============================================================