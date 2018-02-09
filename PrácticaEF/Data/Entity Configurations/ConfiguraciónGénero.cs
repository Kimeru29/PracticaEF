using System;
using System.Collections.Generic;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PrácticaEF.FluentAPI_Configurations
{
    class ConfiguraciónGénero : EntityTypeConfiguration<Genero>
    {
        //ToTable -> PK -> Propiedades(a-z) -> Relaciones(a-z)
        public ConfiguraciónGénero()
        {
            Property(g => g.Nombre)
                .HasMaxLength(255)
                .IsRequired();
        } 
    }
}
