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

            //Configuración
            Database.SetInitializer<DbContext>(new
                DropCreateDatabaseAlways<DbContext>());

            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

            //Configuración de relaciones
            //Tabla intermedia Video-Generos
            //modelBuilder.Entity<Video>()
            //    .HasMany<Genero>(v => v.Generos)
            //    .WithMany(g => g.Videos)
            //    .Map(vg =>
            //    {
            //        vg.MapLeftKey("RefVideoId");s
            //        vg.MapRightKey("RefGeneroId");
            //        vg.ToTable("VideoGeneros");
            //    });
        }
    }
}
