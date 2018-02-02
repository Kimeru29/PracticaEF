using System;
using System.Collections.Generic;

namespace PrácticaEF
{
    public class Video
    {
        public Video()
        {
            Generos = new List<Genero>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaDeEstreno { get; set; }

        public ICollection<Genero> Generos { get; set; }
    }
}
