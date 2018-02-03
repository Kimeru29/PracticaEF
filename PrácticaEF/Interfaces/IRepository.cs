using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace PrácticaEF.Interfaces
{
    //Interfáz genérica
    public interface IRepository<TEntidad> where TEntidad : class
    {
        TEntidad Get(int id);
        IEnumerable<TEntidad> GetAll();
        IEnumerable<TEntidad> Find(Expression<Func<TEntidad, bool>> predicate);

        void Add(TEntidad entidad);
        void AddRange(IEnumerable<TEntidad> entidades);

        void Remove(TEntidad entidad);
        void RemoveRange(IEnumerable<TEntidad> entidades);
    }
}
