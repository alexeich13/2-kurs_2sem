using System;
using System.Collections.Generic;
using System.Text;

namespace lab1
{
    class C1
    {
        private const int NUMBER = 13;
        public const string NAME = "Alexey";
        protected const string SURNAME = "Drozd";
        private string border;
        public string height;
        protected int weight;
        private string Age { get; set; }
        public string Password { get; set; }
        protected string Type { get; set; }
        public C1()
        {
        }
        public C1(C1 obj)
        {
            Age = obj.Age;
            Password = obj.Password;
            Type = obj.Type;
        }
        public C1(string age, string password, string type)
        {
            Age = age;
            Password = password;
            Type = type;
        }
        private void Print()
        {
            Console.WriteLine("Id: {0}, Name: {1}, Surname: {2}", Age, Password, Type);
        }
        public void PrintInfo()
        {
            Console.WriteLine("Number: {0}, Name: {1}, Surname: {2}", NUMBER, NAME, SURNAME);
        }
        protected void Printer()
        {
            Console.WriteLine("Type");
        }
    }                                                                                                                       
}
