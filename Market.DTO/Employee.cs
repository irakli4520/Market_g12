namespace Market.DTO;

public class Employee
{
    public int Id { get; set; }
    public string FirstName { get; set; } = null!;
    public string LastName { get; set; } = null!;
    public string IdCard { get; set; } = null!;
    public int EmployeeRoleId { get; set; }
    public DateTime BirthDate { get; set; }
    public DateTime HireDate { get; set; }
    public DateTime? LeaveDate { get; set; }
    public string Address { get; set; } = null!;
    public string Phone { get; set; } = null!;
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}