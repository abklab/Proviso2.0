﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace PROVISO.LMSApi.Models
{
    public class BankTransaction
    {
        public int EntryID { get; set; }

        [Required]
        public string RefNo { get; set; }

        [Required]
        public decimal Amount { get; set; }

        [Required]
        public string B_AccountNumber { get; set; }

        public string LastUpdated { get; set; }

        public string TransactionID { get; set; }
    }
}