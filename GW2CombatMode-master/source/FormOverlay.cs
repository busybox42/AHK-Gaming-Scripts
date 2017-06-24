using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace GW2_Combat_Mode
{
    public partial class FormOverlay : Form
    {
        public enum GWL
        {
            ExStyle = -20,
            HINSTANCE = -6,
            ID = -12,
            STYLE = -16,
            USERDATA = -21,
            WNDPROC = -4
        }

        public enum WS_EX
        {
            Transparent = 0x20,
            Layered = 0x80000
        }

        public enum LWA
        {
            ColorKey = 0x1,
            Alpha = 0x2
        }        
        
        [DllImport("user32.dll", EntryPoint = "GetWindowLong")]
        public static extern int GetWindowLong(IntPtr hWnd, GWL nIndex);

        [DllImport("user32.dll", EntryPoint = "SetWindowLong")]
        public static extern int SetWindowLong(IntPtr hWnd, GWL nIndex, int dwNewLong);

        private CombatSettings settings;

        public FormOverlay(CombatSettings s)
        {
            settings = s;
            InitializeComponent();
            int wl = GetWindowLong(this.Handle, GWL.ExStyle);
            wl = wl | 0x80000 | 0x20;
            SetWindowLong(this.Handle, GWL.ExStyle, wl);
        }

        private void FormOverlay_FormClosing(object sender, FormClosingEventArgs e)
        {

        }

        public void setVizor()
        {
            this.SetBounds(0, 0, Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            vizor.Load(settings.vizorImage);
            vizor.Width = vizor.Image.Width;
            vizor.Height = vizor.Image.Height;
            vizor.Location = new Point(Width / 2 - vizor.Width / 2, Height / 2 - vizor.Height / 2 - (int)settings.vizorOffset);
        }

        private void FormOverlay_Shown(object sender, EventArgs e)
        {
            setVizor();
        }
    }
}
