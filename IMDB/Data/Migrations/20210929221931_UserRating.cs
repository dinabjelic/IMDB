using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class UserRating : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Ratings_Users_UserID",
                table: "Ratings");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Ratings",
                table: "Ratings");

            migrationBuilder.DropIndex(
                name: "IX_Ratings_UserID",
                table: "Ratings");

            migrationBuilder.DropColumn(
                name: "UserID",
                table: "Ratings");

            migrationBuilder.AddColumn<int>(
                name: "RatingID",
                table: "Ratings",
                nullable: false,
                defaultValue: 0)
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Ratings",
                table: "Ratings",
                column: "RatingID");

            migrationBuilder.CreateIndex(
                name: "IX_Ratings_BroadcastCategoryID",
                table: "Ratings",
                column: "BroadcastCategoryID");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Ratings",
                table: "Ratings");

            migrationBuilder.DropIndex(
                name: "IX_Ratings_BroadcastCategoryID",
                table: "Ratings");

            migrationBuilder.DropColumn(
                name: "RatingID",
                table: "Ratings");

            migrationBuilder.AddColumn<int>(
                name: "UserID",
                table: "Ratings",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Ratings",
                table: "Ratings",
                columns: new[] { "BroadcastCategoryID", "UserID" });

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
    }
}
