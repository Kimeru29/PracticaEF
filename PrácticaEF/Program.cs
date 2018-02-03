using System;

namespace PrácticaEF
{
    class Program
    {
        static void Main(string[] args)
        {
            var repo = new VideoRepository(new VideoContext());

            //Arreglar, son tipo objet y no puedo acceder a sus propiedades
            //var videosPorClasificacion = repo.ObtenerPeliculasPorClasificacion();
            //foreach (var peli in videosPorClasificacion)
            //{
            //    Console.WriteLine();
            //}

            //Este método funciona pero seguro puede mejorarse
            var videosConGenero = repo.ObtenerVideosConGenero();
            foreach (var peli in videosConGenero)
            {
                Console.WriteLine(peli.GetType().GetProperty("nombre").GetValue(peli, null));
            }

            //var videosOro = repo.ObtenerVideosOroPorFecha();
            //foreach (var peli in videosOro)
            //{
            //    Console.WriteLine(peli.Nombre);
            //}

            //
            //var videosOrdenadosPorNombre = repo.ObtenerVideosPorNombre();
            //foreach (var peli in videos)
            //{
            //    Console.WriteLine(peli.Nombre);
            //}

            Console.ReadLine();
        }
    }
}
