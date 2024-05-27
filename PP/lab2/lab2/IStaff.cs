using System;
using System.Collections.Generic;
using System.Text;

namespace lab2
{
    internal interface IStaff
    {
        int GetJobVacancies();
        void GetEmploee();
        void GetJobTitle();
        bool OpenJob();
        int CloseJob();
    }
}
