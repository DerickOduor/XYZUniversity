using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SharedLibrary
{
    public class DatabaseConnection
    {
        string systemconnection = "";
        public DatabaseConnection()
        {
            IConfigurationBuilder builder = new ConfigurationBuilder();
            builder.AddJsonFile(Path.Combine(Directory.GetCurrentDirectory(), "appsettings.json"));

            var root = builder.Build();
            systemconnection = root.GetConnectionString("SystemConnection");
        }

        public DataTable MakePayment(Payment payment)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection connection=new SqlConnection(systemconnection))
                {
                    using (SqlCommand command = new SqlCommand("create_payment", connection))
                    {
                        using(SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@student_admission_number", payment.student_admission_number);
                            command.Parameters.AddWithValue("@bank_swift_code", payment.bank_swift_code);
                            command.Parameters.AddWithValue("@amount", payment.amount);
                            command.Parameters.AddWithValue("@payment_date", payment.payment_date);
                            command.Parameters.AddWithValue("@payment_method", payment.payment_method);
                            command.Parameters.AddWithValue("@channel", payment.channel);
                            command.Parameters.AddWithValue("@transaction_reference", payment.transaction_reference);

                            adapter.Fill(dt);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }

            return dt;
        }


        public DataTable GetRecords(RecordsSearch record)
        {
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection connection = new SqlConnection(systemconnection))
                {
                    using (SqlCommand command = new SqlCommand("get_records", connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(command))
                        {
                            command.CommandType = CommandType.StoredProcedure;
                            command.Parameters.AddWithValue("@module", record.module);
                            command.Parameters.AddWithValue("@param1", record.param1);
                            command.Parameters.AddWithValue("@param2", record.param2);
                            command.Parameters.AddWithValue("@param3", record.param3);
                            command.Parameters.AddWithValue("@param4", record.param4);
                            command.Parameters.AddWithValue("@param5", record.param5);
                            
                            adapter.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return dt;
        }
    }
}
