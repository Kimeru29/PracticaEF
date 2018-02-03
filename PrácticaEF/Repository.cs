using PrácticaEF.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;
using System.Data.Entity;

namespace PrácticaEF
{
    //Repositorio genérico
    public class Repository<TEntidad> : IRepository<TEntidad> where TEntidad : class
    {
        protected readonly DbContext Context;

        public Repository(DbContext context)
        {
            Context = context;
        }

        public TEntidad Get(int id)
        {
            return Context.Set<TEntidad>().Find(id);
        }

        public IEnumerable<TEntidad> GetAll()
        {
            return Context.Set<TEntidad>().ToList();
        }

        public IEnumerable<TEntidad> Find(Expression<Func<TEntidad, bool>> predicate)
        {
            return Context.Set<TEntidad>().Where(predicate);
        }

        public void Add(TEntidad entidad)
        {
            Context.Set<TEntidad>().Add(entidad);
        }

        public void AddRange(IEnumerable<TEntidad> entidades)
        {
            Context.Set<TEntidad>().AddRange(entidades);
        }

        public void Remove(TEntidad entidad)
        {
            Context.Set<TEntidad>().Remove(entidad);
        }

        public void RemoveRange(IEnumerable<TEntidad> entidades)
        {
            Context.Set<TEntidad>().RemoveRange(entidades);
        }
    }
}
