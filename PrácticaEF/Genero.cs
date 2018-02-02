using System.Collections.Generic;

namespace PrácticaEF
{
    public class Genero
    {
        public Genero()
        {
            Videos = new List<Video>();
        }

        public int Id { get; set; }
        public string Nombre { get; set; }

        public ICollection<Video> Videos { get; set; }
    }
}
