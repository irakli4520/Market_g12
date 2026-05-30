using Market.DTO;
using System.Data;
using Market.Repositories.Interfaces;

namespace Market.Repositories;

public sealed class CategoryRepository : BaseRepository<Category>, ICategoryRepository
{
    public CategoryRepository(IDbConnection connection) : base(connection)
    {

    }
}