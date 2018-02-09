using PrácticaEF.Interfaces;
using System;

namespace PrácticaEF
{
    public interface IUnitOfWork : IDisposable
    {
        IVideoRepository VideoRepository { get; }

        void Complete();
    }
}
