namespace Market.DTO;

public class EmployeeRole
{
    public int Id { get; set; }
    public string RoleName { get; set; } = null!;
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}