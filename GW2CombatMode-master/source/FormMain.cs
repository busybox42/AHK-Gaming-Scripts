using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;
using System.Text;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;

using System.Windows.Forms;
using MouseKeyboardLibrary;

namespace GW2_Combat_Mode
{
    public partial class FormMain : Form
    {
        [DllImport("user32.dll")]
        private static extern IntPtr GetForegroundWindow();

        [DllImport("user32.dll")]
        private static extern int GetWindowText(IntPtr hWnd, StringBuilder text, int count);

        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool SetCursorPos(int X, int Y);
        
        private FormOverlay overlay;

        private MouseHook mouseHook = new MouseHook();
        private KeyboardHook keyboardHook = new KeyboardHook();
        private Rectangle allScreens = new Rectangle();
        private Rectangle mouseArea;
        private Boolean gwActive = false;
        private Boolean gwFound = false;
        private Boolean rightMouseDown = false;        

        public CombatSettings settings = new CombatSettings();

        public Boolean combatMode = false;
        public Point center;
        public Rectangle centerArea;

        public FormMain()
        {
            InitializeComponent();
            LoadSettings();

            if (settings.startMinimized)
            {
                WindowState = FormWindowState.Minimized;
            }

            overlay = new FormOverlay(settings);
            overlay.setVizor();

            mouseHook.MouseMove += new MouseEventHandler(mouseHook_MouseMove);
            mouseHook.MouseDown += new MouseEventHandler(mouseHook_MouseDown);
            mouseHook.MouseUp += new MouseEventHandler(mouseHook_MouseUp);
            mouseHook.MouseWheel += new MouseEventHandler(mouseHook_MouseWheel);

            keyboardHook.KeyDown += new KeyEventHandler(keyboardHook_KeyDown);
            keyboardHook.KeyUp += new KeyEventHandler(keyboardHook_KeyUp);
            keyboardHook.KeyPress += new KeyPressEventHandler(keyboardHook_KeyPress);

            mouseHook.Start();
            keyboardHook.Start();

            pictureBox1.Load(settings.vizorImage);
            mouseArea = allScreens;
            openFileDialog.InitialDirectory = Application.StartupPath + "\\Crosshairs";
            center = new Point(Screen.PrimaryScreen.Bounds.Width / 2, Screen.PrimaryScreen.Bounds.Height / 2);            
            this.SetBounds(Screen.PrimaryScreen.WorkingArea.Width - this.Width, Screen.PrimaryScreen.WorkingArea.Height - this.Height, this.Width, this.Height);
        }

        private void LoadSettings()
        {
            try
            {
                if (File.Exists("settings.bin"))
                {
                    Stream stream = File.Open("settings.bin", FileMode.Open);
                    BinaryFormatter bformatter = new BinaryFormatter();
                    settings = (CombatSettings)bformatter.Deserialize(stream);
                    stream.Close();
                }
            }
            catch(Exception e)
            {
                Debug.WriteLine(e.Message);
            }
            displaySettings();
        }

        private void SaveSettings()
        {
            Stream stream = File.Open("settings.bin", FileMode.Create);
            BinaryFormatter bformatter = new BinaryFormatter();
            bformatter.Serialize(stream, settings);
            stream.Close();          
        }

        private void displaySettings()
        {
            disableCombatUsingUI.Checked = settings.disableCombatUsingUI;
            enableCombatUsingSkills.Checked = settings.enableCombatUsingSkills;
            exitClosingGW2.Checked = settings.exitClosingGW2;
            restrictMouse.Checked = settings.restrictMouse;
            showVizorOOC.Checked = settings.showVizorOOC;
            startMinimized.Checked = settings.startMinimized;
            vizorOffset.Value = settings.vizorOffset;
            toggleCombatSwapping.Checked = settings.toggleCombatSwapping;

            useToggleCombat.Checked = settings.toggleCombat.active;
            toggleCombat.Text = settings.toggleCombat.ToString();

            useToggleVizor.Checked = settings.toggleVizor.active;
            toggleVizor.Text = settings.toggleVizor.ToString();

            useToggleWindow.Checked = settings.toggleWindow.active;
            toggleWindow.Text = settings.toggleWindow.ToString();

            useLeftMouse.Checked = settings.leftMouse.active;
            leftMouse.Text = settings.leftMouse.ToString();

            useMiddleMouse.Checked = settings.middleMouse.active;
            middleMouse.Text = settings.middleMouse.ToString();

            useRightMouse.Checked = settings.rightMouse.active;
            rightMouse.Text = settings.rightMouse.ToString();

            useScrollUp.Checked = settings.scrollUp.active;
            scrollUp.Text = settings.scrollUp.ToString();

            useScrollDown.Checked = settings.scrollDown.active;
            scrollDown.Text = settings.scrollDown.ToString();
        }

