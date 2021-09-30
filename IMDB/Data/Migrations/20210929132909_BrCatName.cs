using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class BrCatName : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BroadcastCategoryTypeName",
                table: "BroadcastCategories");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "BroadcastCategoryTypeName",
                table: "BroadcastCategories",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
