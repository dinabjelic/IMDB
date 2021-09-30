using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class Review : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Review",
                table: "Ratings",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AlterColumn<DateTime>(
                name: "ReleaseDate",
                table: "BroadcastCategories",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<float>(
                name: "AvgScore",
                table: "BroadcastCategories",
                nullable: false,
                oldClrType: typeof(float),
                oldType: "real",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Review",
                table: "Ratings");

            migrationBuilder.AlterColumn<string>(
                name: "ReleaseDate",
                table: "BroadcastCategories",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(DateTime));

            migrationBuilder.AlterColumn<float>(
                name: "AvgScore",
                table: "BroadcastCategories",
                type: "real",
                nullable: true,
                oldClrType: typeof(float));
        }
    }
}