        private void toggleCombatMode()
        {
            combatMode = !combatMode;
            if (!combatMode)
            {
                MouseSimulator.MouseUp(MouseButton.Right);
            }
        }

        private void playBack(KeyBinding kb)
        {
            switch (kb.BindingEventType)
            {
                case BindingEventType.MouseDown:
                    {
                        MouseEventArgs mouseArgs = new MouseEventArgs(kb.button, 1, MouseSimulator.X, MouseSimulator.Y, 0);
                        MouseSimulator.MouseDown(mouseArgs.Button);
                    }
                    break;

                case BindingEventType.MouseUp:
                    {
                        MouseEventArgs mouseArgs = new MouseEventArgs(kb.button, 1, MouseSimulator.X, MouseSimulator.Y, 0);
                        MouseSimulator.MouseUp(mouseArgs.Button);
                    }
                    break;

                case BindingEventType.KeyDown:
                    {
                        KeyEventArgs keyArgs = new KeyEventArgs(kb.key);
                        KeyboardSimulator.KeyDown(keyArgs.KeyCode);
                        KeyboardSimulator.KeyUp(keyArgs.KeyCode);
                    }
                    break;

                default:
                    break;
            }
        }

        void keyboardHook_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        void keyboardHook_KeyUp(object sender, KeyEventArgs e)
        {
            
        }

        void keyboardHook_KeyDown(object sender, KeyEventArgs e)
        {
            Keys code = e.KeyCode;

            Debug.WriteLine("Key Down: " + e.KeyCode.ToString());

            if (settings.toggleCombat.active)
            {
                if (e.KeyCode == settings.toggleCombat.key)
                {
                    toggleCombatMode();
                }
            }

            if (settings.toggleCombatSwapping)
            {
                if (e.KeyCode == Keys.Oemtilde)
                {
                    toggleCombatMode();
                }
            }

            if (settings.enableCombatUsingSkills)
            {
                switch (e.KeyCode)
                {
                    case Keys.D1:
                    case Keys.D2:
                    case Keys.D3:
                    case Keys.D4:
                    case Keys.D5:
                    case Keys.D6:
                    case Keys.D7:
                    case Keys.D8:
                    case Keys.D9:
                    case Keys.D0:
                    case Keys.F1:
                    case Keys.F2:
                    case Keys.F3:
                    case Keys.F4:
                        combatMode = true;
                        break;

                    default:
                        break;
                }
            }

            if (settings.disableCombatUsingUI)
            {
                switch (e.KeyCode)
                {
                    case Keys.I:
                    case Keys.M:
                    case Keys.H:
                    case Keys.G:
                    case Keys.O:
                    case Keys.B:
                    case Keys.Y:
                    case Keys.P:
                    case Keys.Escape:
                    case Keys.Back:
                    case Keys.Enter:
                    case Keys.OemQuestion:
                        combatMode = false;
                        break;

                    default:
                        break;
                }
            }

            if (settings.toggleWindow.active)
            {
                if (e.KeyCode == settings.toggleWindow.key)
                {
                    if (WindowState == FormWindowState.Normal)
                    {
                        WindowState = FormWindowState.Minimized;
                    }
                    else
                    {
                        WindowState = FormWindowState.Normal;
                    }
                }
            }
        }

        void mouseHook_MouseWheel(object sender, MouseEventArgs e)
        {
            
        }

        void mouseHook_MouseUp(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
            {
                rightMouseDown = false;
            }            
        }

        void mouseHook_MouseDown(object sender, MouseEventArgs e)
        {
            if (e.Button == System.Windows.Forms.MouseButtons.Right)
            {
                rightMouseDown = true;
            }
        }

        void mouseHook_MouseMove(object sender, MouseEventArgs e)
        {

        }

        private void FormMain_Shown(object sender, EventArgs e)
        {            
            timer.Start();            
        }

