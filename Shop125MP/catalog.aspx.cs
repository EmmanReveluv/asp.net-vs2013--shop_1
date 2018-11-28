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
    public partial class catalog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                string cart = "";
                int size = 0;
                string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("getCart", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);

                        cmd.Parameters.Add("@user", SqlDbType.VarChar, 40);

                        cmd.Parameters["@user"].Value = Request.Cookies["info"]["userName"];
                        con.Open();

                        //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        foreach (DataRow dr in dt.Rows)
                        {
                            size++;
                        }
                        //cmd.ExecuteNonQuery();
                        con.Close();
                        cart = size.ToString();
                        btnCart.Text = "Cart (" + cart + ")";
                    }
                }
            }

            else
                btnLogout.Text = "Login";
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
        void getId()
        { 
        
        
        }

        protected void lblPname_Click(object sender, EventArgs e)
        {
            string arg = ((LinkButton)sender).CommandArgument;
            getId();
        }

    

        protected void Img_Click(object sender, ImageClickEventArgs e)
        {
            getId();
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }
    }
}