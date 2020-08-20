using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PROVISO.LMSApi.Models
{
    public class TransactionLog
    {
        public string TransactionType { get; set; } = "momo";
        public string MNO { get; set; } = "";
        public string RefNo { get; set; }
        public string AccountNo { get; set; }
        public decimal Amount { get; set; } 
        public string TransactionID { get; set; }
        public string ResponseMessage { get; set; }
    }
}