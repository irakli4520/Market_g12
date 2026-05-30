using Market.DTO;

namespace Market.Repositories.Interfaces;

public interface IPurchaseRepository : IBaseRepository<Purchase>
{
    public void PurchaseGetAllLastMonth();
}