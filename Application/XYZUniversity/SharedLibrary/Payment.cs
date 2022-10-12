using Newtonsoft.Json.Linq;
using System.Data;

namespace SharedLibrary
{
    public class Payment
    {
        public string student_admission_number { get; set; }
        public string bank_swift_code { get; set; }
        public double amount { get; set; }
        public DateTime payment_date { get; set; }
        public string payment_method { get; set; }
        public string channel { get; set; }
        public string transaction_reference { get; set; }
    }

    public class Response
    {
        public bool status { get; set; }
        public string message { get; set; }
        public string code { get; set; }
    }

    public class PaymentResponse
    {
        public bool status { get; set; }
        public string message { get; set; }
        public string code { get; set; }
    }

    public class Search
    {
        public string studentadmissionnumber { get; set; }
    }

    public class RecordsSearch
    {
        public string module { get; set; }
        public string param1 { get; set; }
        public string param2 { get; set; }
        public string param3 { get; set; }
        public string param4 { get; set; }
        public string param5 { get; set; }
    }

    public class RecordsResponse
    {
        public bool status { get; set; }
        public string message { get; set; }
        public string code { get; set; }
        //public JArray records { get; set; }
        public IEnumerable<JToken> records { get; set; }
    }
}