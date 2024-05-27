using System;
using System.Collections.Generic;
using System.Text;

namespace lab1
{
    class C3 : C2
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
	class C4 : C3
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
