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
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                getCart();
            }
            else
                btnLogout.Text = "Login";
            if (Request.QueryString["comment"] =="1")
            {
                lblError.Visible = true;
                lblError.Text = "Message sent!";
                lblError.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#contact';", true);

            }

            //string uname= Request.QueryString["id"];
            //lblWelcome.Text = "Welcome, " + Request.Cookies["info"]["userName"];
        }
        public void getCart()
        {
         string cart = "";
         int size=0;
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

        protected void btnComputers_Click(object sender, EventArgs e)
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

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/home.aspx");
        }

        protected void btnCateg_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/categories.aspx");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/cart.aspx");
        }

        protected void btnMessage_Click(object sender, EventArgs e)
        {
            lblError.ForeColor = System.Drawing.Color.Red;  
            if (txtEmail.Text == "")
            {
                lblError.Text = "Enter your email";
                lblError.Visible=true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#contact';", true);

            }
            else if (txtName.Text == "")
            {
                lblError.Text = "Enter your name";
                lblError.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#contact';", true);

            }
            else if (txtMessage.Text == "")
            {
                lblError.Text = "Enter a message";
                lblError.Visible = true;                
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#contact';", true);

            }
            else
            {
                lblError.Visible = false;
                // try
                //{
                int success = 0;
                string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("addContact", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@name", SqlDbType.VarChar,50);
                        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@comment", SqlDbType.Text);
                        cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;


                        cmd.Parameters["@name"].Value = txtName.Text;
                        cmd.Parameters["@email"].Value = txtEmail.Text;
                        cmd.Parameters["@comment"].Value = txtMessage.Text;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                        if (success == 1)
                        {
                            Response.Redirect("~/home.aspx?comment=1");

                        }
                        
                    }

                }
            }
        }
    }
}