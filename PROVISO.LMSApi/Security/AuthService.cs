using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace PROVISO.LMSApi.Security
{
    public class AuthService
    {
        public string ErrorMessage { get; set; }
        string connectionString = ConfigurationManager.ConnectionStrings["PROVISIO_ConnectionString"].ToString();

        SqlConnection connection;

        DataTable GetData(SqlCommand cmd)
        {
            DataTable data = new DataTable();
            string msg = "";
            try
            {
                connection = new SqlConnection(connectionString);
                using (connection)
                {
                    cmd.Connection = connection;
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(data);

                }
            }
            catch (Exception ex)
            {
                msg = ex.Message;
            }

            return data;
        }

        //Verify apikey
        public bool AuthenticateKey(string apikey)
        {
            var today = DateTime.Today;
            bool isVerified = false;
            DateTime experationDate;

            try
            {
                using (var command = new SqlCommand())
                {
                    command.CommandText = "usp_AuthenticateKey";
                    command.Parameters.AddWithValue("@apikey", apikey);

                    var dt = GetData(command);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        var r = dt.Rows[0];
                        var isActive = (bool)r["IsActive"];
                        var isValidDate = DateTime.TryParse((r["ExpirationDate"]).ToString(), out experationDate);

                        if (isValidDate && experationDate > today && isActive)
                            isVerified = true;
                    }
                }
            }
            catch (Exception ex)
            {
                ErrorMessage = ex.Message;
            }
            return isVerified;
        }
    }
}