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
    public partial class checkout : System.Web.UI.Page
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

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }

        protected void deleteCart()
        {
            string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("deleteCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    cmd.Parameters.Add("@user", SqlDbType.VarChar, 40);

                    cmd.Parameters["@user"].Value = Request.Cookies["info"]["userName"];
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Response.Redirect("~/cart.aspx?confirm=1");        
        }
        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "")
            {
                lblErr.Text = "Please enter your name.";
            }
            else if (txtEmail.Text == "")
            {
                lblErr.Text = "Please enter your email address.";
            }
            else if (txtAd1.Text == "")
            {
                lblErr.Text = "Please enter your address.";
            }
            else if (ddlCCType.Text == "")
            {
                lblErr.Text = "Please enter a valid credit card type";
            }
            else if (txtCCNum.Text == "")
            {
                lblErr.Text = "Please enter a valid credit card number";
            }
            else if (txtCCEx.Text == "")
            {
                lblErr.Text = "Please enter a valid credit card expiration date";
            }
            else if (txtCCSec.Text == "")
            {
                lblErr.Text = "Please enter a valid credit card security code";
            }
            else
            {
                //credit card validation
                if (ddlCCType.Text == "Visa" && txtCCNum.Text.StartsWith("4") && (txtCCNum.Text.Length == 13 || txtCCNum.Text.Length == 16))
                {
                    deleteCart();
                }
                else if (ddlCCType.Text == "Mastercard" && txtCCNum.Text.StartsWith("5") && (txtCCNum.Text.Length == 16))
                {
                    deleteCart();
                }
                else if (ddlCCType.Text == "Discover" && (txtCCNum.Text.StartsWith("6011") || txtCCNum.Text.StartsWith("644") || txtCCNum.Text.StartsWith("65")) && txtCCNum.Text.Length == 16)
                {
                    deleteCart();
                }
                else if (ddlCCType.Text == "American Express" && (txtCCNum.Text.StartsWith("3") || txtCCNum.Text.StartsWith("37")) && txtCCNum.Text.Length == 15)
                {
                    deleteCart();
                }
                else
                {
                    lblErr.Text = "You have entered the wrong credit card information";
                }

                
            }
        }
    }
}