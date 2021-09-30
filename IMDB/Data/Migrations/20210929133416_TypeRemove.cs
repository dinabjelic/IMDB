using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class TypeRemove : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Type",
                table: "BroadcastCategories");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "BroadcastCategories",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
