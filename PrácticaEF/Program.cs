using System;

namespace PrácticaEF
{

    class Program
    {
        static void Main(string[] args)
        {
            var db = new VideoContext();
            var ob = db.Generos.Find(1);

            Console.WriteLine(ob.Nombre);
            
            Console.ReadKey();
        }
    }
}
