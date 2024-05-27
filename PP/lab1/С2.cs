using System;
using System.Collections.Generic;
using System.Text;

namespace lab1
{
    class C2 : C1, I1
	{
		public int Id { get; set; }
		public void MethodName()
		{
			Console.WriteLine("Something");
		}
		public event EventHandler Ev;
		public int this[int index]
		{
			get { return index; }
			set { index = value; }
		}

		public void PrintI()
		{
			this.Printer();
		}
	}
}
