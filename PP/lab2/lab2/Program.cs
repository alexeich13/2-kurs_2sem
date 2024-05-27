using System;

namespace lab2
{
    class Program
    {
        static void Main(string[] args)
        {
			Organization organization = new Organization();
			University university = new University();
			Department department = new Department();
			Faculty faculty = new Faculty();
			faculty.AddDepartment(department);
			organization.Printinfo();
			faculty.Printinfo();
		}
    }
}
