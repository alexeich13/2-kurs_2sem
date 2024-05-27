using System;

namespace lab1
{   
    class Program
    {
        static void Main(string[] args)
        {
            C1 c1 = new C1();
            c1.Password = "hjfkskkd";
            c1.PrintInfo();

            C1 c2 = new C1("18", "ghdjkks", "manager");
            c2.PrintInfo();

            C1 c3 = new C1(c2);
            c3.PrintInfo();
            //Задание 3//
            C2 c4 = new C2();
            c4.Password = "dgjfkkas";
            c4.PrintInfo();

            c4.PrintI();
            //Задание 4//
            C4 c5 = new C4();
            c5.Password = "ewrebt";
            c5.PrintInfo();
        }
    }
}
