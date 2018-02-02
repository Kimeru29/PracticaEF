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

            context.Generos.AddOrUpdate(g => g.Id,
                new Genero() { Id = 1, Nombre = "Artes Marciales" },
                new Genero() { Id = 2, Nombre = "Acción" });
        }
    }
}
