using PrácticaEF.Interfaces;
using System;

namespace PrácticaEF
{
    internal static class Program
    {
        private static void Main(string[] args)
        {
            using (var unitOfWork = new UnitOfWork(new VideoContext()))
            {
                DemostracionLinq(unitOfWork);
            }
            Console.ReadKey();
        }

        static void DemostracionLinq(IUnitOfWork unitOfWork)
        {
            Console.WriteLine("Videos categoría oro ordenados por fecha");

                foreach (var peli in unitOfWork.VideoRepository.ObtenerVideosOroPorFecha())
                {
                    Console.WriteLine($"{peli.Nombre}  |  {peli.FechaDeEstreno}");
                }
            

            Console.WriteLine("Videos agrupados por su clasificación:");

            foreach (var peli in unitOfWork.VideoRepository.ObtenerPeliculasPorClasificacion())
            {
                Console.WriteLine($"Clasificación: {peli.clasificación}");
                foreach (var pelis in peli.videos)
                {
                    Console.WriteLine($" -{pelis.Nombre}");
                }
            }

            Console.WriteLine("\nLista de videos con su género");

            foreach (var peli in unitOfWork.VideoRepository.ObtenerVideosConGenero())
            {
                Console.WriteLine($"{peli.nombre} | {peli.genero}");
            }

            Console.WriteLine("\nVideos categoría oro ordenados por fecha");

            foreach (var peli in unitOfWork.VideoRepository.ObtenerVideosOroPorFecha())
            {
                Console.WriteLine($"{peli.Nombre}  |  {peli.FechaDeEstreno}");
            }
        }
    }
}
