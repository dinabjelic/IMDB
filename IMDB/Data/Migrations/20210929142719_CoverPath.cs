using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class CoverPath : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CoverImage",
                table: "BroadcastCategories");

            migrationBuilder.AddColumn<string>(
                name: "CoverImagePath",
                table: "BroadcastCategories",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CoverImagePath",
                table: "BroadcastCategories");

            migrationBuilder.AddColumn<string>(
                name: "CoverImage",
                table: "BroadcastCategories",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
