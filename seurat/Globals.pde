
///////////////////////////////////////////////////////////////////////////
//
//     GLOBAL VARIABLES
//
///////////////////////////////////////////////////////////////////////////

// Serial port
import processing.serial.*;
Serial port;
String USB_PORT = "/dev/tty.usbmodem1411";
String incomingMessage = "";                     // message recieved on serial port
int NFIELDS = 6;                                 // Number of fields in incomingMessage

// Serial protocal exampe: if incomiing message (e.g., produced by Arduino 
// sketch SerialReportor) is "S,4,5,6", then NFIELDS = 3.  The leading "S"
// is htere to confirm that the data is valid.


// Serial data
float colorAngle1, colorAngle2, particleSize, speedRead;  // Analogue: values in range 0..1023.
int switchA,  switchB, switchC;  // Digital.  Values are 0 and 1

// Frames and Controls
JCFrame [] frames;
Control control;
ColorWheel colorWheel1, colorWheel2;
Box colorBox1, colorBox2;
Slider radiusSlider, speedSlider;

// Switches
boolean controlsActive;
boolean acceptText;
boolean acceptFileName;
boolean acceptDisplayString;

// Text 
PFont font;
String typedText = "";
String displayString = "art";
String message = "";
String previousMessage = "";

int count;
String fileName = "frame";

// Display
int HEIGHT = 700; // displayHeight; // 700 for macbook air, 1390 for iMac
float displayScale = HEIGHT/700;


// ARTISTIC PARAMETERS
int NumberOfFrames = 11;
int displayMode = 1;  // 1 for classic, 2 for diagonal 
int NUMBER_OF_PARTICLES = 4  ;  // number of particles in each frame
float MAXRADIUS = 240;
float INITIAL_RADIUS = 24;
float MaxRadius = INITIAL_RADIUS; // 60; // maximum particle radius
float frameAlpha = 7.5;  // increase to decrease persistence of drawing
float baseFrameRate = 30;

// color c1, c2;  // XXX: UNUSED

// CONSTANTS
float inverseGoldenRatio = 0.618;
