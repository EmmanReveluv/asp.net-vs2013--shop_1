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
    public partial class viewproduct : System.Web.UI.Page
    {
        public void getCart()
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
            if (Request.QueryString["success"] == "1")
            {
                lblErr.Visible = true;
                lblErr.Text = "Product Rating Success!";
                lblErr.ForeColor = System.Drawing.Color.Green;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#comment';", true);

            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["info"] != null)
            {
                getCart();
                string uname = Request.Cookies["info"]["userName"];
                lblSign.Text = "Signed in as: " + uname;
            }
            else
            {
                lblSign.Text = "Please login to post a comment";
                btnAddCart.Visible = false;
                btnPost.Visible = false;
                btnLogout.Text = "Login";
            }
                string pd = "", pn = "", pp = "", pc = "", pi = "", pq = "";
                string pid = Request.QueryString["id"];
                //lblPID.Text = pid;
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
                        }
                        //cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
                lblPname.Text = pn;
                lblPcateg.Text = pc;
                lblPprice.Text = pp;
                lblPdesc.Text = pd;
                Pimg.ImageUrl = pi;
                int quant = Convert.ToInt32(pq);
                if (quant <= 0)
                {
                    btnAddCart.Visible = false;
                    lblNoStock.Visible = true;
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

        protected void btnPost_Click(object sender, EventArgs e)
        {

            string uname = Request.Cookies["info"]["userName"];
            if (ddlRating.Text != "0" && txtComment.Text != "")
            {
                lblErr.Visible = false;
                string id = Request.QueryString["id"];
                // try
                //{
                int success = 0;
                string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("addComment", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("@pid", SqlDbType.Int);
                        cmd.Parameters.Add("@rating", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@comment", SqlDbType.Text);
                        cmd.Parameters.Add("@uname", SqlDbType.VarChar, 50);
                        cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                        cmd.Parameters["@pid"].Value = Request.QueryString["id"];
                        cmd.Parameters["@rating"].Value = ddlRating.Text;
                        cmd.Parameters["@comment"].Value = txtComment.Text;
                        cmd.Parameters["@uname"].Value = Request.Cookies["info"]["userName"];
                        con.Open();

                        cmd.ExecuteNonQuery();
                        success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                        if (success == 1)
                        {
                            Response.Redirect("~/viewproduct.aspx?id=" + id + "&success=1");
                        }
                    }

                }



            }
            else if (txtComment.Text == "")
            {
                lblErr.ForeColor = System.Drawing.Color.Red;
                lblErr.Text = " Please enter a comment";
                lblErr.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#comment';", true);
            }
            else if (ddlRating.Text == "0")
            {
                lblErr.ForeColor = System.Drawing.Color.Red;
                lblErr.Text = " Please choose a rating";
                lblErr.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "hash", "location.hash = '#comment';", true);
            }

            //}
            //catch
            //{                
            //     Response.Redirect("~/viewproduct.aspx?id="+ id+"success");
            //}
        }

        protected void btnAddCart_Click(object sender, EventArgs e)
        {

            string id = Request.QueryString["id"];
            int success = 0;
            string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("addCart", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@uname", SqlDbType.VarChar, 50);
                    cmd.Parameters.Add("@pid", SqlDbType.Int);
                    cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                    cmd.Parameters["@uname"].Value = Request.Cookies["info"]["userName"];
                    cmd.Parameters["@pid"].Value = Request.QueryString["id"];
                    con.Open();

                    cmd.ExecuteNonQuery();
                    success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                    if (success == 1)
                    {
                        Response.Redirect("~/viewproduct.aspx?id=" + id + "&added");
                    }
                }
            }
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/cart.aspx");
        }

    }

}