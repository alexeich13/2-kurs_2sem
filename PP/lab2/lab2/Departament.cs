using System;
using System.Collections.Generic;
using System.Text;

namespace lab2
{
    public class Department
    {
            public string NameDepartament { get; set; }
            public string ShortNameDepartament { get; set; }
            public string AddressDepartament { get; set; }
            public Department(string _nameDepartament, string _shortNameDepartament, string _addressDepartament)
            {
                NameDepartament = _nameDepartament;
                ShortNameDepartament = _shortNameDepartament;
                AddressDepartament = _addressDepartament;
            }
            public Department()
            {
                NameDepartament = " ";
                ShortNameDepartament = " ";
                AddressDepartament = " ";
            }
            public string GetInfo()
            {
                return $"NameDepartament: {NameDepartament}, ShortNameDepartament: {ShortNameDepartament}, AddressDepartament: {AddressDepartament}";
            }
    }
}
