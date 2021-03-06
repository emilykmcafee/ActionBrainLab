close all; close all; clc;

[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

sdirs={

% '0051'...
% '0050'...
% '0049'...
% '0048'...
% '0047'...
% '0046'...
% '0045'...
'0044'...
% '0043'...
% '0042'...
% '0041'...
% '0040'...
% '0039'...
% '0038'...
% '0037'...
% '0036'...
% '035'...
% '034'...
% '0033'...
% '0032'...
% '0031'...
% '0030'...
% '0029'...
% '0028'...
% '0027'...
% '0026'...
% '024'...
% '0023'...
% '0022'...
% '0020'...
% '0019'...
% '0018'...
% '0017'...
% '016'...
% '0015'...
% '0014'...
% '0012'...
% '011'...
% '0010'...
% '0009'...
% '0008'...
% '0007'...
% '0006'...
% '0005'...
% '0004'...
% '0003'...
% '0001'
};

nsubjs = size(sdirs,2);

for i = 1:nsubjs, %each subject
    
    this_sdir = sdirs{i};
    disp(['Epoching data for subject ' num2str(i) ': ' this_sdir ]);
    
    
% % % % Epoch R1H and R2H, and remove baseline
STUDY = []; CURRENTSTUDY = 0; ALLEEG = []; EEG=[]; CURRENTSET=[];
EEG = pop_loadset('filename',[sdirs{i} '_filter.set'],'filepath',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' sdirs{i} '/']);
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'R1H'  }, [-1.5         2.5], 'newname', [sdirs{i} '_R1H'], 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' sdirs{i} '/' sdirs{i} '_R1H.set'],'gui','off');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1500 -1000]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 2,'savenew',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' sdirs{i} '/' sdirs{i} '_R1H.set'],'gui','off');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 3,'retrieve',1,'study',0);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'R2H'  }, [-1.5         2.5], 'newname', [sdirs{i} '_R2H'], 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'savenew',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' sdirs{i} '/' sdirs{i} '_R2H.set'],'gui','off');
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-1500 -1000]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 4,'savenew',['/Users/lorna.quandt/Dropbox/ABL/P1/P1_EEG/P1_Datasets/P1_' sdirs{i} '/' sdirs{i} '_R2H.set'],'gui','off');
eeglab redraw;
    
    
end; %end of subject loop

disp('Finished');
