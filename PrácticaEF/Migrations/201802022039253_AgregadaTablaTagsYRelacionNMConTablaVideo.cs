namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AgregadaTablaTagsYRelacionNMConTablaVideo : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Tag",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Nombre = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.VideoTags",
                c => new
                    {
                        VideoId = c.Int(nullable: false),
                        TagId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.VideoId, t.TagId })
                .ForeignKey("dbo.Video", t => t.VideoId, cascadeDelete: true)
                .ForeignKey("dbo.Tag", t => t.TagId, cascadeDelete: true)
                .Index(t => t.VideoId)
                .Index(t => t.TagId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.VideoTags", "TagId", "dbo.Tag");
            DropForeignKey("dbo.VideoTags", "VideoId", "dbo.Video");
            DropIndex("dbo.VideoTags", new[] { "TagId" });
            DropIndex("dbo.VideoTags", new[] { "VideoId" });
            DropTable("dbo.VideoTags");
            DropTable("dbo.Tag");
        }
    }
}
