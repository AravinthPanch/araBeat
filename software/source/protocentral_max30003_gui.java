import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import g4p_controls.*; 
import processing.serial.*; 
import grafica.*; 
import java.awt.*; 
import javax.swing.*; 
import static javax.swing.JOptionPane.*; 
import javax.swing.JFileChooser; 
import java.io.FileWriter; 
import java.io.BufferedWriter; 
import java.util.Date; 
import java.text.DateFormat; 
import java.text.SimpleDateFormat; 
import java.math.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class protocentral_max30003_gui extends PApplet {

//////////////////////////////////////////////////////////////////////////////////////////
//
//   Desktop GUI for controlling the HealthyPi HAT [ Patient Monitoring System]
//
//   Copyright (c) 2016 ProtoCentral
//   
//   This software is licensed under the MIT License(http://opensource.org/licenses/MIT). 
//   
//   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT 
//   NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
//   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
//   WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
//   SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//   Requires g4p_control graphing library for processing.  Built on V4.1
//   Downloaded from Processing IDE Sketch->Import Library->Add Library->G4P Install
//
/////////////////////////////////////////////////////////////////////////////////////////

                       // Processing GUI Library to create buttons, dropdown,etc.,
                  // Serial Library


// Java Swing Package For prompting message




// File Packages to record the data into a text file




// Date Format




// General Java Package


/************** Packet Validation  **********************/
private static final int CESState_Init = 0;
private static final int CESState_SOF1_Found = 1;
private static final int CESState_SOF2_Found = 2;
private static final int CESState_PktLen_Found = 3;

/*CES CMD IF Packet Format*/
private static final int CES_CMDIF_PKT_START_1 = 0x0A;
private static final int CES_CMDIF_PKT_START_2 = 0xFA;
private static final int CES_CMDIF_PKT_STOP = 0x0B;

/*CES CMD IF Packet Indices*/
private static final int CES_CMDIF_IND_LEN = 2;
private static final int CES_CMDIF_IND_LEN_MSB = 3;
private static final int CES_CMDIF_IND_PKTTYPE = 4;
private static int CES_CMDIF_PKT_OVERHEAD = 5;

/************** Packet Related Variables **********************/

int ecs_rx_state = 0;                                        // To check the state of the packet
int CES_Pkt_Len;                                             // To store the Packet Length Deatils
int CES_Pkt_Pos_Counter, CES_Data_Counter;                   // Packet and data counter
int CES_Pkt_PktType;                                         // To store the Packet Type

char CES_Pkt_Data_Counter[] = new char[1000];                // Buffer to store the data from the packet
char ces_pkt_ecg_bytes[] = new char[4];                    // Buffer to hold ECG data
char ces_pkt_rtor_bytes[] = new char[4];                   // Respiration Buffer
char ces_pkt_hr_bytes[] = new char[4];                // Buffer for SpO2 IR

int pSize = 1500;                                            // Total Size of the buffer
int arrayIndex = 0;                                          // Increment Variable for the buffer
float time = 0;                                              // X axis increment variable

// Buffer for ecg,spo2,respiration,and average of thos values
float[] xdata = new float[pSize];
float[] ecgdata = new float[pSize];
float[] bpmArray = new float[pSize];
float[] ecg_avg = new float[pSize];                          


/************** Graph Related Variables **********************/

double maxe, mine, maxr, minr, maxs, mins;             // To Calculate the Minimum and Maximum of the Buffer
double ecg, rtor_value, hr;  // To store the current ecg value
double respirationVoltage=20;                          // To store the current respiration value
boolean startPlot = false;                             // Conditional Variable to start and stop the plot

GPlot plotECG;

int step = 0;
int stepsPerCycle = 100;
int lastStepTime = 0;
boolean clockwise = true;
float scale = 5;

/************** File Related Variables **********************/

boolean logging = false;                                // Variable to check whether to record the data or not
FileWriter output;                                      // In-built writer class object to write the data to file
JFileChooser jFileChooser;                              // Helps to choose particular folder to save the file
Date date;                                              // Variables to record the date related values                              
BufferedWriter bufferedWriter;
DateFormat dateFormat;

/************** Port Related Variables **********************/

Serial port = null;                                     // Oject for communicating via serial port
String[] comList;                                       // Buffer that holds the serial ports that are paired to the laptop
char inString = '\0';                                   // To receive the bytes from the packet
String selectedPort;                                    // Holds the selected port number

/************** Logo Related Variables **********************/

PImage logo;
boolean gStatus;                                        // Boolean variable to save the grid visibility status

int nPoints1 = pSize;
int totalPlotsHeight=0;
int totalPlotsWidth=0;

public void setup() 
{
  println(System.getProperty("os.name"));
  
  GPointsArray pointsECG = new GPointsArray(nPoints1);

  
  //fullScreen();
  /* G4P created Methods */
  createGUI();
  customGUI();
  
  totalPlotsHeight=height-50-68-15;

  plotECG = new GPlot(this);
  plotECG.setPos(0,170);
  plotECG.setDim(width, (totalPlotsHeight*0.75f)-10);
  plotECG.setBgColor(0);
  plotECG.setBoxBgColor(0);
  plotECG.setLineColor(color(0, 255, 0));
  plotECG.setLineWidth(3);
  plotECG.setMar(0,0,0,0);
  
  for (int i = 0; i < nPoints1; i++) 
  {
    pointsECG.add(i,0);
  }

  plotECG.setPoints(pointsECG);

  /*******  Initializing zero for buffer ****************/

  for (int i=0; i<pSize; i++) 
  {
    ecgdata[i] = 0;
  }
  time = 0;
}

public void draw() 
{
  background(0);
  GPointsArray pointsECG = new GPointsArray(nPoints1);

  if (startPlot)                             // If the condition is true, then the plotting is done
  {
    for(int i=0; i<nPoints1;i++)
    {    
      pointsECG.add(i,ecgdata[i]);
    }
  } 

  plotECG.setPoints(pointsECG);
  
  plotECG.beginDraw();
  plotECG.drawBackground();
  plotECG.drawLines();
  plotECG.endDraw();
  
  pushStyle();
  noStroke();
  fill(255, 255, 255);
  rect(0, 0, width, 60);
  popStyle();
}

/*********************************************** Opening Port Function ******************************************* **************/

public void startSerial()
{
  try
  {
    port = new Serial(this, selectedPort, 115200);
    port.clear();
    startPlot = true;
  }
  catch(Exception e)
  {

    showMessageDialog(null, "Port is busy", "Alert", ERROR_MESSAGE);
    System.exit (0);
  }
}

/*********************************************** Serial Port Event Function *********************************************************/

///////////////////////////////////////////////////////////////////
//
//  Event Handler To Read the packets received from the Device
//
//////////////////////////////////////////////////////////////////

public void serialEvent (Serial blePort) 
{
  inString = blePort.readChar();
  pc_processData(inString);
}

/*********************************************** Getting Packet Data Function *********************************************************/

///////////////////////////////////////////////////////////////////////////
//  
//  The Logic for the below function :
//      //  The Packet recieved is separated into header, footer and the data
//      //  If Packet is not received fully, then that packet is dropped
//      //  The data separated from the packet is assigned to the buffer
//      //  If Record option is true, then the values are stored in the text file
//
//////////////////////////////////////////////////////////////////////////

public void pc_processData(char rxch)
{
  switch(ecs_rx_state)
  {
  case CESState_Init:
    if (rxch==CES_CMDIF_PKT_START_1)
      ecs_rx_state=CESState_SOF1_Found;
    break;

  case CESState_SOF1_Found:
    if (rxch==CES_CMDIF_PKT_START_2)
      ecs_rx_state=CESState_SOF2_Found;
    else
      ecs_rx_state=CESState_Init;                    //Invalid Packet, reset state to init
    break;

  case CESState_SOF2_Found:
    ecs_rx_state = CESState_PktLen_Found;
    CES_Pkt_Len = (int) rxch;
    CES_Pkt_Pos_Counter = CES_CMDIF_IND_LEN;
    CES_Data_Counter = 0;
    break;

  case CESState_PktLen_Found:
    CES_Pkt_Pos_Counter++;
    if (CES_Pkt_Pos_Counter < CES_CMDIF_PKT_OVERHEAD)  //Read Header
    {
      if (CES_Pkt_Pos_Counter==CES_CMDIF_IND_LEN_MSB)
        CES_Pkt_Len = (int) ((rxch<<8)|CES_Pkt_Len);
      else if (CES_Pkt_Pos_Counter==CES_CMDIF_IND_PKTTYPE)
        CES_Pkt_PktType = (int) rxch;
    } else if ( (CES_Pkt_Pos_Counter >= CES_CMDIF_PKT_OVERHEAD) && (CES_Pkt_Pos_Counter < CES_CMDIF_PKT_OVERHEAD+CES_Pkt_Len+1) )  //Read Data
    {
      if (CES_Pkt_PktType == 2)
      {
        CES_Pkt_Data_Counter[CES_Data_Counter++] = (char) (rxch);          // Buffer that assigns the data separated from the packet
      }
    } else  //All  and data received
    {
      if (rxch==CES_CMDIF_PKT_STOP)
      { 
        ces_pkt_ecg_bytes[0] = CES_Pkt_Data_Counter[0];
        ces_pkt_ecg_bytes[1] = CES_Pkt_Data_Counter[1];
        ces_pkt_ecg_bytes[2] = CES_Pkt_Data_Counter[2];
        ces_pkt_ecg_bytes[3] = CES_Pkt_Data_Counter[3];

        ces_pkt_rtor_bytes[0] = CES_Pkt_Data_Counter[4];
        ces_pkt_rtor_bytes[1] = CES_Pkt_Data_Counter[5];
        ces_pkt_rtor_bytes[2] = CES_Pkt_Data_Counter[6];
        ces_pkt_rtor_bytes[3] = CES_Pkt_Data_Counter[7];

        ces_pkt_hr_bytes[0] = CES_Pkt_Data_Counter[8];
        ces_pkt_hr_bytes[1] = CES_Pkt_Data_Counter[9];
        ces_pkt_hr_bytes[2] = CES_Pkt_Data_Counter[10];
        ces_pkt_hr_bytes[3] = CES_Pkt_Data_Counter[11];

        int data1 = ecsParsePacket(ces_pkt_ecg_bytes, ces_pkt_ecg_bytes.length-1);
        ecg = (double) data1/(Math.pow(10, 3));
        
        int data2 = ecsParsePacket(ces_pkt_rtor_bytes, ces_pkt_rtor_bytes.length-1);
        rtor_value = (double) data2; ///(Math.pow(10, 3));

        int data3 = ecsParsePacket(ces_pkt_hr_bytes, ces_pkt_hr_bytes.length-1);
        hr = (double) data3; ///(Math.pow(10, 3));
        
        // Assigning the values for the graph buffers

        time = time+1;
        xdata[arrayIndex] = time;
        
        textSize(24);
        lbl_rtor.setText(""+rtor_value);
        lbl_hr.setText(hr+"");
        
        ecgdata[arrayIndex] = (float)ecg;

        arrayIndex++;
        
        if (arrayIndex == pSize)
        {  
          arrayIndex = 0;
          time = 0;          
        }       

        // If record button is clicked, then logging is done

        if (logging == true)
        {
          try {
            date = new Date();
            dateFormat = new SimpleDateFormat("HH:mm:ss");
            bufferedWriter.write(dateFormat.format(date)+","+ecg+","+rtor_value+","+hr);
            bufferedWriter.newLine();
          }
          catch(IOException e) {
            println("It broke!!!");
            e.printStackTrace();
          }
        }
        ecs_rx_state=CESState_Init;
      } else
      {
        ecs_rx_state=CESState_Init;
      }
    }
    break;

  default:
    break;
  }
}

/*********************************************** Recursion Function To Reverse The data *********************************************************/

public int ecsParsePacket(char DataRcvPacket[], int n)
{
  if (n == 0)
    return (int) DataRcvPacket[n]<<(n*8);
  else
    return (DataRcvPacket[n]<<(n*8))| ecsParsePacket(DataRcvPacket, n-1);
}

/********************************************* User-defined Method for G4P Controls  **********************************************************/

///////////////////////////////////////////////////////////////////////////////
//
//  Customization of controls is done here
//  That includes : Font Size, Visibility, Enable/Disable, ColorScheme, etc.,
//
//////////////////////////////////////////////////////////////////////////////

public void customGUI() 
{  
  comList = port.list();
  String comList1[] = new String[comList.length+1];
  comList1[0] = "SELECT THE PORT";
  for (int i = 1; i <= comList.length; i++)
  {
    comList1[i] = comList[i-1];
  }
  comList = comList1;
  portList.setItems(comList1, 0);
  //done.setVisible(false);
}

/*************** Function to Calculate Average *********************/

public double averageValue(float dataArray[])
{

  float total = 0;
  for (int i=0; i<dataArray.length; i++)
  {
    total = total + dataArray[i];
  }
  return total/dataArray.length;
}
/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void portList_click(GDropList source, GEvent event) { //_CODE_:portList:640344:
  //println("portList - GDropList >> GEvent." + event + " @ " + millis());
  selectedPort = portList.getSelectedText();
  startSerial();
} //_CODE_:portList:640344:

public void record_click(GButton source, GEvent event) { //_CODE_:record:731936:
  //println("record - GButton >> GEvent." + event + " @ " + millis());
  ////////////////////////////////////////////////////////////////////////////////
  //
  //    Enable the buttons and calls the serial port function
  //    Comselect is made true to call the serial function
  //  
  ///////////////////////////////////////////////////////////////////////////////
  try
  {
    jFileChooser = new JFileChooser();
    jFileChooser.setSelectedFile(new File("log.csv"));
    jFileChooser.showSaveDialog(null);
    String filePath = jFileChooser.getSelectedFile()+"";

    if ((filePath.equals("log.txt"))||(filePath.equals("null")))
    {
    } else
    {    
 //     done.setVisible(true);
      record.setVisible(false);
      close.setEnabled(false);
      close.setLocalColorScheme(GCScheme.CYAN_SCHEME);
      logging = true;
      date = new Date();
      output = new FileWriter(jFileChooser.getSelectedFile(), true);
      bufferedWriter = new BufferedWriter(output);
      bufferedWriter.write(date.toString()+"");
      bufferedWriter.newLine();
      bufferedWriter.write("TimeStramp,ECG,SpO2,Respiration");
      bufferedWriter.newLine();
    }
  }
  catch(Exception e)
  {
    println("File Not Found");
  }
} //_CODE_:record:731936:

public void close_click(GButton source, GEvent event) { //_CODE_:close:222350:
  //println("close - GButton >> GEvent." + event + " @ " + millis());
  int dialogResult = JOptionPane.showConfirmDialog (null, "Would You Like to Close The Application?");
  if (dialogResult == JOptionPane.YES_OPTION) {
    try
    {
      //Runtime runtime = Runtime.getRuntime();
      //Process proc = runtime.exec("sudo shutdown -h now");
      System.exit(0);
    }
    catch(Exception e)
    {
      exit();
    }
  } else
  {
  }
} //_CODE_:close:222350:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:665258:
  println("imgButton1 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton1:665258:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Healthy Pi");
  portList = new GDropList(this, 5, 7, 200, 385, 10);
  portList.setItems(loadStrings("list_640344"), 0);
  portList.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  portList.addEventHandler(this, "portList_click");
  record = new GButton(this, 236, 7, 100, 40);
  record.setText("RECORD");
  record.setTextBold();
  record.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  record.addEventHandler(this, "record_click");
  close = new GButton(this, 347, 7, 100, 40);
  close.setText("CLOSE");
  close.setTextBold();
  close.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  close.addEventHandler(this, "close_click");
  imgButton1 = new GImageButton(this, 488, 3, 277, 48, new String[] { "logo.png", "logo.png", "logo.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  lbl_hr = new GLabel(this, 542, 144, 250, 58);
  lbl_hr.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_hr.setText("---");
  lbl_hr.setTextBold();
  lbl_hr.setOpaque(false);
  lbl_hr.setFont(new Font("Monospaced", Font.PLAIN, 22));
  lbl_hr.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  lbl_rtor = new GLabel(this, 543, 79, 250, 62);
  lbl_rtor.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_rtor.setText("---");
  lbl_rtor.setTextBold();
  lbl_rtor.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  lbl_rtor.setOpaque(false);
  lbl_rtor.setFont(new Font("Monospaced", Font.PLAIN, 22));
  label11 = new GLabel(this, 591, 80, 177, 20);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label11.setText("R - R Interval (ms)");
  label11.setTextBold();
  label11.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label11.setOpaque(false);
  label11.setFont(new Font("Arial", Font.PLAIN, 14));
  label1 = new GLabel(this, 592, 145, 166, 18);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Heart Rate (BPM)");
  label1.setOpaque(false);
  label1.setFont(new Font("Monospaced", Font.PLAIN, 14));
  label1.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
}

// Variable declarations 
// autogenerated do not edit
GDropList portList; 
GButton record; 
GButton close; 
GImageButton imgButton1; 
GLabel lbl_hr; 
GLabel lbl_rtor; 
GLabel label11; 
GLabel label1; 
  public void settings() {  size(800, 480, JAVA2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "protocentral_max30003_gui" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
