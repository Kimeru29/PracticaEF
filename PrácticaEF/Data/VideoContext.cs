using PrácticaEF.FluentAPI_Configurations;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace PrácticaEF
{
    public class VideoContext : DbContext
    {
        public DbSet<Video> Videos { get; set; }
        public DbSet<Genero> Generos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            Database.SetInitializer<DbContext>(new
                DropCreateDatabaseAlways<DbContext>());

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            //Configuraciones de entidad, se encuentran en la carpeta FluentAPI-Configuraciones
            modelBuilder.Configurations.Add(new ConfiguraciónGénero());
            modelBuilder.Configurations.Add(new ConfiguraciónVideo());
            
        }
    }
}
