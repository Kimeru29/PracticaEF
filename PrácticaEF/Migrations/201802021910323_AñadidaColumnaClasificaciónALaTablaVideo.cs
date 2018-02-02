namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AñadidaColumnaClasificaciónALaTablaVideo : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Video", "Clasificacion", c => c.Byte(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Video", "Clasificacion");
        }
    }
}
