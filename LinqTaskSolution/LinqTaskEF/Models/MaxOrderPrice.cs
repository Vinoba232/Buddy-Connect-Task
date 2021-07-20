using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqTaskEF.Models
{
    public class MaxOrderPrice
    {
        public int Month { get; set; }
        public int POID { get; set; }
        public decimal? Price { get; set; }
    }
}