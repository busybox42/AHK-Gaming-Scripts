namespace GW2_Combat_Mode
{
    partial class FormOverlay
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormOverlay));
            this.vizor = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.vizor)).BeginInit();
            this.SuspendLayout();
            // 
            // vizor
            // 
            this.vizor.Location = new System.Drawing.Point(229, 250);
            this.vizor.Margin = new System.Windows.Forms.Padding(0);
            this.vizor.Name = "vizor";
            this.vizor.Size = new System.Drawing.Size(101, 101);
            this.vizor.TabIndex = 0;
            this.vizor.TabStop = false;
            // 
            // FormOverlay
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Olive;
            this.ClientSize = new System.Drawing.Size(600, 600);
            this.Controls.Add(this.vizor);
            this.Cursor = System.Windows.Forms.Cursors.Cross;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormOverlay";
            this.ShowIcon = false;
            this.ShowInTaskbar = false;
            this.SizeGripStyle = System.Windows.Forms.SizeGripStyle.Hide;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Form1";
            this.TopMost = true;
            this.TransparencyKey = System.Drawing.Color.Olive;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormOverlay_FormClosing);
            this.Shown += new System.EventHandler(this.FormOverlay_Shown);
            ((System.ComponentModel.ISupportInitialize)(this.vizor)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox vizor;
    }
}