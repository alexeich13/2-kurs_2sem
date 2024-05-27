using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace lab2
{
	public class Organization : IStaff
	{
		public int Id { get; set; }

		public string Name { get; protected set; }
		public Type ShortName { get; protected set; }

		public string Address
		{
			get; protected set;
		}
		public DateTime timeStramp { get; protected set; }

		public Organization()
		{
			Name = string.Empty;
			ShortName = null;
			Address = string.Empty;
			timeStramp = DateTime.Now;
		}

		public Organization(Organization organization)
		{
			Name = organization.Name;
			ShortName = organization.ShortName;
			Address = organization.Address;
			timeStramp = organization.timeStramp;
		}

		public Organization(string name, Type shortName, string address)
		{
			Name = name;
			ShortName = shortName;
			Address = address;
			timeStramp = DateTime.Now;
		}

		public void Printinfo()
		{
			Console.WriteLine($"Name: {Name}, ShortName: {ShortName}, Address: {Address}");


		}

		public int GetJobVacancies()
		{
			throw new NotImplementedException();
		}

		public void GetEmploee()
		{
			throw new NotImplementedException();
		}

		public void GetJobTitle()
		{
			throw new NotImplementedException();
		}

		public bool OpenJob()
		{
			throw new NotImplementedException();
		}

		public int CloseJob()
		{
			throw new NotImplementedException();
		}
	}
}
