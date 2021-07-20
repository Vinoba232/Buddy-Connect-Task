using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace LinqTask
{
    public class Program
    {
        string conString;
        SqlConnection con;
        SqlCommand cmd;
        public Program()
        {
            conString = @"Server=DESKTOP-VFQK3GO\SQLEXPRESS;Integrated Security=true;Database=Inventory";
            con = new SqlConnection(conString);
            cmd = new SqlCommand("select * from Product", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            
        }
        public static void Main(string[] args)
        {
            //CreateHostBuilder(args).Build().Run();
        }

        public void CustomerPurchases()
        {

        }
        //public static IHostBuilder CreateHostBuilder(string[] args) =>
        //    Host.CreateDefaultBuilder(args)
        //        .ConfigureWebHostDefaults(webBuilder =>
        //        {
        //            webBuilder.UseStartup<Startup>();
        //        });
    }
}
