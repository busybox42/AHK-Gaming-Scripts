using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MouseKeyboardLibrary;

namespace GW2_Combat_Mode
{
    [Serializable]
    public class CombatSettings
    {
        public bool restrictMouse = false;
        
        public decimal vizorOffset = 160;
        
        public string vizorImage = "Crosshairs\\ring.png";
        
        public bool showVizorOOC = false;

        public KeyBinding toggleWindow = new KeyBinding(BindingEventType.KeyDown, new KeyEventArgs(Keys.Pause));

        public KeyBinding toggleCombat = new KeyBinding(BindingEventType.KeyDown, new KeyEventArgs(Keys.Tab));

        public KeyBinding toggleVizor = new KeyBinding(BindingEventType.KeyDown, new KeyEventArgs(Keys.Home));

        public KeyBinding leftMouse = new KeyBinding(BindingEventType.None, null);

        public KeyBinding rightMouse = new KeyBinding(BindingEventType.None, null);

        public KeyBinding middleMouse = new KeyBinding(BindingEventType.None, null);

        public KeyBinding scrollUp = new KeyBinding(BindingEventType.None, null);

        public KeyBinding scrollDown = new KeyBinding(BindingEventType.None, null);

        public bool enableCombatUsingSkills = false;

        public bool toggleCombatSwapping = false;

        public bool disableCombatUsingUI = false;

        public bool startMinimized = false;

        public bool exitClosingGW2 = false;




    }
}
