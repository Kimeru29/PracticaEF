using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrácticaEF.Interfaces
{
    public interface IVideoRepository : IRepository<Video>
    {
        IEnumerable<Video> ObtenerVideosPorNombre();
        IEnumerable<Video> ObtenerVideosOroPorFecha();

        IEnumerable<dynamic> ObtenerVideosConGenero();
        IEnumerable<dynamic> ObtenerPeliculasPorClasificacion();
    }
}
