
cur_dir='/home/yuan/Dropbox/2plate_shell_veri/beamD_irregu_div/cantilever/4andes/shape2/';


div_m =['div1';'div2'; 'div4']  ;

div_str=cellstr(div_m);


% FILE={'side_length_0quarter'; 'side_length_0half';...
%     'side_length_01'; 'side_length_02';...
%     'side_length_05'; 'side_length_10'};
% side_len_str=cellstr(FILE);

brick8= zeros(2,3);

for n_div = 1:3
	% for n_direc = 1:6
		cd (fullfile(cur_dir,div_str{n_div},'fei'))
			brick8(1,n_div)=max(abs(h5read('t_1.h5.feioutput',...
				'/Model/Nodes/Generalized_Displacements')));
			%%%%%%%%
			brick8(2,n_div)=max(abs(h5read('t_2.h5.feioutput',...
				'/Model/Nodes/Generalized_Displacements')));
	% end
end


result_dir='/home/yuan/Dropbox/2plate_shell_veri/results';

cd (result_dir); 

file_out=fopen('shape2_andes4.txt','w');
for n_direc=1:2
	fprintf(file_out,'%18.12f, %18.12f, %18.12f\n',brick8(n_direc,:));
end
fclose(file_out);
     
% format longE
% brick8 
% brick8=fliplr(brick8)
cd (cur_dir)


quit


