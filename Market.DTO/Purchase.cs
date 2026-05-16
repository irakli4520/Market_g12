namespace Market.DTO;

public class Purchase
{
    public int Id { get; set; }
    public int SupplierId { get; set; }
    public string? Comment { get; set; }
    public DateTime PurchaseDate { get; set; }
    public byte PurchaseStatus { get; set; } = 0;
    public DateTime CreateDate { get; set; }
    public DateTime? UpdateDate { get; set; }
}