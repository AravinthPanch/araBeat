namespace DebugRS232
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.label1 = new System.Windows.Forms.Label();
            this.openButton = new System.Windows.Forms.Button();
            this.sPortBox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.baudRateBox = new System.Windows.Forms.ComboBox();
            this.closeButton = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.dataBitBox = new System.Windows.Forms.ComboBox();
            this.label6 = new System.Windows.Forms.Label();
            this.stopBitBox = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.parityBox = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.handshakeBox = new System.Windows.Forms.ComboBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.ekgScope = new System.Windows.Forms.PictureBox();
            this.rxTimer = new System.Windows.Forms.Timer(this.components);
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.fourSampleButton = new System.Windows.Forms.RadioButton();
            this.exButton = new System.Windows.Forms.Button();
            this.threeSampleButton = new System.Windows.Forms.RadioButton();
            this.twoSampleButton = new System.Windows.Forms.RadioButton();
            this.oneSampleButton = new System.Windows.Forms.RadioButton();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ekgScope)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(90, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Com Port Number";
            // 
            // openButton
            // 
            this.openButton.Location = new System.Drawing.Point(224, 76);
            this.openButton.Name = "openButton";
            this.openButton.Size = new System.Drawing.Size(67, 21);
            this.openButton.TabIndex = 1;
            this.openButton.Text = "&Open";
            this.openButton.UseVisualStyleBackColor = true;
            this.openButton.Click += new System.EventHandler(this.openButton_Click);
            // 
            // sPortBox
            // 
            this.sPortBox.FormattingEnabled = true;
            this.sPortBox.Location = new System.Drawing.Point(22, 39);
            this.sPortBox.Name = "sPortBox";
            this.sPortBox.Size = new System.Drawing.Size(122, 21);
            this.sPortBox.TabIndex = 2;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(161, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(58, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Baud Rate";
            // 
            // baudRateBox
            // 
            this.baudRateBox.FormattingEnabled = true;
            this.baudRateBox.Items.AddRange(new object[] {
            "2400",
            "4800",
            "9600",
            "19200",
            "38400",
            "57600",
            "115200",
            "230400",
            "460800",
            "921600"});
            this.baudRateBox.Location = new System.Drawing.Point(152, 39);
            this.baudRateBox.Name = "baudRateBox";
            this.baudRateBox.Size = new System.Drawing.Size(134, 21);
            this.baudRateBox.TabIndex = 4;
            // 
            // closeButton
            // 
            this.closeButton.Enabled = false;
            this.closeButton.Location = new System.Drawing.Point(224, 103);
            this.closeButton.Name = "closeButton";
            this.closeButton.Size = new System.Drawing.Size(67, 21);
            this.closeButton.TabIndex = 7;
            this.closeButton.Text = "&Close";
            this.closeButton.UseVisualStyleBackColor = true;
            this.closeButton.Click += new System.EventHandler(this.closeButton_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(22, 63);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(50, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = "Data Bits";
            // 
            // dataBitBox
            // 
            this.dataBitBox.Enabled = false;
            this.dataBitBox.FormattingEnabled = true;
            this.dataBitBox.Items.AddRange(new object[] {
            "5",
            "6",
            "7",
            "8"});
            this.dataBitBox.Location = new System.Drawing.Point(22, 78);
            this.dataBitBox.Name = "dataBitBox";
            this.dataBitBox.Size = new System.Drawing.Size(91, 21);
            this.dataBitBox.TabIndex = 9;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(22, 103);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(49, 13);
            this.label6.TabIndex = 10;
            this.label6.Text = "Stop Bits";
            // 
            // stopBitBox
            // 
            this.stopBitBox.Enabled = false;
            this.stopBitBox.FormattingEnabled = true;
            this.stopBitBox.Items.AddRange(new object[] {
            "None",
            "One",
            "OnePointFive",
            "Two"});
            this.stopBitBox.Location = new System.Drawing.Point(22, 118);
            this.stopBitBox.Name = "stopBitBox";
            this.stopBitBox.Size = new System.Drawing.Size(91, 21);
            this.stopBitBox.TabIndex = 11;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(126, 63);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(33, 13);
            this.label7.TabIndex = 12;
            this.label7.Text = "Parity";
            // 
            // parityBox
            // 
            this.parityBox.Enabled = false;
            this.parityBox.FormattingEnabled = true;
            this.parityBox.Items.AddRange(new object[] {
            "Even",
            "Mark",
            "None",
            "Odd",
            "Space"});
            this.parityBox.Location = new System.Drawing.Point(118, 78);
            this.parityBox.Name = "parityBox";
            this.parityBox.Size = new System.Drawing.Size(93, 21);
            this.parityBox.TabIndex = 13;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(126, 103);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(62, 13);
            this.label8.TabIndex = 15;
            this.label8.Text = "Handshake";
            // 
            // handshakeBox
            // 
            this.handshakeBox.FormattingEnabled = true;
            this.handshakeBox.Items.AddRange(new object[] {
            "None",
            "RTS/CTS",
            ""});
            this.handshakeBox.Location = new System.Drawing.Point(119, 118);
            this.handshakeBox.Name = "handshakeBox";
            this.handshakeBox.Size = new System.Drawing.Size(92, 21);
            this.handshakeBox.TabIndex = 16;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.handshakeBox);
            this.groupBox2.Controls.Add(this.label8);
            this.groupBox2.Controls.Add(this.parityBox);
            this.groupBox2.Controls.Add(this.label7);
            this.groupBox2.Controls.Add(this.stopBitBox);
            this.groupBox2.Controls.Add(this.label6);
            this.groupBox2.Controls.Add(this.dataBitBox);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.closeButton);
            this.groupBox2.Controls.Add(this.baudRateBox);
            this.groupBox2.Controls.Add(this.label2);
            this.groupBox2.Controls.Add(this.sPortBox);
            this.groupBox2.Controls.Add(this.openButton);
            this.groupBox2.Controls.Add(this.label1);
            this.groupBox2.Location = new System.Drawing.Point(11, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(301, 155);
            this.groupBox2.TabIndex = 47;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "COM Port Settings";
            // 
            // groupBox3
            // 
            this.groupBox3.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox3.Controls.Add(this.ekgScope);
            this.groupBox3.Location = new System.Drawing.Point(12, 168);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(1340, 310);
            this.groupBox3.TabIndex = 49;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "EKG";
            // 
            // ekgScope
            // 
            this.ekgScope.Location = new System.Drawing.Point(21, 31);
            this.ekgScope.Name = "ekgScope";
            this.ekgScope.Size = new System.Drawing.Size(1300, 256);
            this.ekgScope.TabIndex = 50;
            this.ekgScope.TabStop = false;
            // 
            // rxTimer
            // 
            this.rxTimer.Interval = 50;
            this.rxTimer.Tick += new System.EventHandler(this.rxTimer_Tick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.fourSampleButton);
            this.groupBox1.Controls.Add(this.threeSampleButton);
            this.groupBox1.Controls.Add(this.twoSampleButton);
            this.groupBox1.Controls.Add(this.oneSampleButton);
            this.groupBox1.Location = new System.Drawing.Point(318, 11);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(99, 117);
            this.groupBox1.TabIndex = 51;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "EKG Settings";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // fourSampleButton
            // 
            this.fourSampleButton.AutoSize = true;
            this.fourSampleButton.Location = new System.Drawing.Point(6, 93);
            this.fourSampleButton.Name = "fourSampleButton";
            this.fourSampleButton.Size = new System.Drawing.Size(83, 17);
            this.fourSampleButton.TabIndex = 55;
            this.fourSampleButton.Text = "1:4 Samples";
            this.fourSampleButton.UseVisualStyleBackColor = true;
            this.fourSampleButton.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            // 
            // exButton
            // 
            this.exButton.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.exButton.Location = new System.Drawing.Point(332, 139);
            this.exButton.Name = "exButton";
            this.exButton.Size = new System.Drawing.Size(75, 23);
            this.exButton.TabIndex = 52;
            this.exButton.Text = "EXIT";
            this.exButton.Click += new System.EventHandler(this.exitButton_Click);
            // 
            // threeSampleButton
            // 
            this.threeSampleButton.AutoSize = true;
            this.threeSampleButton.Location = new System.Drawing.Point(6, 70);
            this.threeSampleButton.Name = "threeSampleButton";
            this.threeSampleButton.Size = new System.Drawing.Size(83, 17);
            this.threeSampleButton.TabIndex = 54;
            this.threeSampleButton.Text = "1:3 Samples";
            this.threeSampleButton.UseVisualStyleBackColor = true;
            this.threeSampleButton.CheckedChanged += new System.EventHandler(this.threeSamplebutton_CheckedChanged);
            // 
            // twoSampleButton
            // 
            this.twoSampleButton.AutoSize = true;
            this.twoSampleButton.Location = new System.Drawing.Point(6, 47);
            this.twoSampleButton.Name = "twoSampleButton";
            this.twoSampleButton.Size = new System.Drawing.Size(83, 17);
            this.twoSampleButton.TabIndex = 53;
            this.twoSampleButton.Text = "1:2 Samples";
            this.twoSampleButton.UseVisualStyleBackColor = true;
            this.twoSampleButton.CheckedChanged += new System.EventHandler(this.twoSampleButton_CheckedChanged);
            // 
            // oneSampleButton
            // 
            this.oneSampleButton.AutoSize = true;
            this.oneSampleButton.Checked = true;
            this.oneSampleButton.Location = new System.Drawing.Point(6, 24);
            this.oneSampleButton.Name = "oneSampleButton";
            this.oneSampleButton.Size = new System.Drawing.Size(83, 17);
            this.oneSampleButton.TabIndex = 52;
            this.oneSampleButton.TabStop = true;
            this.oneSampleButton.Text = "1:1 Samples";
            this.oneSampleButton.UseVisualStyleBackColor = true;
            this.oneSampleButton.CheckedChanged += new System.EventHandler(this.oneSampleButton_CheckedChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1362, 490);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.exButton);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.MinimumSize = new System.Drawing.Size(799, 493);
            this.Name = "Form1";
            this.Text = "EKG";
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ekgScope)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button openButton;
        private System.Windows.Forms.ComboBox sPortBox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox baudRateBox;
        private System.Windows.Forms.Button closeButton;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.ComboBox dataBitBox;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.ComboBox stopBitBox;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.ComboBox parityBox;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.ComboBox handshakeBox;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.PictureBox ekgScope;
        private System.Windows.Forms.Timer rxTimer;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.RadioButton threeSampleButton;
        private System.Windows.Forms.RadioButton twoSampleButton;
        private System.Windows.Forms.RadioButton oneSampleButton;
        private System.Windows.Forms.RadioButton fourSampleButton;
        private System.Windows.Forms.Button exButton;
    }
}

