using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqTaskEF.Models
{
    public class ProductSalesMonthWise
    {
        public int Month { get; set; }
        public IEnumerable<string> ProductName { get; set; }
        public IEnumerable<int?> Quantity { get; set; }
    }
}