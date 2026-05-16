namespace Market.DTO;

public class Receipt
{
    public int SaleId { get; set; }
    public string ReceiptNumber { get; set; } = null!;
    public DateTime PrintDate { get; set; }
    public DateTime CreateDate { get; set; }
}