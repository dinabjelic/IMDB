using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class doubleAvg : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<double>(
                name: "AvgScore",
                table: "BroadcastCategories",
                nullable: false,
                oldClrType: typeof(float),
                oldType: "real");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<float>(
                name: "AvgScore",
                table: "BroadcastCategories",
                type: "real",
                nullable: false,
                oldClrType: typeof(double));
        }
    }
}
