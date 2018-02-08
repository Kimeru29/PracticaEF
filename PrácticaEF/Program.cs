using PrácticaEF.Interfaces;
using System;

namespace PrácticaEF
{
    class Program
    {
        static void Main(string[] args)
        {
            var repo = new VideoRepository(new VideoContext());
            DemostracionLinq(repo);
            

            Console.ReadKey();
        }

        static void DemostracionLinq(IVideoRepository repo)
        {
            Console.WriteLine("Videos agrupados por su clasificación:");
            var videosporclasificacion = repo.ObtenerPeliculasPorClasificacion();
            foreach (var peli in videosporclasificacion)
            {
                Console.WriteLine($"Clasificación: {peli.clasificación}");
                foreach (var pelis in peli.videos)
                {
                    Console.WriteLine($" -{pelis.Nombre}");
                }
            }

            Console.WriteLine("\nLista de videos con su género");
            var videoscongenero = repo.ObtenerVideosConGenero();
            foreach (var peli in videoscongenero)
            {
                Console.WriteLine($"{peli.nombre} | {peli.genero}");
            }

            Console.WriteLine("\nVideos categoría oro ordenados por fecha");
            var videosOro = repo.ObtenerVideosOroPorFecha();
            foreach (var peli in videosOro)
            {
                Console.WriteLine($"{peli.Nombre}  |  {peli.FechaDeEstreno}");
            }
        }
    }
}
