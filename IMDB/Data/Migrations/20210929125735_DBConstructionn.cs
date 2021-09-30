using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class DBConstructionn : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BroadcastCategoryTypes",
                columns: table => new
                {
                    BroadcastCategoryTypeID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BroadcastCategoryTypeName = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BroadcastCategoryTypes", x => x.BroadcastCategoryTypeID);
                });

            migrationBuilder.CreateTable(
                name: "Casts",
                columns: table => new
                {
                    CastID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Age = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Casts", x => x.CastID);
                });

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    FirstName = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    Password = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.UserID);
                });

            migrationBuilder.CreateTable(
                name: "BroadcastCategories",
                columns: table => new
                {
                    BroadcastCategoryID = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    BroadcastCategoryTypeID = table.Column<int>(nullable: false),
                    BroadcastCategoryTypeName = table.Column<string>(nullable: true),
                    Title = table.Column<string>(nullable: true),
                    CoverImage = table.Column<string>(nullable: true),
                    Description = table.Column<string>(nullable: true),
                    ReleaseDate = table.Column<string>(nullable: true),
                    Type = table.Column<string>(nullable: true),
                    AvgScore = table.Column<float>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BroadcastCategories", x => x.BroadcastCategoryID);
                    table.ForeignKey(
                        name: "FK_BroadcastCategories_BroadcastCategoryTypes_BroadcastCategoryTypeID",
                        column: x => x.BroadcastCategoryTypeID,
                        principalTable: "BroadcastCategoryTypes",
                        principalColumn: "BroadcastCategoryTypeID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "BroadcastCategoryCasts",
                columns: table => new
                {
                    CastID = table.Column<int>(nullable: false),
                    BroadcastCategoryID = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BroadcastCategoryCasts", x => new { x.BroadcastCategoryID, x.CastID });
                    table.ForeignKey(
                        name: "FK_BroadcastCategoryCasts_BroadcastCategories_BroadcastCategoryID",
                        column: x => x.BroadcastCategoryID,
                        principalTable: "BroadcastCategories",
                        principalColumn: "BroadcastCategoryID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_BroadcastCategoryCasts_Casts_CastID",
                        column: x => x.CastID,
                        principalTable: "Casts",
                        principalColumn: "CastID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Ratings",
                columns: table => new
                {
                    UserID = table.Column<int>(nullable: false),
                    BroadcastCategoryID = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Ratings", x => new { x.BroadcastCategoryID, x.UserID });
                    table.ForeignKey(
                        name: "FK_Ratings_BroadcastCategories_BroadcastCategoryID",
                        column: x => x.BroadcastCategoryID,
                        principalTable: "BroadcastCategories",
                        principalColumn: "BroadcastCategoryID",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Ratings_Users_UserID",
                        column: x => x.UserID,
                        principalTable: "Users",
                        principalColumn: "UserID",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_BroadcastCategories_BroadcastCategoryTypeID",
                table: "BroadcastCategories",
                column: "BroadcastCategoryTypeID");

            migrationBuilder.CreateIndex(
                name: "IX_BroadcastCategoryCasts_CastID",
                table: "BroadcastCategoryCasts",
                column: "CastID");

            migrationBuilder.CreateIndex(
                name: "IX_Ratings_UserID",
                table: "Ratings",
                column: "UserID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BroadcastCategoryCasts");

            migrationBuilder.DropTable(
                name: "Ratings");

            migrationBuilder.DropTable(
                name: "Casts");

            migrationBuilder.DropTable(
                name: "BroadcastCategories");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropTable(
                name: "BroadcastCategoryTypes");
        }
    }
}
