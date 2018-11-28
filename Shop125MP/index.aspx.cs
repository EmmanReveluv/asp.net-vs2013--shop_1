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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cart = "";
            int size = 0;
            if (Request.Cookies["info"] != null)
            {
                Response.Redirect("~/home.aspx");
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

        protected void regBTN_Click(object sender, EventArgs e)
        {
            if (txtUnameNew.Text != "" &&
                txtPasswordNew.Text != "" &&
                txtEmail.Text != "" &&
                txtPhone.Text != "" &&
                (txtPasswordNew.Text == txtPasswordConfirm.Text))
            {
                try
                {
                    int success = 0;
                    string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        using (SqlCommand cmd = new SqlCommand("addlogin", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;

                            cmd.Parameters.Add("@vchUname", SqlDbType.VarChar, 40);
                            cmd.Parameters.Add("@vchPass", SqlDbType.VarChar, 40);
                            cmd.Parameters.Add("@vchEmail", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@intPhone", SqlDbType.VarChar, 50);
                            cmd.Parameters.Add("@ret", SqlDbType.Int).Direction = ParameterDirection.Output;

                            cmd.Parameters["@vchUname"].Value = txtUnameNew.Text;
                            cmd.Parameters["@vchPass"].Value = txtPasswordNew.Text;
                            cmd.Parameters["@vchEmail"].Value = txtEmail.Text;
                            cmd.Parameters["@intPhone"].Value = txtPhone.Text;
                            con.Open();

                            cmd.ExecuteNonQuery();
                            success = Convert.ToInt32(cmd.Parameters["@ret"].Value);
                            if (success == 1)
                            {
                                lblErrorReg.Text = "Registration Success!";
                                lblErrorReg.ForeColor = System.Drawing.Color.Green;
                                lblErrorReg.Visible = true;
                                txtUnameNew.Text = "";
                                txtPasswordNew.Text = "";
                                txtEmail.Text = "";
                                txtPhone.Text = "";
                                txtPasswordConfirm.Text = "";
                            }
                        }

                    }
                }
                catch
                {
                    lblErrorReg.Visible = true;
                    lblErrorReg.Text = "Registration Error, username already used";
                }
            }
            else
            {
                lblErrorReg.Visible = true;
                lblErrorReg.Text = "Please input values on the registration fields";
            }
        }

        protected void txtUnameNew_TextChanged(object sender, EventArgs e)
        {
        }

        protected void loginBtn_Click(object sender, EventArgs e)
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
        protected void loginBtn_Click1(object sender, EventArgs e)
        {
            try
            {
                int login = 0;
                string userType = "0";
                string constring = ConfigurationManager.ConnectionStrings["coe125ConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constring))
                {
                    using (SqlCommand cmd = new SqlCommand("checkUser", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        cmd.Parameters.Add("@vchUname", SqlDbType.VarChar, 40);
                        cmd.Parameters.Add("@vchPass", SqlDbType.VarChar, 40);
                        cmd.Parameters.Add("@login", SqlDbType.Int).Direction = ParameterDirection.Output;

                        cmd.Parameters["@vchUname"].Value = txtUname.Text;
                        cmd.Parameters["@vchPass"].Value = txtPassword.Text;
                        con.Open();

                        cmd.ExecuteNonQuery();
                        login = Convert.ToInt32(cmd.Parameters["@login"].Value);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                        {
                            userType = dr["boolType"].ToString();

                        }
                        if (login == 1)
                        {
                            lblError.Visible = true;
                            lblError.Text = "Login Success!";
                            lblError.ForeColor = System.Drawing.Color.Green;
                            Response.Cookies["info"]["userName"] = txtUname.Text;
                            Response.Cookies["info"].Expires = DateTime.Now.AddDays(1);
                            if (userType == "1")
                                Response.Redirect("~/adminhome.aspx");
                            else
                                Response.Redirect("~/home.aspx");
                        }
                        else
                        {
                            txtPassword.Text = "";
                            lblError.Visible = true;
                            lblError.ForeColor = System.Drawing.Color.Red;
                            lblError.Text = "Invalid Username or Password";
                        }


                    }

                }
            }
            catch
            {
                lblError.Visible = true;
                lblError.Text = "Login Failed (Database Error)";

            }
        }
    }
}