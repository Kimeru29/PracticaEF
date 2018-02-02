namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ModeloInicial : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Genero",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Video",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(),
                        FechaDeEstreno = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.VideoGeneros",
                c => new
                    {
                        RefVideoId = c.Int(nullable: false),
                        RefGeneroId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.RefVideoId, t.RefGeneroId })
                .ForeignKey("dbo.Video", t => t.RefVideoId, cascadeDelete: true)
                .ForeignKey("dbo.Genero", t => t.RefGeneroId, cascadeDelete: true)
                .Index(t => t.RefVideoId)
                .Index(t => t.RefGeneroId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.VideoGeneros", "RefGeneroId", "dbo.Genero");
            DropForeignKey("dbo.VideoGeneros", "RefVideoId", "dbo.Video");
            DropIndex("dbo.VideoGeneros", new[] { "RefGeneroId" });
            DropIndex("dbo.VideoGeneros", new[] { "RefVideoId" });
            DropTable("dbo.VideoGeneros");
            DropTable("dbo.Video");
            DropTable("dbo.Genero");
        }
    }
}