        private void timer_Tick(object sender, EventArgs e)
        {
            int chars = 256;
            StringBuilder buff = new StringBuilder(chars);
            IntPtr handle = GetForegroundWindow();

            if (GetWindowText(handle, buff, chars) > 0)
            {
                gwActive = (buff.ToString() == "Guild Wars 2");
            }

            if (gwActive)
            {
                if (combatMode)
                {
                    centerArea = new Rectangle(center.X-4, center.Y-4 - (int)settings.vizorOffset, 8, 8);
                    MouseSimulator.X = centerArea.X;
                    MouseSimulator.Y = centerArea.Y;
                    mouseArea = centerArea;
                    overlay.Visible = true; 
                    MouseSimulator.MouseDown(MouseButton.Right);
                }
                else
                {
                    if (!settings.showVizorOOC)
                    {
                        overlay.Visible = false;
                    }
                    
                    if (settings.restrictMouse)
                    {
                        mouseArea = Screen.PrimaryScreen.Bounds;
                    }
                    else
                    {
                        mouseArea = allScreens;
                    }
                }
                Cursor.Clip = mouseArea;
            }
        }

        private void timerShutdown_Tick(object sender, EventArgs e)
        {
            if (settings.exitClosingGW2)
            {
                Process[] pname = Process.GetProcessesByName("GW2");
                gwFound = gwFound || (pname.Length > 0);

                if (gwFound && (pname.Length == 0))
                {
                    Close();
                }
            }
        }

        private void FormMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            SaveSettings();
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                settings.vizorImage = openFileDialog.FileName;
                pictureBox1.Load(settings.vizorImage);
                if (overlay != null) overlay.setVizor();             
            }
        }

        private void numericUpDown1_ValueChanged(object sender, EventArgs e)
        {
            if (overlay != null) overlay.setVizor();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void BindingBox_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("Binding Box Clicked");
        }

        private void showVizorOOC_CheckedChanged(object sender, EventArgs e)
        {
            settings.showVizorOOC = showVizorOOC.Checked;
        }

        private void useToggleVizor_CheckedChanged(object sender, EventArgs e)
        {
            settings.toggleVizor.active = useToggleVizor.Checked;
        }

        private void enableCombatUsingSkills_CheckedChanged(object sender, EventArgs e)
        {
            settings.enableCombatUsingSkills = enableCombatUsingSkills.Checked;
        }

        private void toggleCombatSwapping_CheckedChanged(object sender, EventArgs e)
        {
            settings.toggleCombatSwapping = toggleCombatSwapping.Checked;
        }

        private void disableCombatUsingUI_CheckedChanged(object sender, EventArgs e)
        {
            settings.disableCombatUsingUI = disableCombatUsingUI.Checked;
        }

        private void useToggleCombat_CheckedChanged(object sender, EventArgs e)
        {
            settings.toggleCombat.active = useToggleCombat.Checked;
        }

        private void restrictMouse_CheckedChanged(object sender, EventArgs e)
        {
            settings.restrictMouse = restrictMouse.Checked;
        }

        private void useLeftMouse_CheckedChanged(object sender, EventArgs e)
        {
            settings.leftMouse.active = useLeftMouse.Checked;
        }

        private void useRightMouse_CheckedChanged(object sender, EventArgs e)
        {
            settings.rightMouse.active = useRightMouse.Checked;
        }

        private void useMiddleMouse_CheckedChanged(object sender, EventArgs e)
        {
            settings.middleMouse.active = useMiddleMouse.Checked;
        }

        private void useScrollUp_Click(object sender, EventArgs e)
        {
            settings.scrollUp.active = useScrollUp.Checked;
        }

        private void useScrollDown_CheckedChanged(object sender, EventArgs e)
        {
            settings.scrollDown.active = useScrollDown.Checked;
        }

        private void startMinimized_CheckedChanged(object sender, EventArgs e)
        {
            settings.startMinimized = startMinimized.Checked;
        }

        private void exitClosingGW2_CheckedChanged(object sender, EventArgs e)
        {
            settings.exitClosingGW2 = exitClosingGW2.Checked;
        }

        private void useToggleWindow_Click(object sender, EventArgs e)
        {
            settings.toggleWindow.active = useToggleWindow.Checked;
        }

        private void vizorOffset_ValueChanged(object sender, EventArgs e)
        {
            settings.vizorOffset = vizorOffset.Value;
        }
    }
}
