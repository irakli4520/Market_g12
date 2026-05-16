namespace Market.DTO;

public class Product
{
    public int Id { get; set; }
    public int CategoryId { get; set; }
    public string ProductCode { get; set; } = null!;
    public string ProductName { get; set; } = null!;
    public string? Description { get; set; } 
    public decimal Price { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}