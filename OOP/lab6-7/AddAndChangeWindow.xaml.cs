using Microsoft.Win32;
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
using System.Windows.Shapes;

namespace Laba_6_7
{
    /// <summary>
    /// Логика взаимодействия для AddAndChangeWindow.xaml
    /// </summary>
    /// 
    public partial class AddAndChangeWindow : Window
    {
        OpenFileDialog openFileDialog = new OpenFileDialog();

        public AddAndChangeWindow()
        {
            InitializeComponent();
            openFileDialog.Filter = "Фотографии|*.jpg;*.png;*.jpeg;";
        }

        private void OpenExplorer(object sender, RoutedEventArgs e)
        {
            if (openFileDialog.ShowDialog() == true)
            {
                try
                {
                    ProductsPhoto.Source = new BitmapImage(new Uri(openFileDialog.FileName, UriKind.Absolute));
                }
                catch
                {
                    MessageBox.Show("Выберите файл формата", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void addProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Product Product = new Product();
                Product.Name = name.Text;
                var num = 0;
                if (!int.TryParse(price.Text, out num))
                {
                    throw new Exception("Не удовлетворяет условию");
                }
                Product.Price = Convert.ToDouble(price.Text);
                Product.TypeOfProduct = typeOfProduct.Text;
                Product.Rating = Math.Round(rating.Value, 2);
                Product.PhotoPath = openFileDialog.FileName;
                Product.Description = description.Text;
               
                Control.AddProduct(Product);
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
