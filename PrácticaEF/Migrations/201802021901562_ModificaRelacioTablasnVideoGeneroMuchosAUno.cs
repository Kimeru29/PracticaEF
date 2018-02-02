namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModificaRelacioTablasnVideoGeneroMuchosAUno : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.VideoGeneros", "RefVideoId", "dbo.Video");
            DropForeignKey("dbo.VideoGeneros", "RefGeneroId", "dbo.Genero");
            DropIndex("dbo.VideoGeneros", new[] { "RefVideoId" });
            DropIndex("dbo.VideoGeneros", new[] { "RefGeneroId" });
            AddColumn("dbo.Video", "GeneroId", c => c.Int(nullable: false));
            CreateIndex("dbo.Video", "GeneroId");
            AddForeignKey("dbo.Video", "GeneroId", "dbo.Genero", "Id", cascadeDelete: true);
            DropTable("dbo.VideoGeneros");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.VideoGeneros",
                c => new
                    {
                        RefVideoId = c.Int(nullable: false),
                        RefGeneroId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.RefVideoId, t.RefGeneroId });
            
            DropForeignKey("dbo.Video", "GeneroId", "dbo.Genero");
            DropIndex("dbo.Video", new[] { "GeneroId" });
            DropColumn("dbo.Video", "GeneroId");
            CreateIndex("dbo.VideoGeneros", "RefGeneroId");
            CreateIndex("dbo.VideoGeneros", "RefVideoId");
            AddForeignKey("dbo.VideoGeneros", "RefGeneroId", "dbo.Genero", "Id", cascadeDelete: true);
            AddForeignKey("dbo.VideoGeneros", "RefVideoId", "dbo.Video", "Id", cascadeDelete: true);
        }
    }
}
