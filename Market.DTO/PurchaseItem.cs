namespace Market.DTO;

public class PurchaseItem
{
    public int PurchaseId { get; set; }
    public int ProductId { get; set; }
    public int Quantity { get; set; }
    public decimal UnitPrice { get; set; }
    public DateTime CreateDate { get; set; }
}