namespace Market.DTO;

public class Sale
{
    public int Id { get; set; }
    public int EmployeeId { get; set; }
    public int CustomerId { get; set; }
    public string? Comment { get; set; }
    public DateTime SaleDate { get; set; }
    public byte SaleStatus { get; set; } = 0;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}