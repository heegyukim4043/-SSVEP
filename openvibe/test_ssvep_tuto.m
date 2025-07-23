%% path toolbox
addpath('eeglab2022.0');
addpath('fieldtrip-20190618');

%% init toolbox
eeglab; 
ft_defaults;

clc;clear;close all;
%% set param

filt_bps = [1 45];  % band pass filter (Hz)
ch_selection = {'P3','P4','Pz','O1','O2'};  % EEG channels
window_len = [0 3]; % (sec)

event_list = [33025,33026,33027];

% single trial 
% 33025 to 33027 (-1000 ms)  -> 32779 (0 ms,onset-stim) -> 32780 (N ms, rest)
% 33025 [-1000 to 0] 32779 [0 to N] 32780 [N to M]
%% load data

eeg = pop_biosig('test_data_file.gdf'); % load data, input: file name

chan_list = {eeg.chanlocs.labels};
srate = eeg.srate; % sampling rate
event_type = [eeg.event.type];
event_latency = [eeg.event.latency];

for idx_class = 1 : 3
    event_class(idx_class,:) = event_latency(find(event_type==event_list(idx_class)));
end


%% preprocessing
%%% Chan selection
% data_ch_select = eeg.data;
data_ch_select = eeg.data(ismember(chan_list,ch_selection),:); % chan x time

%%% Filter
% data(ch x time), sampling rate, frequency band, filter order, filter type
% filter type: Butterworth filter - 'but', Brickwall filter - 'brickwall'
data_filt = ft_preproc_bandpassfilter(data_ch_select,srate,filt_bps,4,'but'); 

%%% Epoching
% data_ep: ch x time x class x trial
for idx_class = 1 : size(event_class,1)
    for idx_trial = 1 : size(event_class,2)
        window_range = (event_class(idx_class,idx_trial)+srate*1) + [(window_len(1)*srate):(window_len(2)*srate-1)];
        data_ep(:,:,idx_class,idx_trial) = data_filt(:,window_range);   
    end
end

%% FFT Fast Fourier Transform

for idx_class = 1 : size(event_class,1)
    for idx_trial = 1 : size(event_class,2)
        Fs = srate;           % Sampling frequency
        T = 1/Fs;             % Sampling period
        L = size(data_ep,2);  % Length of signal
        t = (0:L-1)*T;        % Time vector
        f = Fs/L*(0:(L/2));   % Frequency vector
        
        X = data_ep(:,:,idx_class,idx_trial); % ch x time
        Y = fft(X,[],2);
        P2 = abs(Y/L);
        P1 = P2(:,1:L/2+1);
        P1(:,2:end-1) = 2*P1(:,2:end-1); % ch x freq
        
        data_fft(:,:,idx_class,idx_trial) = P1; % ch x freq x class x trial
    end
end


%% Plot
str_chan = 'O1';

chan_select_list = chan_list(ismember(chan_list,ch_selection));
figure('Position',[0 0 1920 1080]/2);
for idx_class = 1:size(data_fft,3)
    subplot(3,1,idx_class)
    hold on; 
    plot(f,mean(data_fft((ismember(chan_select_list,str_chan)),:,idx_class,:),4),'r','LineWidth',2);
    for idx_trial = 1: size(data_fft,4)
        plot(f,data_fft((ismember(chan_select_list,str_chan)),:,idx_class,idx_trial),'color',[0.1 0.1 0.1 0.5],'LineWidth',1);
    end
    hold off;
    xlim([filt_bps(1)-1, filt_bps(2)+1]);
%     ylim([0 2]);
    grid;
    xlabel('freq(Hz)');
    ylabel('Amp(uV)');
    title(sprintf('Class: %d,  Chan: %s',idx_class,str_chan));
end   
    