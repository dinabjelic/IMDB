﻿// <auto-generated />
using System;
using Data.EF;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Data.Migrations
{
    [DbContext(typeof(AppDBContext))]
    [Migration("20210929221533_doubleAvg")]
    partial class doubleAvg
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "3.1.19")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Data.EFModels.BroadcastCategory", b =>
                {
                    b.Property<int>("BroadcastCategoryID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<double>("AvgScore")
                        .HasColumnType("float");

                    b.Property<int>("BroadcastCategoryTypeID")
                        .HasColumnType("int");

                    b.Property<string>("CoverImagePath")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Description")
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("ReleaseDate")
                        .HasColumnType("datetime2");

                    b.Property<string>("Title")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("BroadcastCategoryID");

                    b.HasIndex("BroadcastCategoryTypeID");

                    b.ToTable("BroadcastCategories");
                });

            modelBuilder.Entity("Data.EFModels.BroadcastCategoryCast", b =>
                {
                    b.Property<int>("BroadcastCategoryID")
                        .HasColumnType("int");

                    b.Property<int>("CastID")
                        .HasColumnType("int");

                    b.HasKey("BroadcastCategoryID", "CastID");

                    b.HasIndex("CastID");

                    b.ToTable("BroadcastCategoryCasts");
                });

            modelBuilder.Entity("Data.EFModels.BroadcastCategoryType", b =>
                {
                    b.Property<int>("BroadcastCategoryTypeID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("BroadcastCategoryTypeName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("BroadcastCategoryTypeID");

                    b.ToTable("BroadcastCategoryTypes");
                });

            modelBuilder.Entity("Data.EFModels.Cast", b =>
                {
                    b.Property<int>("CastID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Age")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("CastID");

                    b.ToTable("Casts");
                });

            modelBuilder.Entity("Data.EFModels.Rating", b =>
                {
                    b.Property<int>("BroadcastCategoryID")
                        .HasColumnType("int");

                    b.Property<int>("UserID")
                        .HasColumnType("int");

                    b.Property<int>("Review")
                        .HasColumnType("int");

                    b.HasKey("BroadcastCategoryID", "UserID");

                    b.HasIndex("UserID");

                    b.ToTable("Ratings");
                });

            modelBuilder.Entity("Data.EFModels.User", b =>
                {
                    b.Property<int>("UserID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Email")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("FirstName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("LastName")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .HasColumnType("nvarchar(max)");

                    b.HasKey("UserID");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Data.EFModels.BroadcastCategory", b =>
                {
                    b.HasOne("Data.EFModels.BroadcastCategoryType", "BroadcastCategoryType")
                        .WithMany()
                        .HasForeignKey("BroadcastCategoryTypeID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Data.EFModels.BroadcastCategoryCast", b =>
                {
                    b.HasOne("Data.EFModels.BroadcastCategory", "BroadcastCategory")
                        .WithMany()
                        .HasForeignKey("BroadcastCategoryID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Data.EFModels.Cast", "Cast")
                        .WithMany()
                        .HasForeignKey("CastID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Data.EFModels.Rating", b =>
                {
                    b.HasOne("Data.EFModels.BroadcastCategory", "BroadcastCategory")
                        .WithMany()
                        .HasForeignKey("BroadcastCategoryID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("Data.EFModels.User", "User")
                        .WithMany()
                        .HasForeignKey("UserID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });
#pragma warning restore 612, 618
        }
    }
}
