namespace Market.DTO;

public class CategoryAttribute
{
    public int Id { get; set; }
    public int CategoryId { get; set; }
    public string AttributeName { get; set; } = null!;
    public byte AttributeType { get; set; }
    public int OrderPosition { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}