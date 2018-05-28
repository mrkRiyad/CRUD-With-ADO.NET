using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.ComponentModel;
using CRUDwithADO.NET;

[DataObject(true)]
public class StudentDB
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
        string sql = "Delete Students Where StudentID = @StudentID)";
        int deleteCount;
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("StudentID", std.StudentID);
                con.Open();
                deleteCount = cmd.ExecuteNonQuery();
            }
        }
        return deleteCount;
    }
    // For Updating Student
    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int UpdateStudent(Students originalStd, Students std)
    {
        string sql = "Update Students Set Name = @Name, Email = @Email, Phone = @Phone, Subject = @Subject, SessionYear = @SessionYear Where StudentID = @Original_StudentID)";
        int updateCount;
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("Name", std.Name);
                cmd.Parameters.AddWithValue("Email", std.Email);
                cmd.Parameters.AddWithValue("Phone", std.Phone);
                cmd.Parameters.AddWithValue("Subject", std.Subject);
                cmd.Parameters.AddWithValue("SessionYear", std.SessionYear);
                cmd.Parameters.AddWithValue("Original_StudentID", originalStd.StudentID);
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
