%MATLAB Code

% Load the first PPG data from the first CSV file
data1 = readtable('C:\data\NewKW.csv');
ppg1 = data1{:, 1};  % PPG signal values

% Load the second PPG data from the second CSV file
data2 = readtable('C:\data\NewKF.csv');
ppg2 = data2{:, 1};  % PPG signal values

% Specify the range of indices for the desired frame
startIndex = 500;   % Starting index of the frame
endIndex = 1000;     % Ending index of the frame

% Extract the specific frame of data for both signals
ppgFrame1 = ppg1(startIndex:endIndex);
ppgFrame2 = ppg2(startIndex:endIndex);

% Generate time values for the frame (assuming a fixed sampling rate)
fs = 500;                               % Sampling frequency (Hz)
timeFrame = (startIndex:endIndex) / fs;

% Define filter parameters for low-pass filtering
cutoffFreqLPF = 10;                      % Cutoff frequency of the low-pass filter (Hz)
filterOrderLPF = 5;                      % Filter order

% Normalize the cutoff frequency based on the sampling frequency
normalizedCutoffFreqLPF = cutoffFreqLPF / (fs / 2);

% Design the low-pass filter
[bLPF, aLPF] = butter(filterOrderLPF, normalizedCutoffFreqLPF, 'low');

% Apply the low-pass filter to the PPG signal frames
filteredPPGFrame1 = filtfilt(bLPF, aLPF, ppgFrame1);
filteredPPGFrame2 = filtfilt(bLPF, aLPF, ppgFrame2);

% Define filter parameters for notch filtering
notchFreq = 50;                          % Frequency of the notch filter (Hz)
Q = 30;                                  % Quality factor of the notch filter

% Calculate normalized notch frequency
normalizedNotchFreq = notchFreq / fs;

% Calculate bandwidth for notch filter
bandwidth = 1 / fs;

% Design the notch filter
[bNotch, aNotch] = iircomb(round(fs/notchFreq), normalizedNotchFreq, 'notch');

% Apply the notch filter to the low-pass filtered PPG signal frames
filteredPPGFrame1 = filtfilt(bNotch, aNotch, filteredPPGFrame1);
filteredPPGFrame2 = filtfilt(bNotch, aNotch, filteredPPGFrame2);

% Find the index and value of the maximum peak in the filtered PPG signals
[maxValue1, maxIndex1] = max(filteredPPGFrame1);
[maxValue2, maxIndex2] = max(filteredPPGFrame2);

% Calculate the corresponding times for the maximum peaks
maxTime1 = timeFrame(maxIndex1);
maxTime2 = timeFrame(maxIndex2);

% Calculate the difference between the maximum peak times
if maxTime2>maxTime1
    timeDifference = maxTime2 - maxTime1;
else
    timeDifference = maxTime1 - maxTime2;
end

% Plot the filtered PPG signal frames
figure;
subplot(2,1,1);
plot(timeFrame, filteredPPGFrame1, 'r', 'LineWidth', 1.5);
hold on;
plot(maxTime1, maxValue1, 'rx', 'MarkerSize', 10, 'LineWidth', 2);  % Mark the maximum peak for signal 1
text(maxTime1, maxValue1, sprintf('Max: %.2f\nTime: %.2f', maxValue1, maxTime1), ...
     'FontSize', 10, 'Color', 'k');
xlabel('Time (s)');
ylabel('PPG Signal (Filtered)');
title('Filtered PPG Signal (Wrist)');
grid on;
set(gca, 'FontSize', 12);

subplot(2,1,2);
plot(timeFrame, filteredPPGFrame2, 'b', 'LineWidth', 1.5);
hold on;
plot(maxTime2, maxValue2, 'bx', 'MarkerSize', 10, 'LineWidth', 2);  % Mark the maximum peak for signal 2
text(maxTime2, maxValue2, sprintf('Max: %.2f\nTime: %.2f', maxValue2, maxTime2), ...
     'FontSize', 10, 'Color', 'k');
xlabel('Time (s)');
ylabel('PPG Signal (Filtered)');
title('Filtered PPG Signal (Finger)');
grid on;
set(gca, 'FontSize', 12);

% Display the time difference between the maximum peaks
disp(['Pulse Transit Time: ' num2str(timeDifference) ' seconds']);


