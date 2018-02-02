namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UsandoFluentAPIParaControlarLaDB : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Genero", "Nombre", c => c.String(nullable: false, maxLength: 255));
            AlterColumn("dbo.Video", "Nombre", c => c.String(nullable: false, maxLength: 255));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Video", "Nombre", c => c.String());
            AlterColumn("dbo.Genero", "Nombre", c => c.String());
        }
    }
}
