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
            if (Convert.ToString(Request.QueryString["flag_value"]) == "load")
            {
                string str_query = "select top 1 balance from pettycash order by ID desc";
                SqlCommand cmd = new SqlCommand(str_query, cnn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count > 0)
                    Response.Write("{'data':'"+ dataSet.Tables[0].Rows[0]["balance"].ToString() + "'}");
                else
                    Response.Write("{'data':'0'}");
            }
            else {
                string jsoninput = Convert.ToString(Request.QueryString["json"]);
                //JObject json = JObject.Parse(jsoninput);
                //var json = JsonConvert.SerializeObject(jsoninput);
                JArray jsonArray = JArray.Parse(jsoninput);

                //var data = JObject.Parse(jsonArray.ToString());
               
                string str_query = String.Empty;
                //SqlDataAdapter da = new SqlDataAdapter(cmd);

                for (int i = 0; i < jsonArray.Count; i++)
                {
                    str_query = $"insert into pettycash values ('{jsonArray[i]["date"]}','{jsonArray[i]["description"]}','{jsonArray[i]["income"]}','{jsonArray[i]["expense"]}','{jsonArray[i]["balance"]}')";
                    SqlCommand cmd = new SqlCommand(str_query, cnn);
                    //SqlDataAdapter da = new SqlDataAdapter(cmd);
                    cmd.ExecuteNonQuery();
                }
                cnn.Close();
            }
            
        }

    }
}