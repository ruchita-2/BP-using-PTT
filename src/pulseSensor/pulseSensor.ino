//Code on Arduino IDE
//  Variables
int PulseSensorPin = 0;        // Pulse Sensor connected to ANALOG PIN 0

int Signal;                // holds the incoming raw data. Signal value can range from 0-1024
int Threshold = 580;       // Determine which Signal to "count as a beat", and which to ingore.

// The SetUp Function:
void setup() {
  Serial.begin(9600);         // Set's up Serial Communication at certain speed.

}

// The Main Loop Function
void loop() {
  Signal = analogRead(PulseSensorPin);  // Read the PulseSensor's value & assign this value to the "Signal" variable.
  Serial.println(Signal);                    // Send the Signal value to Serial Plotter.
  
}
