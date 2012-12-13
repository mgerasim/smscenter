using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;
///using System.Data.OracleClient.Types;

namespace FormsAuthAD
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private OracleConnection conn = new OracleConnection();

        protected void Button1_Click(object sender, EventArgs e)
        {
            conn.ConnectionString = "User ID=smscenter;Password=zaq12wsx;Data Source=earchive;Unicode=True;";
            try
            {
                conn.Open();
                OracleDataAdapter DataAdapter = new OracleDataAdapter();
                OracleCommand cmd = new OracleCommand("PKG_WEB.PR_GET_TASKS", conn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //OracleDataReader dr = cmd.ExecuteReader();                

                //OracleParameter name_task = new OracleParameter();
                //name_task.OracleType = OracleType.Cursor;
                //name_task.Direction = ParameterDirection.Output;                
                //cmd.Parameters.Add(name_task);

                DateTime tsk_date_from = new DateTime(2012,3,3);
                DateTime tsk_date_to = new DateTime(2012, 3, 5);
                
                OracleParameter task_type = new OracleParameter("task_type_", OracleType.Float);
                task_type.Direction = ParameterDirection.Input;
                OracleParameter date_from = new OracleParameter("date_from_", OracleType.DateTime);
                date_from.Direction = ParameterDirection.Input;
                OracleParameter date_to = new OracleParameter("date_to", OracleType.DateTime);
                date_to.Direction = ParameterDirection.Input;
                OracleParameter user_id = new OracleParameter("user_id_", OracleType.Float);
                user_id.Direction = ParameterDirection.Input;

                task_type.Value = 1;
                date_from.Value = tsk_date_from;
                date_to.Value = tsk_date_to;
                user_id.Value = 111;
                cmd.Parameters.Add(task_type);
                cmd.Parameters.Add(date_from);
                cmd.Parameters.Add(date_to);
                cmd.Parameters.Add(user_id);

                cmd.Parameters.Add("t_list", OracleType.Cursor).Direction = System.Data.ParameterDirection.Output;

                

                DataAdapter.SelectCommand = cmd;
                try
                {
                    DataTable Table = new DataTable();
                    DataAdapter.Fill(Table);
                    for (int i = 0; i < Table.Rows.Count; i++)
                    {
                        string ddd = Table.Rows[i]["name"].ToString();
                        string ddt = Table.Rows[i]["id"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message.ToString();

                }

                conn.Close();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message.ToString();
                //String testing = "Ошибка" + ex.Message.ToString();
                //ClientScript.RegisterStartupScript(Page.GetType(), "TestAlert", "alert('" + testing + "');", true);
            }
            finally
            {
                conn.Dispose();
            }            
            //conn.Enabled = false;
        }        
    }
}