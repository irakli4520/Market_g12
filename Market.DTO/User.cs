namespace Market.DTO;

public class User
{
    public int Id { get; set; }
    public int EmployeeId { get; set; }
    public string Username { get; set; } = null!;
    public string PasswordHash { get; set; } = null!;
    public string Email { get; set; } = null!;
    public bool IsEnabled { get; set; } = true;
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}