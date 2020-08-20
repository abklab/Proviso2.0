namespace PROVISO.LMSApi.Models
{
    public class LoanApplication
    {
        public int ApplicationID { get; set; }
        public string FullName { get; set; }
        public string RequestAmount { get; set; }
        public string SectorID { get; set; }
        public string ContactNumber { get; set; }
        public string Location { get; set; }
        public string NearestLandmark { get; set; }
        public string DistributionMode { get; set; }
        public string MNO { get; set; }
        public string MomoNumber { get; set; }
        public string BankAccountNumber { get; set; }
        public string RequestDate { get; set; }
        public string Comments { get; set; }
    }
}