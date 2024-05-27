using System;
using System.Collections.Generic;
using System.Text;

namespace lab1
{
    interface I1
    {
        int Id { get; set; }
        void MethodName();
        event EventHandler Ev;
        int this[int index] { get; set; }
    }
}
