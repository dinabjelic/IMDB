using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class NullableUserID__ : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Ratings_UserID",
                table: "Ratings",
                column: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK_Ratings_Users_UserID",
                table: "Ratings",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ratings_Users_UserID",
                table: "Ratings");

            migrationBuilder.DropIndex(
                name: "IX_Ratings_UserID",
                table: "Ratings");
        }
    }
}
