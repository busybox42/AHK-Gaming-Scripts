namespace GW2_Combat_Mode
{
    partial class FormMain
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormMain));
            this.timer = new System.Windows.Forms.Timer(this.components);
            this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.label2 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.toggleVizor = new System.Windows.Forms.TextBox();
            this.useToggleVizor = new System.Windows.Forms.CheckBox();
            this.showVizorOOC = new System.Windows.Forms.CheckBox();
            this.vizorOffset = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.toggleCombat = new System.Windows.Forms.TextBox();
            this.disableCombatUsingUI = new System.Windows.Forms.CheckBox();
            this.toggleCombatSwapping = new System.Windows.Forms.CheckBox();
            this.enableCombatUsingSkills = new System.Windows.Forms.CheckBox();
            this.useToggleCombat = new System.Windows.Forms.CheckBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.scrollDown = new System.Windows.Forms.TextBox();
            this.scrollUp = new System.Windows.Forms.TextBox();
            this.middleMouse = new System.Windows.Forms.TextBox();
            this.rightMouse = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.leftMouse = new System.Windows.Forms.TextBox();
            this.useScrollDown = new System.Windows.Forms.CheckBox();
            this.useScrollUp = new System.Windows.Forms.CheckBox();
            this.useMiddleMouse = new System.Windows.Forms.CheckBox();
            this.useRightMouse = new System.Windows.Forms.CheckBox();
            this.useLeftMouse = new System.Windows.Forms.CheckBox();
            this.restrictMouse = new System.Windows.Forms.CheckBox();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.toggleWindow = new System.Windows.Forms.TextBox();
            this.exitClosingGW2 = new System.Windows.Forms.CheckBox();
            this.startMinimized = new System.Windows.Forms.CheckBox();
            this.useToggleWindow = new System.Windows.Forms.CheckBox();
            this.button3 = new System.Windows.Forms.Button();
            this.timerShutdown = new System.Windows.Forms.Timer(this.components);
            this.groupBox5.SuspendLayout();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.vizorOffset)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // timer
            // 
            this.timer.Interval = 25;
            this.timer.Tick += new System.EventHandler(this.timer_Tick);
            // 
            // openFileDialog
            // 
            this.openFileDialog.Filter = "PNG Files|*.png";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(20, 610);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(185, 23);
            this.button1.TabIndex = 4;
            this.button1.Text = "Open Project Home Page";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // groupBox5
            // 
            this.groupBox5.BackColor = System.Drawing.Color.Transparent;
            this.groupBox5.Controls.Add(this.label2);
            this.groupBox5.Controls.Add(this.button2);
            this.groupBox5.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox5.Location = new System.Drawing.Point(20, 4);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(320, 48);
            this.groupBox5.TabIndex = 0;
            this.groupBox5.TabStop = false;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.DarkOrange;
            this.label2.Location = new System.Drawing.Point(7, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(157, 25);
            this.label2.TabIndex = 1;
            this.label2.Text = "Combat Mode";
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(288, 14);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(26, 23);
            this.button2.TabIndex = 0;
            this.button2.Text = "x";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.BackColor = System.Drawing.Color.Transparent;
            this.groupBox1.Controls.Add(this.toggleVizor);
            this.groupBox1.Controls.Add(this.useToggleVizor);
            this.groupBox1.Controls.Add(this.showVizorOOC);
            this.groupBox1.Controls.Add(this.vizorOffset);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.pictureBox1);
            this.groupBox1.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox1.ForeColor = System.Drawing.Color.DarkOrange;
            this.groupBox1.Location = new System.Drawing.Point(20, 52);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(320, 133);
            this.groupBox1.TabIndex = 5;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Crosshair";
            // 
            // toggleVizor
            // 
            this.toggleVizor.BackColor = System.Drawing.Color.NavajoWhite;
            this.toggleVizor.Enabled = false;
            this.toggleVizor.Location = new System.Drawing.Point(125, 100);
            this.toggleVizor.Name = "toggleVizor";
            this.toggleVizor.Size = new System.Drawing.Size(153, 20);
            this.toggleVizor.TabIndex = 5;
            this.toggleVizor.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // useToggleVizor
            // 
            this.useToggleVizor.AutoSize = true;
            this.useToggleVizor.Checked = true;
            this.useToggleVizor.CheckState = System.Windows.Forms.CheckState.Checked;
            this.useToggleVizor.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useToggleVizor.Location = new System.Drawing.Point(125, 74);
            this.useToggleVizor.Name = "useToggleVizor";
            this.useToggleVizor.Size = new System.Drawing.Size(153, 17);
            this.useToggleVizor.TabIndex = 4;
            this.useToggleVizor.Text = "Use a Toggle Visibility Key:";
            this.useToggleVizor.UseVisualStyleBackColor = true;
            this.useToggleVizor.CheckedChanged += new System.EventHandler(this.useToggleVizor_CheckedChanged);
            // 
            // showVizorOOC
            // 
            this.showVizorOOC.AutoSize = true;
            this.showVizorOOC.ForeColor = System.Drawing.Color.PapayaWhip;
            this.showVizorOOC.Location = new System.Drawing.Point(125, 50);
            this.showVizorOOC.Name = "showVizorOOC";
            this.showVizorOOC.Size = new System.Drawing.Size(128, 17);
            this.showVizorOOC.TabIndex = 3;
            this.showVizorOOC.Text = "Display out of combat";
            this.showVizorOOC.UseVisualStyleBackColor = true;
            this.showVizorOOC.CheckedChanged += new System.EventHandler(this.showVizorOOC_CheckedChanged);
            // 
            // vizorOffset
            // 
            this.vizorOffset.BackColor = System.Drawing.Color.NavajoWhite;
            this.vizorOffset.Location = new System.Drawing.Point(197, 20);
            this.vizorOffset.Maximum = new decimal(new int[] {
            640,
            0,
            0,
            0});
            this.vizorOffset.Name = "vizorOffset";
            this.vizorOffset.Size = new System.Drawing.Size(81, 20);
            this.vizorOffset.TabIndex = 2;
            this.vizorOffset.ValueChanged += new System.EventHandler(this.vizorOffset_ValueChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.Color.PapayaWhip;
            this.label1.Location = new System.Drawing.Point(122, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(69, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Center Offset";
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.Black;
            this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Hand;
            this.pictureBox1.Location = new System.Drawing.Point(10, 20);
            this.pictureBox1.Margin = new System.Windows.Forms.Padding(0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(101, 101);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.Color.Transparent;
            this.groupBox3.Controls.Add(this.toggleCombat);
            this.groupBox3.Controls.Add(this.disableCombatUsingUI);
            this.groupBox3.Controls.Add(this.toggleCombatSwapping);
            this.groupBox3.Controls.Add(this.enableCombatUsingSkills);
            this.groupBox3.Controls.Add(this.useToggleCombat);
            this.groupBox3.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox3.ForeColor = System.Drawing.Color.DarkOrange;
            this.groupBox3.Location = new System.Drawing.Point(20, 185);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(320, 121);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Combat";
            // 
            // toggleCombat
            // 
            this.toggleCombat.BackColor = System.Drawing.Color.NavajoWhite;
            this.toggleCombat.Enabled = false;
            this.toggleCombat.Location = new System.Drawing.Point(125, 88);
            this.toggleCombat.Name = "toggleCombat";
            this.toggleCombat.Size = new System.Drawing.Size(153, 20);
            this.toggleCombat.TabIndex = 7;
            this.toggleCombat.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // disableCombatUsingUI
            // 
            this.disableCombatUsingUI.AutoSize = true;
            this.disableCombatUsingUI.ForeColor = System.Drawing.Color.PapayaWhip;
            this.disableCombatUsingUI.Location = new System.Drawing.Point(13, 65);
            this.disableCombatUsingUI.Name = "disableCombatUsingUI";
            this.disableCombatUsingUI.Size = new System.Drawing.Size(261, 17);
            this.disableCombatUsingUI.TabIndex = 6;
            this.disableCombatUsingUI.Text = "Disable combat mode when using UI or Chat keys";
            this.disableCombatUsingUI.UseVisualStyleBackColor = true;
            this.disableCombatUsingUI.CheckedChanged += new System.EventHandler(this.disableCombatUsingUI_CheckedChanged);
            // 
            // toggleCombatSwapping
            // 
            this.toggleCombatSwapping.AutoSize = true;
            this.toggleCombatSwapping.ForeColor = System.Drawing.Color.PapayaWhip;
            this.toggleCombatSwapping.Location = new System.Drawing.Point(13, 42);
            this.toggleCombatSwapping.Name = "toggleCombatSwapping";
            this.toggleCombatSwapping.Size = new System.Drawing.Size(249, 17);
            this.toggleCombatSwapping.TabIndex = 6;
            this.toggleCombatSwapping.Text = "Toggle combat mode when swapping weapons";
            this.toggleCombatSwapping.UseVisualStyleBackColor = true;
            this.toggleCombatSwapping.CheckedChanged += new System.EventHandler(this.toggleCombatSwapping_CheckedChanged);
            // 
            // enableCombatUsingSkills
            // 
            this.enableCombatUsingSkills.AutoSize = true;
            this.enableCombatUsingSkills.ForeColor = System.Drawing.Color.PapayaWhip;
            this.enableCombatUsingSkills.Location = new System.Drawing.Point(13, 19);
            this.enableCombatUsingSkills.Name = "enableCombatUsingSkills";
            this.enableCombatUsingSkills.Size = new System.Drawing.Size(208, 17);
            this.enableCombatUsingSkills.TabIndex = 6;
            this.enableCombatUsingSkills.Text = "Enable combat mode when using skills";
            this.enableCombatUsingSkills.UseVisualStyleBackColor = true;
            this.enableCombatUsingSkills.CheckedChanged += new System.EventHandler(this.enableCombatUsingSkills_CheckedChanged);
            // 
            // useToggleCombat
            // 
            this.useToggleCombat.AutoSize = true;
            this.useToggleCombat.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useToggleCombat.Location = new System.Drawing.Point(13, 90);
            this.useToggleCombat.Name = "useToggleCombat";
            this.useToggleCombat.Size = new System.Drawing.Size(80, 17);
            this.useToggleCombat.TabIndex = 6;
            this.useToggleCombat.Text = "Toggle Key";
            this.useToggleCombat.UseVisualStyleBackColor = true;
            this.useToggleCombat.CheckedChanged += new System.EventHandler(this.useToggleCombat_CheckedChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.BackColor = System.Drawing.Color.Transparent;
            this.groupBox2.Controls.Add(this.scrollDown);
            this.groupBox2.Controls.Add(this.scrollUp);
            this.groupBox2.Controls.Add(this.middleMouse);
            this.groupBox2.Controls.Add(this.rightMouse);
            this.groupBox2.Controls.Add(this.textBox3);
            this.groupBox2.Controls.Add(this.leftMouse);
            this.groupBox2.Controls.Add(this.useScrollDown);
            this.groupBox2.Controls.Add(this.useScrollUp);
            this.groupBox2.Controls.Add(this.useMiddleMouse);
            this.groupBox2.Controls.Add(this.useRightMouse);
            this.groupBox2.Controls.Add(this.useLeftMouse);
            this.groupBox2.Controls.Add(this.restrictMouse);
            this.groupBox2.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox2.ForeColor = System.Drawing.Color.DarkOrange;
            this.groupBox2.Location = new System.Drawing.Point(20, 306);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(320, 166);
            this.groupBox2.TabIndex = 7;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Mouse";
            // 
            // scrollDown
            // 
            this.scrollDown.BackColor = System.Drawing.Color.NavajoWhite;
            this.scrollDown.Enabled = false;
            this.scrollDown.Location = new System.Drawing.Point(125, 134);
            this.scrollDown.Name = "scrollDown";
            this.scrollDown.Size = new System.Drawing.Size(153, 20);
            this.scrollDown.TabIndex = 5;
            this.scrollDown.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // scrollUp
            // 
            this.scrollUp.BackColor = System.Drawing.Color.NavajoWhite;
            this.scrollUp.Enabled = false;
            this.scrollUp.Location = new System.Drawing.Point(125, 111);
            this.scrollUp.Name = "scrollUp";
            this.scrollUp.Size = new System.Drawing.Size(153, 20);
            this.scrollUp.TabIndex = 5;
            this.scrollUp.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // middleMouse
            // 
            this.middleMouse.BackColor = System.Drawing.Color.NavajoWhite;
            this.middleMouse.Enabled = false;
            this.middleMouse.Location = new System.Drawing.Point(125, 88);
            this.middleMouse.Name = "middleMouse";
            this.middleMouse.Size = new System.Drawing.Size(153, 20);
            this.middleMouse.TabIndex = 5;
            this.middleMouse.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // rightMouse
            // 
            this.rightMouse.BackColor = System.Drawing.Color.NavajoWhite;
            this.rightMouse.Enabled = false;
            this.rightMouse.Location = new System.Drawing.Point(125, 65);
            this.rightMouse.Name = "rightMouse";
            this.rightMouse.Size = new System.Drawing.Size(153, 20);
            this.rightMouse.TabIndex = 5;
            this.rightMouse.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(125, 65);
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(153, 20);
            this.textBox3.TabIndex = 5;
            // 
            // leftMouse
            // 
            this.leftMouse.BackColor = System.Drawing.Color.NavajoWhite;
            this.leftMouse.Enabled = false;
            this.leftMouse.Location = new System.Drawing.Point(125, 42);
            this.leftMouse.Name = "leftMouse";
            this.leftMouse.Size = new System.Drawing.Size(153, 20);
            this.leftMouse.TabIndex = 5;
            this.leftMouse.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // useScrollDown
            // 
            this.useScrollDown.AutoSize = true;
            this.useScrollDown.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useScrollDown.Location = new System.Drawing.Point(13, 136);
            this.useScrollDown.Name = "useScrollDown";
            this.useScrollDown.Size = new System.Drawing.Size(83, 17);
            this.useScrollDown.TabIndex = 1;
            this.useScrollDown.Text = "Scroll Down";
            this.useScrollDown.UseVisualStyleBackColor = true;
            this.useScrollDown.CheckedChanged += new System.EventHandler(this.useScrollDown_CheckedChanged);
            // 
            // useScrollUp
            // 
            this.useScrollUp.AutoSize = true;
            this.useScrollUp.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useScrollUp.Location = new System.Drawing.Point(13, 113);
            this.useScrollUp.Name = "useScrollUp";
            this.useScrollUp.Size = new System.Drawing.Size(69, 17);
            this.useScrollUp.TabIndex = 1;
            this.useScrollUp.Text = "Scroll Up";
            this.useScrollUp.UseVisualStyleBackColor = true;
            this.useScrollUp.Click += new System.EventHandler(this.useScrollUp_Click);
            // 
            // useMiddleMouse
            // 
            this.useMiddleMouse.AutoSize = true;
            this.useMiddleMouse.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useMiddleMouse.Location = new System.Drawing.Point(13, 90);
            this.useMiddleMouse.Name = "useMiddleMouse";
            this.useMiddleMouse.Size = new System.Drawing.Size(91, 17);
            this.useMiddleMouse.TabIndex = 1;
            this.useMiddleMouse.Text = "Middle Button";
            this.useMiddleMouse.UseVisualStyleBackColor = true;
            this.useMiddleMouse.CheckedChanged += new System.EventHandler(this.useMiddleMouse_CheckedChanged);
            // 
            // useRightMouse
            // 
            this.useRightMouse.AutoSize = true;
            this.useRightMouse.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useRightMouse.Location = new System.Drawing.Point(13, 67);
            this.useRightMouse.Name = "useRightMouse";
            this.useRightMouse.Size = new System.Drawing.Size(85, 17);
            this.useRightMouse.TabIndex = 1;
            this.useRightMouse.Text = "Right Button";
            this.useRightMouse.UseVisualStyleBackColor = true;
            this.useRightMouse.CheckedChanged += new System.EventHandler(this.useRightMouse_CheckedChanged);
            // 
            // useLeftMouse
            // 
            this.useLeftMouse.AutoSize = true;
            this.useLeftMouse.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useLeftMouse.Location = new System.Drawing.Point(13, 44);
            this.useLeftMouse.Name = "useLeftMouse";
            this.useLeftMouse.Size = new System.Drawing.Size(78, 17);
            this.useLeftMouse.TabIndex = 1;
            this.useLeftMouse.Text = "Left Button";
            this.useLeftMouse.UseVisualStyleBackColor = true;
            this.useLeftMouse.CheckedChanged += new System.EventHandler(this.useLeftMouse_CheckedChanged);
            // 
            // restrictMouse
            // 
            this.restrictMouse.AutoSize = true;
            this.restrictMouse.Checked = true;
            this.restrictMouse.CheckState = System.Windows.Forms.CheckState.Checked;
            this.restrictMouse.ForeColor = System.Drawing.Color.PapayaWhip;
            this.restrictMouse.Location = new System.Drawing.Point(13, 20);
            this.restrictMouse.Name = "restrictMouse";
            this.restrictMouse.Size = new System.Drawing.Size(224, 17);
            this.restrictMouse.TabIndex = 0;
            this.restrictMouse.Text = "Trap the mouse in the primary screen area";
            this.restrictMouse.UseVisualStyleBackColor = true;
            this.restrictMouse.CheckedChanged += new System.EventHandler(this.restrictMouse_CheckedChanged);
            // 
            // groupBox4
            // 
            this.groupBox4.BackColor = System.Drawing.Color.Transparent;
            this.groupBox4.Controls.Add(this.toggleWindow);
            this.groupBox4.Controls.Add(this.exitClosingGW2);
            this.groupBox4.Controls.Add(this.startMinimized);
            this.groupBox4.Controls.Add(this.useToggleWindow);
            this.groupBox4.Dock = System.Windows.Forms.DockStyle.Top;
            this.groupBox4.ForeColor = System.Drawing.Color.DarkOrange;
            this.groupBox4.Location = new System.Drawing.Point(20, 472);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(320, 100);
            this.groupBox4.TabIndex = 8;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Other";
            // 
            // toggleWindow
            // 
            this.toggleWindow.BackColor = System.Drawing.Color.NavajoWhite;
            this.toggleWindow.Enabled = false;
            this.toggleWindow.Location = new System.Drawing.Point(125, 65);
            this.toggleWindow.Name = "toggleWindow";
            this.toggleWindow.Size = new System.Drawing.Size(153, 20);
            this.toggleWindow.TabIndex = 5;
            this.toggleWindow.Click += new System.EventHandler(this.BindingBox_Click);
            // 
            // exitClosingGW2
            // 
            this.exitClosingGW2.AutoSize = true;
            this.exitClosingGW2.ForeColor = System.Drawing.Color.PapayaWhip;
            this.exitClosingGW2.Location = new System.Drawing.Point(13, 42);
            this.exitClosingGW2.Name = "exitClosingGW2";
            this.exitClosingGW2.Size = new System.Drawing.Size(172, 17);
            this.exitClosingGW2.TabIndex = 1;
            this.exitClosingGW2.Text = "Exit when closing Guild Wars 2";
            this.exitClosingGW2.UseVisualStyleBackColor = true;
            this.exitClosingGW2.CheckedChanged += new System.EventHandler(this.exitClosingGW2_CheckedChanged);
            // 
            // startMinimized
            // 
            this.startMinimized.AutoSize = true;
            this.startMinimized.ForeColor = System.Drawing.Color.PapayaWhip;
            this.startMinimized.Location = new System.Drawing.Point(13, 19);
            this.startMinimized.Name = "startMinimized";
            this.startMinimized.Size = new System.Drawing.Size(136, 17);
            this.startMinimized.TabIndex = 1;
            this.startMinimized.Text = "Start this tool Minimized";
            this.startMinimized.UseVisualStyleBackColor = true;
            this.startMinimized.CheckedChanged += new System.EventHandler(this.startMinimized_CheckedChanged);
            // 
            // useToggleWindow
            // 
            this.useToggleWindow.AutoSize = true;
            this.useToggleWindow.ForeColor = System.Drawing.Color.PapayaWhip;
            this.useToggleWindow.Location = new System.Drawing.Point(13, 67);
            this.useToggleWindow.Name = "useToggleWindow";
            this.useToggleWindow.Size = new System.Drawing.Size(101, 17);
            this.useToggleWindow.TabIndex = 1;
            this.useToggleWindow.Text = "Show/Hide Key";
            this.useToggleWindow.UseVisualStyleBackColor = true;
            this.useToggleWindow.Click += new System.EventHandler(this.useToggleWindow_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(217, 610);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(117, 23);
            this.button3.TabIndex = 9;
            this.button3.Text = "Shut down";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // timerShutdown
            // 
            this.timerShutdown.Enabled = true;
            this.timerShutdown.Interval = 1000;
            this.timerShutdown.Tick += new System.EventHandler(this.timerShutdown_Tick);
            // 
            // FormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Magenta;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(360, 640);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.button1);
            this.DoubleBuffered = true;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormMain";
            this.Padding = new System.Windows.Forms.Padding(20, 4, 20, 20);
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.Manual;
            this.Text = "Guild Wars 2 Combat Mode";
            this.TopMost = true;
            this.TransparencyKey = System.Drawing.Color.Magenta;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormMain_FormClosing);
            this.Shown += new System.EventHandler(this.FormMain_Shown);
            this.groupBox5.ResumeLayout(false);
            this.groupBox5.PerformLayout();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.vizorOffset)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Timer timer;
        private System.Windows.Forms.OpenFileDialog openFileDialog;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.GroupBox groupBox5;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox toggleVizor;
        private System.Windows.Forms.CheckBox useToggleVizor;
        private System.Windows.Forms.CheckBox showVizorOOC;
        private System.Windows.Forms.NumericUpDown vizorOffset;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.TextBox toggleCombat;
        private System.Windows.Forms.CheckBox disableCombatUsingUI;
        private System.Windows.Forms.CheckBox toggleCombatSwapping;
        private System.Windows.Forms.CheckBox enableCombatUsingSkills;
        private System.Windows.Forms.CheckBox useToggleCombat;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox scrollDown;
        private System.Windows.Forms.TextBox scrollUp;
        private System.Windows.Forms.TextBox middleMouse;
        private System.Windows.Forms.TextBox rightMouse;
        private System.Windows.Forms.TextBox textBox3;
        private System.Windows.Forms.TextBox leftMouse;
        private System.Windows.Forms.CheckBox useScrollDown;
        private System.Windows.Forms.CheckBox useScrollUp;
        private System.Windows.Forms.CheckBox useMiddleMouse;
        private System.Windows.Forms.CheckBox useRightMouse;
        private System.Windows.Forms.CheckBox useLeftMouse;
        private System.Windows.Forms.CheckBox restrictMouse;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.TextBox toggleWindow;
        private System.Windows.Forms.CheckBox exitClosingGW2;
        private System.Windows.Forms.CheckBox startMinimized;
        private System.Windows.Forms.CheckBox useToggleWindow;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Timer timerShutdown;
    }
}

