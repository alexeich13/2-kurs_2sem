using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            try
            {
                string let = textBox1.Text;
                string fsbs = textBox2.Text;
                string ssbs = textBox4.Text;
                textBox1.Text = let.Replace(fsbs, ssbs);
                if (String.IsNullOrEmpty(let))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                int index = Convert.ToInt32(textBox2.Text);
                string search = textBox1.Text;
                char letter = search[index];
                textBox1.Text = Convert.ToString(letter); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                var sogl = "йцкнгшщзхфвпрлджчсмтб";
                string CountSoglsnie = textBox1.Text;
                int c = CountSoglsnie.Count(p => sogl.IndexOf(Char.ToLower(p)) >= 0);
                textBox1.Text = Convert.ToString(c);
                if (String.IsNullOrEmpty(CountSoglsnie))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            try
            {
                string CountWords = textBox1.Text;
                string[] TextMass = CountWords.Split(' ');
                textBox1.Text = Convert.ToString(TextMass.Length);
                if (String.IsNullOrEmpty(CountWords))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                string CountSentence = textBox1.Text;
                string[] SenMass = CountSentence.Split('.', '!', '?');
                textBox1.Text = Convert.ToString(SenMass.Length);
                if (String.IsNullOrEmpty(CountSentence))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                string CountGlsnie = textBox1.Text;
                char[] C = { 'а', 'е', 'ё', 'у', 'ы', 'я', 'и', 'о', 'ю', 'э' };
                int i = 0;
                foreach (char d in CountGlsnie)
                {
                    if (C.Contains(d))
                    {
                        i++;
                    }
                }
                textBox1.Text = Convert.ToString(i);
                if (String.IsNullOrEmpty(CountGlsnie))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                string CountLet = textBox1.Text;
                textBox1.Text = Convert.ToString(CountLet.Length);
                if (String.IsNullOrEmpty(CountLet))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                string let = textBox1.Text;
                string sbstr = textBox2.Text;
                int n = let.IndexOf(sbstr);
                let = let.Remove(n, sbstr.Length);
                textBox1.Text = let;
                if (String.IsNullOrEmpty(let))
                {
                    throw new Exception("Пустая строка.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!");
                return;
            }
        }
    }
}
