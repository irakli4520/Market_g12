namespace Market.Repositories.Interfaces;

public interface IBaseRepository<T>
{
    public T? GetById(object id);
    public IEnumerable<T> GetAll();
    public object Insert(T entity);
    public void Update(T entity);
    public void Delete(object id);
}