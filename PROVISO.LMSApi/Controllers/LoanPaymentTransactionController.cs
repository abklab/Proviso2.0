using PROVISO.LMSApi.Models;
using System;
using System.Net;
using System.Web.Http;
using System.Web.Http.Description;

namespace PROVISO.LMSApi.Controllers
{
    [RoutePrefix("provisio/api/v1000/_transactions")]
    public class LoanPaymentTransactionController : ApiController

    {
        TransactionServices services = new TransactionServices();

        //    // GET: LoanPaymentTransaction
        //    [Route("get_transactons")]
        //    [ResponseType(typeof(Transactions))]
        //    public IHttpActionResult Get()
        //    {
        //        var list = services.GetTransactions();
        //        return Ok(list);
        //    }

        /// <summary>
        /// Get Bank repayment By RefNo
        /// </summary>
        /// <param name="ref_number"></param>
        /// <returns>Momo repayment Account</returns>       
        [ResponseType(typeof(MomoTransaction))]
        [Route("maccount/{ref_number}/mp-500")]
        public IHttpActionResult GetByMomoNumber(string ref_number)
        {
            var transaction = services.GetMomoTransactionByRefNo(ref_number);
            if (transaction == null)
                return StatusCode(HttpStatusCode.NotFound);
            return Ok(transaction);
        }

        /// <summary>
        /// Get Bank Repayment By RefNo
        /// </summary>
        /// <param name="ref_number"></param>
        /// <returns>Bank Account</returns>   
        [ResponseType(typeof(BankTransaction))]
        [Route("baccount/{ref_number}/bp-100")]
        public IHttpActionResult GetByBankAccount(string ref_number)
        {
            var transaction = services.GetBankTransactionByRefNo(ref_number);
            if (transaction == null)
                return StatusCode(HttpStatusCode.NotFound);
            return Ok(transaction);
        }


        // POST: api/LoanPaymentTransaction
        [Route("_bankpost/bp-100/repayments")]
        public IHttpActionResult PostBankAccount([FromBody]BankTransaction banktransaction)
        {
            if (string.IsNullOrWhiteSpace(banktransaction.B_AccountNumber))
                return StatusCode(HttpStatusCode.BadRequest);
            else
            {
                var result = services.PostBankTransaction(banktransaction);

                string responseTime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");

                return result == "Success" ? Ok($"S-100-B {responseTime}") : Ok($"R-500-B {responseTime}");
            }
        }

       
        // POST: api/LoanPaymentTransaction
        [Route("_momopost/mp-500/repayments")]
        public IHttpActionResult PostByMomoNumber([FromBody]MomoTransaction momotransaction)
        {
            if (momotransaction == null)
            {
                return BadRequest("Invalid body ");
            }
            var transLog = new TransactionLog()
            {
                AccountNo = momotransaction.MomoNumber,
                Amount = momotransaction.Amount,
                MNO = momotransaction.MNO,
                RefNo = momotransaction.RefNo,
                TransactionType = "momo",
                TransactionID = momotransaction.TransactionID
            };


            if (string.IsNullOrWhiteSpace(momotransaction.MomoNumber) || !services.IsValidPhoneNumber(momotransaction.MomoNumber))
            {
                transLog.ResponseMessage = "Invalid Momo number";
                services.LogTransaction(transLog);
                return BadRequest("Invalid MOMO Number: " + momotransaction.MomoNumber);
            }

            var isvalid = services.ValidateCustomerReferenceID(momotransaction.RefNo);
            if (!isvalid)
            {
                transLog.ResponseMessage = "Invalid Reference number";
                services.LogTransaction(transLog);
                return BadRequest("Invalid Reference Number: " + momotransaction.RefNo);
            }

            var result = services.PostMomoTransaction(momotransaction);

            string responseTime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");
            var response = result == "Success" ? $"S-100-M {responseTime}" : $"R-500-M {responseTime}";

            transLog.ResponseMessage = response; ;
            services.LogTransaction(transLog);

            return Ok(response);
        }

        // POST: api/LoanRequestTransaction
        [HttpPost]
        [Route("_services/2020/loanrequest")]
        public IHttpActionResult PostLoanRequests([FromBody]LoanApplication loanApplication)
        {
            // if(!ModelState.IsValid)
            if (string.IsNullOrWhiteSpace(loanApplication.FullName))
                return StatusCode(HttpStatusCode.BadRequest);
            else
            {
                var result = services.SaveLoanRequest(loanApplication);

                string responseTime = DateTime.Now.ToString("dd-MM-yyyy hh:mm:ss tt");

                return result == "Success" ? Ok($"S-100-M {responseTime}") : Ok($"R-500-M {responseTime}. Something went wrong.");
            }
        }


    }
}
