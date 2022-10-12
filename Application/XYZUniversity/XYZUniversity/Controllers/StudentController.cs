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
    public class StudentController : ControllerBase
    {
        // GET: api/<StudentController>
        [HttpGet]
        private IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<StudentController>/5
        [HttpGet("{id}")]
        private string Get(int id)
        {
            return "value";
        }

        // POST api/<StudentController>
        [HttpPost("LoadStudents")]
        public async Task</*RecordsResponse*/JObject> LoadStudents([FromBody] Search value)
        {
            //RecordsResponse response = new RecordsResponse();
            JObject response = new JObject();
            try
            {
                DatabaseConnection db = new DatabaseConnection();
                RecordsSearch search = new RecordsSearch();
                if (value.studentadmissionnumber != null)
                {
                    search.param1 = value.studentadmissionnumber;
                    search.module = "student_records";
                }
                else
                {
                    search.param1 = "";
                    search.module = "student_records";
                }

                DataTable dt = db.GetRecords(search);

                if (dt.Rows.Count <= 0)
                {
                    response.Add("code", "001");
                    response.Add("status", false);
                    response.Add("message", "No records found!");

                    return response;
                }

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
            catch (Exception ex)
            {
                response.Add("code", "001");
                response.Add("status", false);
                response.Add("message", ex.Message);

            }

            return response;
        }


        // PUT api/<StudentController>/5
        [HttpPut("{id}")]
        private void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<StudentController>/5
        [HttpDelete("{id}")]
        private void Delete(int id)
        {
        }
    }
}
