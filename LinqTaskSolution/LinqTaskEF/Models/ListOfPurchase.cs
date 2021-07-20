using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LinqTaskEF.Models
{
    public class ListOfPurchase
    {
        public string CustomerName { get; set; }
        public int POID { get; set; }
        public string ProductName { get; set; }
        public string Price { get; set; }
    }
}