using System;
using System.Collections.Generic;

namespace PrácticaEF
{

    public class Video
    {
        public Video()
        {
            Tags = new List<Tag>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public DateTime FechaDeEstreno { get; set; }
        public int GeneroId { get; set; }
        public Clasificacion Clasificacion { get; set; }

        public Genero Genero { get; set; }
        public ICollection<Tag> Tags { get; set; }
    }

}
