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
        string sql = "Select StudentID, Name, Email, ReEmail, Age From Students Order by StudentID";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                con.Open();
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    Students student;
                    while (dr.Read())
                    {
                        student = new Students();
                        student.StudentID = Convert.ToInt32(dr["StudentID"]);
                        student.Name = dr["Name"].ToString();
                        student.Email = dr["Email"].ToString();
                        student.ReEmail = dr["ReEmail"].ToString();
                        student.Age = Convert.ToInt32(dr["Age"]);
                        stdList.Add(student);
                    }
                }
            }
        }
        return stdList;
    }
    // For Creating Student
    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static void InsertStudent(Students std)
    {
        string sql = "Insert Into Students Values(@Name, @Email, @ReEmail, @Age)";
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("Name", std.Name);
                cmd.Parameters.AddWithValue("Email", std.Email);
                cmd.Parameters.AddWithValue("ReEmail", std.ReEmail);
                cmd.Parameters.AddWithValue("Age", std.Age);
                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
    // For Deleting Student
    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static int DeleteStudent(Students std)
    {
        string sql = "Delete From Students Where StudentID = @StudentID";
        int deleteCount = 0;
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
    public static int UpdateStudent(Students original_Student, Students student)
    {
        string sql = "Update Students Set Name = @Name, Email = @Email, ReEmail = @ReEmail, Age = @Age Where StudentID = @original_StudentID";
        int updateCount = 0;
        using (SqlConnection con = new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                cmd.Parameters.AddWithValue("Name", student.Name);
                cmd.Parameters.AddWithValue("Email", student.Email);
                cmd.Parameters.AddWithValue("ReEmail", student.ReEmail);
                cmd.Parameters.AddWithValue("Age", student.Age);
                cmd.Parameters.AddWithValue("original_StudentID", original_Student.StudentID);
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
