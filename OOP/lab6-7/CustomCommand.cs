using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace Laba_6_7
{
    public static class CustomCommands
    {
        public static readonly RoutedUICommand ExitApplication = new RoutedUICommand("Выход", "ExitApplication", typeof(CustomCommands));

        static CustomCommands()
        {
            ExitApplication.InputGestures.Add(new KeyGesture(Key.F, ModifierKeys.Control));
        }

        public static void Initialize(Application application)
        {
            CommandManager.RegisterClassCommandBinding(typeof(Window), new CommandBinding(ExitApplication, ExecuteExitApplication, CanExecuteExitApplication));
            application.MainWindow.CommandBindings.Add(new CommandBinding(ExitApplication, ExecuteExitApplication, CanExecuteExitApplication));
        }

        private static void ExecuteExitApplication(object sender, ExecutedRoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private static void CanExecuteExitApplication(object sender, CanExecuteRoutedEventArgs e)
        {
            e.CanExecute = true;
        }
    }
}
