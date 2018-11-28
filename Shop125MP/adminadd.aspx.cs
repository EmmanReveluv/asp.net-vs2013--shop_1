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
    public partial class adminadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                using (SqlCommand cmd = new SqlCommand("productAdd", con))
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

                    cmd.Parameters.Add("@PName", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PCateg", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PQuantity", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@PDescription", SqlDbType.Text);
                    cmd.Parameters.Add("@PFeat", SqlDbType.Int);
                    cmd.Parameters.Add("@PPrice", SqlDbType.Decimal);
                    cmd.Parameters.Add("@PImgPath", SqlDbType.Text);

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
    }
}