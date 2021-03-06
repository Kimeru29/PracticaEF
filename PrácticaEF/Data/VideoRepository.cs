﻿using PrácticaEF.Interfaces;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace PrácticaEF
{
    class VideoRepository : Repository<Video>, IVideoRepository
    {
        public VideoRepository(DbContext context)
            : base(context)
        {
        }

        public IEnumerable<dynamic> ObtenerPeliculasPorClasificacion()
        {
            return VideoContext.Videos.GroupBy(v => v.Clasificacion)
                                        .Select(v => new
                                        {
                                            clasificación = v.Key.ToString(),
                                            videos = v.OrderBy(n => n.Nombre)
                                        });
        }

        public IEnumerable<dynamic> ObtenerVideosConGenero()
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
                                        .Where(v => v.Clasificacion == Clasificacion.Oro)
                                        .OrderByDescending(v => v.FechaDeEstreno);
        }

        public IEnumerable<Video> ObtenerVideosPorNombre() => VideoContext.Videos.OrderBy(v => v.Nombre);

        private VideoContext VideoContext
        {
            get
            {
                return Context as VideoContext;
            }
        }
    }
}
