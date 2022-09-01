using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Linq;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace WebApplication1
{
    public partial class Dashboard :System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            string connetionString;
            SqlConnection cnn;
            DataSet dataSet=new DataSet();
            connetionString = "Data Source=172.16.12.14;Initial Catalog=jeevitha_pettycash_manager;User Id=training1;Password=Karomi@123";
            cnn = new SqlConnection(connetionString);
            cnn.Open();
                string str_query = "select * from pettycash  with(nolock)";
                SqlCommand cmd = new SqlCommand(str_query, cnn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dataSet);
            
                var jsonString = JsonConvert.SerializeObject(dataSet, Newtonsoft.Json.Formatting.Indented,
                new JsonSerializerSettings
                {
                    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
                });
            Response.Write(jsonString);
            cnn.Close();
        }

    }
}