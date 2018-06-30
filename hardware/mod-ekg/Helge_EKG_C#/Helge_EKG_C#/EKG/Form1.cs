/* EKG Waveform Viewer
 * For Olimex MOD-EKG
 * with waveform dump to textfile (automatically with date/time filename. All values in a single column with full Sampling rate)
 * Helge Krambeck 2016-11-22
 
 */


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;
using System.IO;



namespace DebugRS232
{
   // delegate void SetTextCallback(string text);
   //  delegate void UpdateLedCallback();

    public partial class Form1 : Form
    {
        SerialPort sPort;
        int xPosA = 0;
        int scopeDataEKGOld = 0;
        Graphics gEKGScope;
        StreamWriter ekgLog;
        bool ekgLogReady = false;
        int underSample = 1;
        int underSampleCounter = 1;

        public Form1()
        {
            InitializeComponent();

            string[] ports = SerialPort.GetPortNames();

            ekgScope.Image = new Bitmap(ekgScope.Width, ekgScope.Height);
            gEKGScope = Graphics.FromImage(ekgScope.Image);

            SolidBrush blackBrush = new SolidBrush(Color.Black);
            Pen testPen = new Pen(Color.Red, 3);

            gEKGScope.FillRectangle(blackBrush, 0, 0, ekgScope.Width, ekgScope.Height);


            foreach (string s in ports)
                sPortBox.Items.Add(s);
            sPortBox.SelectedIndex = sPortBox.Items.IndexOf("COM1");
            baudRateBox.SelectedIndex = baudRateBox.Items.IndexOf("115200");
            dataBitBox.SelectedIndex = dataBitBox.Items.IndexOf("8");
            parityBox.SelectedIndex = parityBox.Items.IndexOf("None");
            stopBitBox.SelectedIndex = stopBitBox.Items.IndexOf("One");
            handshakeBox.SelectedIndex = handshakeBox.Items.IndexOf("None");

        }

        private void openButton_Click(object sender, EventArgs e)
        {
            sPort = new SerialPort(sPortBox.SelectedItem.ToString());
            
            sPort.BaudRate = Int32.Parse(baudRateBox.SelectedItem.ToString());
            if (handshakeBox.SelectedIndex == 1)
                sPort.Handshake = Handshake.RequestToSend;


            string file_Name = DateTime.Now.Year + "-" + DateTime.Now.Month.ToString("00") + "-" + DateTime.Now.Day + "_" + DateTime.Now.Hour + "-" + DateTime.Now.Minute.ToString("00") + "-" + DateTime.Now.Second.ToString("00");
            ekgLog = new StreamWriter(file_Name + "_EKG_log.txt", false);

            ekgLogReady = true;

            sPort.Open();

            // Read Back Serial Port Configuration to make sure that configuration is set properly
            baudRateBox.SelectedIndex = baudRateBox.Items.IndexOf(sPort.BaudRate.ToString());
            dataBitBox.SelectedIndex = dataBitBox.Items.IndexOf(sPort.DataBits.ToString());
            parityBox.SelectedIndex = parityBox.Items.IndexOf(sPort.Parity.ToString());
            stopBitBox.SelectedIndex = stopBitBox.Items.IndexOf(sPort.StopBits.ToString());


            openButton.Enabled = false;
            closeButton.Enabled = true;

            // readTimer.Enabled = true;
            if(sPort.Handshake!=Handshake.RequestToSend)
                sPort.RtsEnable = true;

            sPort.DtrEnable = true;
            sPort.Encoding = Encoding.UTF8;

            rxTimer.Enabled = true;

      
        }




        public void pollReceiveBuffer()
        {
        
            if (sPort.BytesToRead > 0)
            {
                byte[] receiveBuffer;
                receiveBuffer = new byte[sPort.BytesToRead];
                sPort.Read(receiveBuffer, 0, receiveBuffer.Length);

                // Neue Daten empfangen
                for (int i = 0; i < receiveBuffer.Length; i++)
                {
                    // readBox.AppendText("0x"+newBytes[i].ToString("X2")+" ");
                       underSampleCounter--;

                    if (underSampleCounter <= 0)
                    {
                        gEKGScope.FillRectangle(new SolidBrush(Color.Black), new Rectangle(xPosA, 0, 2, ekgScope.Height));

                        if (xPosA > 0)
                        {
                            gEKGScope.DrawLine(new Pen(Color.Lime), xPosA - 1, 0xFF - scopeDataEKGOld, xPosA, 0xFF - receiveBuffer[i]);
                        }
                        scopeDataEKGOld = receiveBuffer[i];
                        xPosA++;

                        if (ekgLogReady) ekgLog.WriteLine("" + receiveBuffer[i]);

                        if (xPosA == ekgScope.Width) xPosA = 0;
                        ekgScope.Invalidate();

                        underSampleCounter = underSample;
                    }

                }
            }
        }

        private void closeButton_Click(object sender, EventArgs e)
        {
            rxTimer.Enabled = false;
            ekgLogReady = false;
  
            ekgLog.Close();
            sPort.Close();
            openButton.Enabled = true;
            closeButton.Enabled = false;
        }


        private void exitButton_Click(object sender, EventArgs e)
        {
            if (sPort != null)
            {
                if (sPort.IsOpen)
                    sPort.Close();
            }
            if(ekgLog!=null) ekgLog.Close();

            this.Close();
        }



        private void rxTimer_Tick(object sender, EventArgs e)
        {
            pollReceiveBuffer();
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void twoSampleButton_CheckedChanged(object sender, EventArgs e)
        {
            if (twoSampleButton.Checked) underSample = 2;
            underSampleCounter = 1;
        }

        private void oneSampleButton_CheckedChanged(object sender, EventArgs e)
        {
            if (oneSampleButton.Checked) underSample = 1;
            underSampleCounter = 1;
        }

        private void threeSamplebutton_CheckedChanged(object sender, EventArgs e)
        {
            if (threeSampleButton.Checked) underSample = 3;
            underSampleCounter = 1;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (fourSampleButton.Checked) underSample = 4;
            underSampleCounter = 1;
        }
    }
}