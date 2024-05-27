using System;
using System.Collections.Generic;
using System.Text;

namespace lab2
{
    public class University : Organization 
    {
            protected List<Faculty> faculties;

            public University()
            {
                faculties = new List<Faculty>();
            }

            public University(University _university) { }

            public University(string _name, string _shortname, string _address) { }

            public bool DelFaculty(int faculty)
            {
                return true;
            }
        public int AddFaculty(Faculty faculty)
        {
            faculties.Add(faculty);
            return 0;
        }
    }
}
