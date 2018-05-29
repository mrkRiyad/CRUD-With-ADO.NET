using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.ComponentModel;

[DataObject(true)]
public static class StudentDB
{
    // For Reading All Students
    [DataObjectMethod(DataObjectMethodType.Select)]
    public static List<Students> GetAllStudents()
    {
        List<Students> stdList = new List<Students>();
        string sql = "Select StudentID, Name, Email, Phone, Subject, SessionYear From Students Order by StudentID";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                Students student;
                while (dr.Read())
                {
                    student = new Students();
                    student.StudentID = Convert.ToInt32(dr["StudentID"]);
                    student.Name = dr["Name"].ToString();
                    student.Email = dr["Email"].ToString();
                    student.Phone = dr["Phone"].ToString();
                    student.Subject = dr["Subject"].ToString();
                    student.SessionYear = Convert.ToInt32(dr["SessionYear"]);
                    stdList.Add(student);
                }
                dr.Close();
            }
        }
        return stdList;
    }
    // For Creating Student
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static void InsertStudent(Students std)
    {
        string sql = "Insert Into Students Values(@Name, @Email, @Phone, @Subject, @SessionYear)";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("Name", std.Name);
                cmd.Parameters.AddWithValue("Email", std.Email);
                cmd.Parameters.AddWithValue("Phone", std.Phone);
                cmd.Parameters.AddWithValue("Subject", std.Subject);
                cmd.Parameters.AddWithValue("SessionYear", std.SessionYear);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
    // For Deleting Student
    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteStudent(Students std)
    {
        //string sql = "Delete From Students Where StudentID = @StudentID And Name = @Name And Email = @Email And Phone = @Phone And Subject = @Subject And SessionYear = @SessionYear)";
        string sql = "Delete From Students Where StudentID = @StudentID";
        int deleteCount = 0;
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("StudentID", std.StudentID);
                //cmd.Parameters.AddWithValue("Name", std.Name);
                //cmd.Parameters.AddWithValue("Email", std.Email);
                //cmd.Parameters.AddWithValue("Phone", std.Phone);
                //cmd.Parameters.AddWithValue("Subject", std.Subject);
                //cmd.Parameters.AddWithValue("SessionYear", std.SessionYear);
                con.Open();
                deleteCount = cmd.ExecuteNonQuery();
            }
        }
        return deleteCount;
    }
    // For Updating Student
    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateStudent(Students original_Student, Students student)
    {
        //string sql = "Update Students Set Name = @Name, Email = @Email, Phone = @Phone, Subject = @Subject, SessionYear = @SessionYear Where StudentID = @Original_StudentID And Name = @Original_Name And Email = @Original_Email And Phone = @Original_Phone And Subject = @Original_Subject And SessionYear = @Original_SessionYear)";
        string sql = "Update Students Set Name = @Name, Email = @Email, Phone = @Phone, Subject = @Subject, SessionYear = @SessionYear Where StudentID = @original_StudentID";
        int updateCount = 0;
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("Name", student.Name);
                cmd.Parameters.AddWithValue("Email", student.Email);
                cmd.Parameters.AddWithValue("Phone", student.Phone);
                cmd.Parameters.AddWithValue("Subject", student.Subject);
                cmd.Parameters.AddWithValue("SessionYear", student.SessionYear);
                cmd.Parameters.AddWithValue("original_StudentID", original_Student.StudentID);
                //cmd.Parameters.AddWithValue("Original_Name", original_Student.Name);
                //cmd.Parameters.AddWithValue("Original_Email", original_Student.Email);
                //cmd.Parameters.AddWithValue("Original_Phone", original_Student.Phone);
                //cmd.Parameters.AddWithValue("Original_Subject", original_Student.Subject);
                //cmd.Parameters.AddWithValue("Original_SessionYear", original_Student.SessionYear);
                con.Open();
                updateCount = cmd.ExecuteNonQuery();
            }
        }
        return updateCount;
    }
    // For Configuring Connecting String
    private static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["Simple_CRUDConnectionString"].ConnectionString;
    }
}
