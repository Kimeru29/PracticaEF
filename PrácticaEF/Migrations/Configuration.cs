namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<PrácticaEF.VideoContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(PrácticaEF.VideoContext context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data.

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 1,
                Nombre = "The Godfather",
                FechaDeEstreno = new DateTime(1972, 3, 24),
                Clasificacion = Clasificacion.Platino,
                GeneroId = 7
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 2,
                Nombre = "The Shawshank Redemption",
                FechaDeEstreno = new DateTime(1994, 9, 14),
                Clasificacion = Clasificacion.Oro,
                GeneroId = 7
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 3,
                Nombre = "Schindler's List",
                FechaDeEstreno = new DateTime(1994, 2, 4),
                Clasificacion = Clasificacion.Oro,
                GeneroId = 7
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 4,
                Nombre = "The Hangover",
                FechaDeEstreno = new DateTime(2009, 6, 11),
                Clasificacion = Clasificacion.Oro,
                GeneroId = 1
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 5,
                Nombre = "Anchorman",
                FechaDeEstreno = new DateTime(2004, 4, 11),
                Clasificacion = Clasificacion.Plata,
                GeneroId = 1
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 6,
                Nombre = "Die Hard",
                FechaDeEstreno = new DateTime(1988, 6, 13),
                Clasificacion = Clasificacion.Oro,
                GeneroId = 2
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 7,
                Nombre = "The Dark Knight",
                FechaDeEstreno = new DateTime(2008, 1, 5),
                Clasificacion = Clasificacion.Oro,
                GeneroId = 2
            });

            context.Videos.AddOrUpdate(v => v.Id, new Video
            {
                Id = 8,
                Nombre = "Terminator 2: Judgment Day",
                FechaDeEstreno = new DateTime(1991, 5, 15),
                Clasificacion = Clasificacion.Platino,
                GeneroId = 2
            });
        }
    }
}
