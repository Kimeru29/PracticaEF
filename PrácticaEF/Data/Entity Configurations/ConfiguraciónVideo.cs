using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrácticaEF.FluentAPI_Configurations
{
    class ConfiguraciónVideo : EntityTypeConfiguration<Video>
    {
        public ConfiguraciónVideo()
        {
            //ToTable -> PK -> Propiedades(a-z) -> Relaciones(a-z)

            Property(v => v.Nombre)
               .HasMaxLength(255)
               .IsRequired();

            HasMany<Tag>(v => v.Tags)
                .WithMany(t => t.Videos)
                .Map(vt =>
                {
                    vt.MapLeftKey("VideoId");
                    vt.MapRightKey("TagId");
                    vt.ToTable("VideoTags");
                });

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
