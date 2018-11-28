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
    public partial class cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                string succ = Request.QueryString["confirm"];
                string del = Request.QueryString["delete"];
                string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;

                if (succ == "1")
                    lblCheck.Visible = true;
                if (del != null)
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("deleteItem", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            SqlDataAdapter da = new SqlDataAdapter(cmd);

                            cmd.Parameters.Add("@cid", SqlDbType.VarChar, 40);

                            cmd.Parameters["@cid"].Value = del;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }


                string cart = "";
                int size = 0;
                string pid = "";
                decimal price = 0;
                string pd = "", pn = "", pp = "", pc = "", pi = "", pq = "";
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
                        dt.Columns.Add("name", typeof(string));
                        dt.Columns.Add("price", typeof(string));

                        con.Close();
                        foreach (DataRow dr in dt.Rows)
                        {
                            using (SqlConnection con2 = new SqlConnection(constring))
                            {
                                using (SqlCommand cmd2 = new SqlCommand("getItem", con2))
                                {
                                    cmd2.CommandType = CommandType.StoredProcedure;
                                    SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                                    cmd2.Parameters.Add("@PID", SqlDbType.Int);

                                    cmd2.Parameters["@PID"].Value = dr["pid"].ToString();

                                    con2.Open();

                                    //login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                                    DataTable dt2 = new DataTable();
                                    da2.Fill(dt2);

                                    foreach (DataRow dr2 in dt2.Rows)
                                    {
                                        pn = dr2["PName"].ToString();
                                        pp = dr2["PPrice"].ToString();
                                        pd = dr2["PDescription"].ToString();
                                        pc = dr2["PCateg"].ToString();
                                        pi = dr2["PImgPath"].ToString();
                                        pq = dr2["PQuantity"].ToString();
                                    }
                                    dt.Rows[size]["name"] = pn;
                                    dt.Rows[size]["price"] = pp;
                                    price += Convert.ToDecimal(pp);

                                    con2.Close();
                                }
                            }

                            size++;
                        }
                        //cmd.ExecuteNonQuery();
                        cart = size.ToString();
                        btnCart.Text = "Cart (" + cart + ")";
                        ListView1.DataSource = dt;
                        ListView1.DataBind();
                        if (size == 0)
                        {
                            ImbPaypal.Visible = false;
                            btnCheckout.Visible = false;
                            lblHead.Text = "No items on cart";
                            lblPrice.Visible = false;
                            lblTotal.Visible = false;
                        }
                    }
                }

                lblTotal.Text = "PHP " + price.ToString();
            }


            else
            {
                btnLogout.Text = "Login";
                ImbPaypal.Visible = false;
                lblHead.Text = "Please login to view your cart";
                lblHead.Attributes["Font-Italic"] = "true";
                lblPrice.Visible = false;
                btnCheckout.Visible = false;
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

        protected void btnCart_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/cart.aspx");
        }


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/checkout.aspx");
        }

        protected void ImbPaypal_Click(object sender, ImageClickEventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "OpenWindow", "window.open('https://www.paypal.com/','_blank');", true);
        }
    }
}