using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Windows;
using LinqTaskEF.Models;

namespace LinqTaskEF.Controllers
{
    public class InventoryController : Controller
    {
        // GET: Inventory
        public ActionResult Index()
        {            
            return View();
        }
        public ActionResult PurchaseList()
        {
            using(InventoryEntities db=new InventoryEntities())
            {
                List<ListOfPurchase> Purchase = new List<ListOfPurchase>();
                 Purchase = (from p in db.Products
                               from c in db.Customers
                               from po in db.PurchaseOrders
                               from pod in db.PurchaseOrderDetails
                               where c.CustomerId == po.CustomerId && po.PurchaseOrderId == pod.PurchaseOrderId && pod.ProductId == p.ProductId
                               select new ListOfPurchase
                               {
                                   CustomerName = c.Name,
                                   POID = po.PurchaseOrderId,
                                   ProductName = p.Name,
                                   Price = p.Price.ToString()
                               }).ToList();
                return View(Purchase);
            }           
        }
        public ActionResult MonthWiseReport()
        {
            List<MonthWiseReport> monthWiseReports = new List<MonthWiseReport>();
            using (InventoryEntities db = new InventoryEntities())
            {
                monthWiseReports = (from po in db.PurchaseOrders
                                    from c in db.Customers
                                    where c.CustomerId == po.CustomerId
                                    orderby po.Date.Value.Month
                                    //grouping by month and Customer id
                                    //Customer report for each month
                                    group new { po,c } by new { po.Date.Value.Month, c.CustomerId} into g
                                    select new MonthWiseReport
                                    {
                                        Month=g.Key.Month,
                                        CustomerName = g.Select(p=>p.c.Name),
                                        Amount=g.Sum(p=>p.po.Amount)
                                       
                                    }).ToList();
            }
            return View(monthWiseReports);
        }
        public ActionResult ProductSalesMonthWise()
        {
            List<ProductSalesMonthWise> productSales = new List<ProductSalesMonthWise>();
            using(InventoryEntities db = new InventoryEntities())
            {
                productSales = (from po in db.PurchaseOrders
                                from pod in db.PurchaseOrderDetails
                                from p in db.Products
                                where po.PurchaseOrderId == pod.PurchaseOrderId && pod.ProductId == p.ProductId
                                orderby po.Date.Value.Month
                                group new { p,pod } by new {po.Date.Value.Month,pod.ProductId} into g
                                
                                select new ProductSalesMonthWise
                                {
                                    Month = g.Key.Month,
                                    ProductName = g.Select(p=>p.p.Name),
                                    Quantity = g.Select(p=>p.pod.Quantity)
                                }).ToList();
            }
            return View(productSales);
        }
        public ActionResult ProductNameAsc()
        {
            List<ProductList> products = new List<ProductList>();
            using(InventoryEntities db = new InventoryEntities())
            {
                products = (from p in db.Products
                            orderby p.Name
                            select new ProductList
                            { 
                                Product = p.Name 
                            }).ToList();
            }
            return View(products);
        }
        public ActionResult MaxOrderPrice()
        {
            List<MaxOrderPrice> maxOrders = new List<MaxOrderPrice>();
            using(InventoryEntities db = new InventoryEntities())
            {
                maxOrders = (from po in db.PurchaseOrders
                             from pod in db.PurchaseOrderDetails
                             where po.PurchaseOrderId == pod.PurchaseOrderId
                             group new { po, pod } by new { po.Date.Value.Month} into g
                             let max = g.Max(y => y.pod.Price)
                             orderby max descending
                             let Maxgrp = g.FirstOrDefault()
                             let Month = Maxgrp.po.Date.Value.Month
                             let PoId = Maxgrp.po.PurchaseOrderId
                             let Price = Maxgrp.pod.Price

                             select new MaxOrderPrice
                             {
                                 Month = Month,
                                 POID=PoId,
                                 Price=Price

                             }).ToList();
                             
            }
            return View(maxOrders);
        }
    }
}