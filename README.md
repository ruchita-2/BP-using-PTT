# Non-Invasive Calculation of Pulse Transit Time Using PPG Signals

Pulse Transit Time (PTT) is the time it takes for the arterial pulse pressure wave to travel between two arterial sites. This project explores a cuffless and non-invasive method for deriving PTT from Photoplethysmogram (PPG) signals, which could potentially contribute to continuous health monitoring solutions for individuals with hypertension and cardiovascular conditions.

## Objectives:

- To develop a non-invasive approach to derive Pulse Transit Time from PPG signals.

## Components Used:

- Arduino UNO board
- HW-827 pulse sensor


## Working Principle:

- The Arduino UNO is connected to the HW-827 pulse sensor. The pulse values are used to plot the PPG waveform. They are initially displayed on the serial plotter of the Arduino UNO. 
- PPG signals are taken from two sites, namely, the wrist and the finger.
- The waveforms thus obtained are further processed and filtered using MATLAB. A combination of a low pass butterworth filter and a notch filter is used for filtering.
- The maximum peaks of each of the respective signals is calculated and the time corresponding to the same is noted. The difference between the two is calculated, which is the Pulse Transit Time.

