# Estimation of Blood Pressure using Pulse Transit Time

Blood pressure is a vital sign that provides important information about the health status of an individual. However, traditional blood pressure measurement techniques may be invasive and uncomfortable, and often require trained medical personnel. This project aims to develop a cuffless and non-invasive method for estimating blood pressure using PPG signals. By providing a non-invasive and continuous monitoring solution, this technology can enhance the quality of care for individuals with hypertension and cardiovascular conditions.


## Objectives:

- To develop a non-invasive method for the calculation of Pulse Transit Time using PPG signals.
- To develop a continuous method of blood pressure monitoring using PPG signals for patients with hypertension or other cardiovascular diseases.
- To develop a predictive model using Pulse Transit Time(PTT) to estimate blood pressure using an existing dataset.

## Components Used:

- Arduino UNO board
- HW-827 pulse sensor


## Working Principle:

- The Arduino UNO is connected to the HW-827 pulse sensor. The pulse values are used to plot the PPG waveform.They are initially displayed on the serial plotter of the Arduino UNO. 
- PPG signals are taken from two sites, namely, the wrist and the finger.
- The waveforms thus obtained are further processed and filtered using MATLAB. A combination of a low pass butterworth filter and a notch filter is used for filtering.
- The maximum peaks of each of the respective signals is calculated and the time corresponding to the same is noted. The difference between the two is calculated, which is the Pulse Transit Time.
- A linear regression model is used for the estimation of blood pressure.
-  A dataset with the values of Systolic and diastolic blood pressures, and Pulse Transit Time (PTT) is used.
- The systolic and diastolic blood pressures are measured using a digital BP machine. A relationship between Pulse Transit Time (PTT) and Blood Pressure is calculated and the future blood pressure values can be predicted using the above.