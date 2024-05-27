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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Binding binding = new Binding();
        public MainWindow()
        {
            InitializeComponent();
            Control.Loading(listOfProducts);
            CustomCommands.Initialize(Application.Current);
            Clear();
        }

        private void AddProduct_Click(object sender, RoutedEventArgs e)
        {
            AddAndChangeWindow window = new AddAndChangeWindow();
            window.Show();
        }

        private void SearchProduct_Click(object sender, RoutedEventArgs e)
        {
            SearchWindow searchWindow = new SearchWindow();
            searchWindow.ShowDialog();
        }

        private void Sort_Click(object sender, RoutedEventArgs e)
        {
            SortWindow sortWindow = new SortWindow();
            sortWindow.ShowDialog();
        }

        private void ClearFields_Click(object sender, RoutedEventArgs e)
        {
            //Control.RefreshList(Control.Products);
            Clear();
        }

        private void listOfProducts_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FromBingingToProduct();

            infoName.Text = Control.Product.Name;
            infoPrice.Text = Convert.ToString(Control.Product.Price);
            infoTypeOfProduct.Text = Control.Product.TypeOfProduct;
            infoRating.Text = Convert.ToString(Control.Product.Rating);
            infoImage.Source = new BitmapImage(new Uri(Control.Product.PhotoPath, UriKind.Absolute));
            infoDescription.Text = Control.Product.Description;
        }

        private bool FromBingingToProduct()
        {
            if (listOfProducts.SelectedItem != null)
            {
                binding.Source = listOfProducts.SelectedItem;
                Control.Product = listOfProducts.SelectedItem as Product;
                infoDescription.Text = Control.Product.Description;
                return true;
            }

            return false;
        }

        private void Clear()
        {
            infoName.Text = "";
            infoPrice.Text = "";
            infoTypeOfProduct.Text = "";
            infoRating.Text = "";
            infoImage.Source = new BitmapImage(new Uri("C:\\BSTU\\2 kurs\\lab6-7\\Resources\\depositphotos_49216253-stock-illustration-blue-rays-background.jpg", UriKind.Absolute));
            infoDescription.Text = "";
        }

        private void DeleteProduct_Click(object sender, RoutedEventArgs e)
        {
            if (FromBingingToProduct())
            {
                Control.DeleteProduct();
                Clear();
            }
        }

        private void ChangeProduct_Click(object sender, RoutedEventArgs e)
        {
            if (FromBingingToProduct())
            {
                ChangeProduct window = new ChangeProduct();
                window.Show();
            }
        }


        private Uri selectedLanguage = new Uri("Russian.xaml", UriKind.Relative);
        private Uri selectedTheme = new Uri("Theme1.xaml", UriKind.Relative);

        private void SwitchToRussian(object sender, RoutedEventArgs e)
        {
            selectedLanguage = new Uri("Russian.xaml", UriKind.Relative);
            LoadResourceDictionaries();
        }

        private void SwitchToEnglish(object sender, RoutedEventArgs e)
        {
            selectedLanguage = new Uri("English.xaml", UriKind.Relative);
            LoadResourceDictionaries();
        }

        private void SwitchToLightTheme(object sender, RoutedEventArgs e)
        {
            selectedTheme = new Uri("Theme1.xaml", UriKind.Relative);
            LoadResourceDictionaries();
        }

        private void SwitchToDarkTheme(object sender, RoutedEventArgs e)
        {
            selectedTheme = new Uri("Theme2.xaml", UriKind.Relative);
            LoadResourceDictionaries();
        }

        private void LoadResourceDictionaries()
        {
            ResourceDictionary language = new ResourceDictionary();
            ResourceDictionary theme = new ResourceDictionary();

            language.Source = selectedLanguage;
            theme.Source = selectedTheme;

            Application.Current.Resources.MergedDictionaries.Add(language);
            Application.Current.Resources.MergedDictionaries.Add(theme);
        }

        private void Redo_Click(object sender, RoutedEventArgs e)
        {
            Control.Redo();
            Clear();
        }

        private void Undo_Click(object sender, RoutedEventArgs e)
        {
            Control.Undo();
            Clear();
        }

        private void Outer_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Click to Outer!");
        }

        private void Tunneling_MouseDown(object sender, RoutedEventArgs e)
        {
            MessageBox.Show(sender.ToString() + "\n" + e.Source.ToString() + "\n\n");
        }

        private void First_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("1");
        }

        private void Second_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("2");
        }

        private void Third_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("3");
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
