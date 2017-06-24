using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Windows.Forms;

namespace GW2_Combat_Mode
{
    [Serializable]
    public enum BindingEventType
    {
        MouseMove,
        MouseDown,
        MouseUp,
        MouseWheel,
        KeyDown,
        KeyUp,
        None
    }

    [Serializable]
    public class KeyBinding
    {
        public bool active = false;
        
        public BindingEventType BindingEventType = BindingEventType.None;

        public MouseButtons button = MouseButtons.None;
        public Keys key = Keys.None;

        public KeyBinding()
        {

        }

        public KeyBinding(BindingEventType bindingEventType, EventArgs eventArgs)
        {
            BindingEventType = bindingEventType;

            if (eventArgs is MouseEventArgs)
            {
                MouseEventArgs mea = (MouseEventArgs)eventArgs;
                button = mea.Button;
            }
            if (eventArgs is KeyEventArgs)
            {
                KeyEventArgs kea = (KeyEventArgs)eventArgs;
                key = kea.KeyCode;
            }
        }

        public override String ToString()
        {
            switch (BindingEventType)
            {
                case GW2_Combat_Mode.BindingEventType.KeyDown:
                case GW2_Combat_Mode.BindingEventType.KeyUp:
                    return key.ToString();

                case GW2_Combat_Mode.BindingEventType.MouseDown:
                case GW2_Combat_Mode.BindingEventType.MouseUp:
                    return button.ToString();

                default:
                    return "...";
            }
        }

    }
}
