using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Meditation.To.Relax.RNMeditationToRelax
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNMeditationToRelaxModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNMeditationToRelaxModule"/>.
        /// </summary>
        internal RNMeditationToRelaxModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNMeditationToRelax";
            }
        }
    }
}
