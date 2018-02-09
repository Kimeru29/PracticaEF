using PrácticaEF.Interfaces;
using System;

namespace PrácticaEF
{

    class Program
    {
        static void Main(string[] args)
        {
            using (var unitOfWork = new UnitOfWork(new VideoContext()))
            {
                Console.WriteLine("\nVideos categoría oro ordenados por fecha");

                foreach (var peli in unitOfWork.VideoRepository.ObtenerVideosOroPorFecha())
                {
                    Console.WriteLine($"{peli.Nombre}  |  {peli.FechaDeEstreno}");
                }
            }


            Console.ReadKey();
        }

        static void DemostracionLinq(IVideoRepository repo)
        {
            Console.WriteLine("Videos agrupados por su clasificación:");

            foreach (var peli in repo.ObtenerPeliculasPorClasificacion())
            {
                Console.WriteLine($"Clasificación: {peli.clasificación}");
                foreach (var pelis in peli.videos)
                {
                    Console.WriteLine($" -{pelis.Nombre}");
                }
            }

            Console.WriteLine("\nLista de videos con su género");

            foreach (var peli in repo.ObtenerVideosConGenero())
            {
                Console.WriteLine($"{peli.nombre} | {peli.genero}");
            }

            Console.WriteLine("\nVideos categoría oro ordenados por fecha");

            foreach (var peli in repo.ObtenerVideosOroPorFecha())
            {
                Console.WriteLine($"{peli.Nombre}  |  {peli.FechaDeEstreno}");
            }
        }
    }
}
