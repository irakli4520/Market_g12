namespace Market.DTO;

public class ProductAttribute
{
    public int Id { get; set; }
    public int CategoryAttributeId { get; set; }
    public int ProductId { get; set; }
    public string? StringValue { get; set; }
    public decimal? NumericValue { get; set; }
    public bool? BooleanValue { get; set; } 
    public DateTime? DateValue { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}