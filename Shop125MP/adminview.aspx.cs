using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace Shop125MP
{
    public partial class adminview : System.Web.UI.Page
    {
        protected void ValidateFund(Object sender, ServerValidateEventArgs e)
        {
            e.IsValid = e.Value.Trim() == "0" || e.Value.Trim() == "10";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string pd = "", pn = "", pp = "", pc = "", pi = "", pq = "", pf="";
                string pid = Request.QueryString["id"];
                //lblPID.Text = pid;
                if (pid != null)
                {
                    string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;

                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("getItem", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);

                            cmd.Parameters.Add("@PID", SqlDbType.Int);

                            cmd.Parameters["@PID"].Value = pid;

                            con.Open();

                            //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                            DataTable dt = new DataTable();
                            da.Fill(dt);

                            foreach (DataRow dr in dt.Rows)
                            {
                                pn = dr["PName"].ToString();
                                pp = dr["PPrice"].ToString();
                                pd = dr["PDescription"].ToString();
                                pc = dr["PCateg"].ToString();
                                pi = dr["PImgPath"].ToString();
                                pq = dr["PQuantity"].ToString();
                                pf = dr["PFeat"].ToString();
                            }
                            //cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                    txtPID.Text = pid;
                    txtPName.Text = pn;
                    txtCateg.Text = pc;
                    txtPrice.Text = pp;
                    txtImgpath.Text = pi;
                    txtQuant.Text = pq;
                    txtDesc.Text = pd;
                    txtFeat.Text = pf;
                }
            }
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpCookie aCookie;
            string cookieName;
            int limit = Request.Cookies.Count;
            for (int i = 0; i < limit; i++)
            {
                cookieName = Request.Cookies[i].Name;
                aCookie = new HttpCookie(cookieName);
                aCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(aCookie);
            }
            Response.Redirect("~/index.aspx");
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {

            txtDesc.Text = txtDesc.Text.Replace(System.Environment.NewLine, "<br />" + System.Environment.NewLine);

            string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("updateProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    
                    //@PID int,
                    //@PName varchar(50),
                    //@PCateg varchar(50),
                    //@PQuantity varchar(50),
                    //@PDescription text,
                    //@PFeat int,
                    //@PPrice decimal,
                    //@PImgPath text

                    cmd.Parameters.Add("@PID", SqlDbType.Int);
                    cmd.Parameters.Add("@PName", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PCateg", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PQuantity", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PDescription", SqlDbType.Text);
                    cmd.Parameters.Add("@PFeat", SqlDbType.Int);
                    cmd.Parameters.Add("@PPrice", SqlDbType.Decimal);
                    cmd.Parameters.Add("@PImgPath", SqlDbType.Text);

                    cmd.Parameters["@PID"].Value = txtPID.Text;
                    cmd.Parameters["@PName"].Value = txtPName.Text;
                    cmd.Parameters["@PCateg"].Value = txtCateg.Text;
                    cmd.Parameters["@PQuantity"].Value = txtQuant.Text;
                    cmd.Parameters["@PDescription"].Value = txtDesc.Text;
                    cmd.Parameters["@PFeat"].Value = txtFeat.Text;
                    cmd.Parameters["@PPrice"].Value = txtPrice.Text;
                    cmd.Parameters["@PImgPath"].Value = txtImgpath.Text;

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("~/adminhome.aspx");
        }

        protected void lnkDelete_Click(object sender, EventArgs e)
        {
            string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
            string id = txtPID.Text;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("deleteProduct", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@PID", SqlDbType.Int);

                    cmd.Parameters["@PID"].Value = id;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("~/adminhome.aspx");
                }
            }
        }
    }

}