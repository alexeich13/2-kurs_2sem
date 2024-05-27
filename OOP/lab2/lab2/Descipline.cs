using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace lab2
{
    [Serializable]
    public class Descipline
    {
        public Lektor Lektor { get; set; }
        [Required]
        [StringLength(30, ErrorMessage = "Вы ввели слишком короткое название дисциплины", MinimumLength = 2)]
        public string DescName { get; set; }
        public string Sem { get; set; }
        public string Course { get; set; }
        public string Spec { get; set; }
        public string LectionCount { get; set; }
        public string LabCount { get; set; }
        public string Control { get; set; }

        public Descipline ()
        {
            DescName = "NON";
            Sem = "NON";
            Course = "NON";
            Spec = "NON";
            LectionCount = "NON";
            LabCount = "NON";
            Control = "NON";
        }
        public Descipline(Lektor lektor, string descName, string sem, string course, string spec, string lectionCount, string labCount, string control)
        {
            Lektor = lektor;
            DescName = descName;
            Sem = sem;
            Course = course;
            Spec = spec;
            LectionCount = lectionCount;
            LabCount = labCount;
            Control = control;
        }
        public override string ToString()
        {
            return string.Format("DescName: {0} Sem: {1} Course {2} Spec: {3} Lections: {4} Labs: {5} Control: {6} Lektor: {7}", DescName, Sem, Course, Spec, LectionCount, LabCount, Control, Lektor);
        }
    }
}
