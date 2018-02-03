using PrácticaEF.Interfaces;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace PrácticaEF
{
    class VideoRepository : Repository<Video>, IVideoRepository
    {
        public VideoRepository(VideoContext context)
            : base(context)
        {
        }

        public IEnumerable<object> ObtenerPeliculasPorClasificacion()
        {
            return VideoContext.Videos.GroupBy(v => v.Clasificacion)
                                        .Select(v => new
                                        {
                                            clasificación = v.Key.ToString(),
                                            videos = v.OrderBy(n => n.Nombre)
                                        });
        }

        public IEnumerable<object> ObtenerVideosConGenero()
        {
            return VideoContext.Videos.Select(v => new
            {
                nombre = v.Nombre,
                genero = v.Genero.Nombre
            });
        }

        public IEnumerable<Video> ObtenerVideosOroPorFecha()
        {
            return VideoContext.Videos.Include(v => v.Genero)
                                        .Where(v => v.Clasificacion == Clasificacion.Oro && v.Genero.Nombre == "Acción")
                                        .OrderByDescending(v => v.FechaDeEstreno);
        }

        public IEnumerable<Video> ObtenerVideosPorNombre()
        {
            return VideoContext.Videos.OrderBy(v => v.Nombre);
        }

        private VideoContext VideoContext
        {
            get
            {
                return Context as VideoContext;
            }
        }
    }
}
