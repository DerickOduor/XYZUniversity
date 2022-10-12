using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using SharedLibrary;
using System.Data;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace XYZUniversity.Controllers
{
    //[Route("api/[controller]")]
    [Route("[controller]")]
    [ApiController]
    public class PaymentController : ControllerBase
    {
        // GET: api/<PaymentController>
        [HttpGet]
        private IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<PaymentController>/5
        [HttpGet("{id}")]
        private string Get(int id)
        {
            return "value";
        }

        // POST api/<PaymentController>
        [HttpPost("NotifyPayments")]
        public async Task<Response> Post([FromBody] Payment value)
        {
            try
            {
                Response response = new Response();
                DatabaseConnection db = new DatabaseConnection();

                DataTable dt = db.MakePayment(value);

                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["responsecode"].ToString().Equals("000"))
                    {
                        response = new Response
                        {
                            code = dt.Rows[0]["responsecode"].ToString(),
                            message = dt.Rows[0]["responsemessage"].ToString(),
                            status = true
                        };
                    }
                    else
                    {
                        response = new Response
                        {
                            code = dt.Rows[0]["responsecode"].ToString(),
                            message = dt.Rows[0]["responsemessage"].ToString(),
                            status = false
                        };
                    }
                }
                else
                {
                    response = new Response
                    {
                        code = "001",
                        message = "An error occured",
                        status = false
                    };
                }


                return response;
            }
            catch(Exception ex)
            {
                return new Response
                {
                    code = "001",
                    message = ex.Message,
                    status = false
                };
            }
        }

        // PUT api/<PaymentController>/5
        [HttpPost("LoadPayments")]
        public async Task<JObject> LoadPayments([FromBody] Search value)
        {
            //RecordsResponse response = new RecordsResponse();
            JObject response = new JObject();
            try
            {
                DatabaseConnection db = new DatabaseConnection();
                RecordsSearch search = new RecordsSearch();
                if (value.studentadmissionnumber != null)
                {
                    search.param1=value.studentadmissionnumber;
                    search.module = "payment_records";
                }
                else
                {
                    search.param1 = "";
                    search.module = "payment_records";
                }

                DataTable dt = db.GetRecords(search);

                JArray children = new JArray();
                int i = 0;
                foreach (DataRow row in dt.Rows)
                {
                    JObject child = new JObject();
                    foreach (DataColumn col in dt.Columns)
                    {
                        child.Add(col.ColumnName, dt.Rows[i][col].ToString());
                    }
                    children.Add(child);
                    i++;
                }


                response.Add("code", "000");
                response.Add("status", true);
                response.Add("message", "Success!");
                response.Add("records", children);
                
            }
            catch(Exception ex)
            {
                response.Add("code", "001");
                response.Add("status", false);
                response.Add("message", ex.Message);
                
            }

            return response;
        }

        // DELETE api/<PaymentController>/5
        [HttpDelete("{id}")]
        private void Delete(int id)
        {
        }
    }
}
