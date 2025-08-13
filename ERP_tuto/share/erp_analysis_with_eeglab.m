clear
clc

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_biosig('D:\2025-1\ERP\records\record-[2025.08.08-16.20.46].gdf'); % 파일명 수정 필요
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 0,'gui','off'); 
EEG = pop_eegfiltnew(EEG, 'locutoff',0.1,'hicutoff',30,'plotfreqz',1); % Bandpass 0.1-30Hz
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','GDF file BP','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '33025'  }, [-0.2         0.8], 'newname', 'GDF file BP epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','GDF file BP epochs Red','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-0.2 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'setname','GDF file BP epochs Red BR','gui','off'); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'retrieve',2,'study',0); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '33026'  }, [-0.2         0.8], 'newname', 'GDF file BP epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','GDF file BP epochs Yellow','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-0.2 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 5,'setname','GDF file BP epochs Yellow BR','gui','off'); 
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 6,'retrieve',2,'study',0); 
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  '33027'  }, [-0.2         0.8], 'newname', 'GDF file BP epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'setname','GDF file BP epochs Blue','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-0.2 0] ,[]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 7,'setname','GDF file BP epochs Blue BR','gui','off'); 
eeglab redraw;

pop_comperp(ALLEEG)
% 비교 원하는 데이터 셋 입력. ex) 4 6 8