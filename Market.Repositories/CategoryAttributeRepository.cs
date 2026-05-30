using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class CategoryAttributeRepository : BaseRepository<CategoryAttribute>, ICategoryAttributeRepository
{
    public CategoryAttributeRepository(IDbConnection connection) : base(connection)
    {

    }
}