using Data.EFModels;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;

namespace Data.EF
{
    public class AppDBContext:DbContext
    {
      
        public AppDBContext(DbContextOptions<AppDBContext> options):base(options)
        {
        }

        public DbSet<BroadcastCategory> BroadcastCategories { get; set; }
        public DbSet<BroadcastCategoryCast> BroadcastCategoryCasts { get; set; }
        public DbSet<BroadcastCategoryType> BroadcastCategoryTypes { get; set; }
        public DbSet<Cast> Casts { get; set; }
        public DbSet<Rating> Ratings { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<BroadcastCategoryCast>()
             .HasKey(pp => new { pp.BroadcastCategoryID, pp.CastID });
        }

    }
}
