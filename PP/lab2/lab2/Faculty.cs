using System;
using System.Collections.Generic;
using System.Text;

namespace lab2
{
    public class Faculty : Organization
    {
		private string _name;
		private string _shortName;
		private string _address;

        protected List<Department> Departments;
		public Faculty()
		{
			Departments = new List<Department>();
			_name = string.Empty;
			_shortName = string.Empty;
			_address = string.Empty;

		}

		Faculty(Faculty faculty)
		{
			_name = faculty.Name;
			_shortName = faculty.ShortName;
			_address = faculty.Address;
			Departments = new List<Department>();
		}
		public Faculty(string name, string shortName, string address)
		{
			_name = name;
			_shortName = shortName;
			_address = address;
			Departments = new List<Department>();
		}
		public new string Name
		{
			get { return _name; }
			set { _name = value; }
		}
		public new string ShortName
		{
			get { return _shortName; }
			set { _shortName = value; }
		}
		public new string Address
		{
			get { return _address; }
			set { _address = value; }
		}
		public int AddDepartment(Department department)
		{
			Departments.Add(department);
			return 0;

		}
		public bool DelDepartment(int index)
		{
			if (index < 0 || index >= Departments.Count)
			{
				return false;
			}
			Departments.RemoveAt(index);
			return true;

		}
		public bool UpdDepartment(int index)
		{
			if (index < 0 || index >= Departments.Count)
			{
				return false;
			}
			Departments[index] = new Department();
			return true;
		}
		private bool VerDepartment(int index)
		{
			if (index < 0 || index >= Departments.Count)
			{
				return false;
			}
			return true;
		}
		public List<Department> GetDepartment()
		{ return Departments; }

		public void PrintInfo()
		{
			Console.WriteLine($"Name: {_name}, ShortName: {_shortName}, Address: {_address}");
			foreach (var item in Departments)
			{
				Console.WriteLine(item.GetInfo());
			}
		}

		public int GetJobVacancies(JobVacancy jobVacancy)
		{
			int count = 0;
			foreach (var item in Departments)
			{
				if (item.NameDepartament == jobVacancy.NameDepartament)
				{
					count++;
				}
			}
			return count;

		}
		public int AssJobTitle(Job title)
		{
			int count = 0;
			foreach (var item in Departments)
			{
				if (item.NameDepartament == title.NameDepartament)
				{
					count++;
				}
			}
			return count;
		}
		public int OpenJobVacansion(JobVacancy jobVacancy)
		{
			int count = 0;
			foreach (var item in Departments)
			{
				if (item.NameDepartament == jobVacancy.NameDepartament)
				{
					count++;
				}
			}
			return count;
		}
		public bool CloseVacansion(int index)
		{
			if (index < 0 || index >= Departments.Count)
			{
				return false;
			}
			Departments.RemoveAt(index);
			return true;
		}
		public Empoloee Recriut(JobVacancy jobVacancy)
		{
			Empoloee empoloee = new Empoloee();
			return empoloee;

		}
		public void Deasmes()
		{
			Departments.Clear();
			_name = string.Empty;
			_shortName = string.Empty;
			_address = string.Empty;
		}

		public new int GetJobVacancies()
		{
			throw new NotImplementedException();
		}

		public new void GetEmploee()
		{
			throw new NotImplementedException();
		}

		public new void GetJobTitle()
		{
			throw new NotImplementedException();
		}

		public new bool OpenJob()
		{
			throw new NotImplementedException();
		}

		public new int CloseJob()
		{
			throw new NotImplementedException();
		}

        
    }
}
