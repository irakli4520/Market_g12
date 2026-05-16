namespace Market.DTO;

public class Customer
{
    public int Id { get; set; }
    public string FirstName { get; set; } = null!;
    public string LastName { get; set; } = null!;
    public string IdCard { get; set; } = null!;
    public char Gender { get; set; }
    public int LoyaltyPoints { get; set; } = 0;
    public byte CustomerStatus { get; set; } = 0;
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}