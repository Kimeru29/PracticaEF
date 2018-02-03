namespace PrácticaEF.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class UpdatedSeedDataAndFillingTheGeneroTable : DbMigration
    {
        public override void Up()
        {
            Sql("INSERT INTO dbo.Genero VALUES('Suspenso')," +
                                          "('Terror')," +
                                          "('Drama')," +
                                          "('Psicológico')," +
                                          "('Histórico')," +
                                          "('Infantil')," +
                                          "('Animación')," +
                                          "('Aventuras')");
        }
        
        public override void Down()
        {
            Sql("TRUNCATE TABLE dbo.Genero");
        }
    }
}
