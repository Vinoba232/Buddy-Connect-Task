using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqTaskEF.Models
{
    public class MonthWiseReport
    {
        public int Month { get; set; }
        public IEnumerable<string> CustomerName { get; set; }
        public decimal? Amount { get; set; }
    }
}