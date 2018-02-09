using PrácticaEF.Interfaces;
using System.Data.Entity;

namespace PrácticaEF
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DbContext _context;

        public UnitOfWork(DbContext context)
        {
            _context = context;
            VideoRepository = new VideoRepository(context);
        }

        public void Complete() => _context.SaveChanges();

        public void Dispose() => _context.Dispose();

        public IVideoRepository VideoRepository { get; }
    }
}
