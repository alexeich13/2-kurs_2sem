using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Laba_6_7
{
    /// <summary>
    /// Логика взаимодействия для Box.xaml
    /// </summary>
    public partial class Box : UserControl
    {
        public static readonly DependencyProperty NumberProperty;
        public Box()
        {
            InitializeComponent();
        }
        static Box() //регистрируем свойство 
        {
            FrameworkPropertyMetadata metadata = new FrameworkPropertyMetadata();
            metadata.CoerceValueCallback = new CoerceValueCallback(CorrectValue);

            NumberProperty = DependencyProperty.Register("Number", typeof(int), typeof(Box),
                metadata, new ValidateValueCallback(ValidateValue));
        }

        private static bool ValidateValue(object value)
        {
            int currentValue = (int)value;
            if (currentValue >= 0)
                return true;
            else
            {
                throw new Exception();
            }
        }
        private static object CorrectValue(DependencyObject d, object baseValue)
        {
            int currentValue = (int)baseValue;
            if (currentValue > 99999)
                return 99999;
            return currentValue;
        }
        public int Text
        {
            get { return (int)GetValue(NumberProperty); }
            set { SetValue(NumberProperty, value); }
        }
    }
}
