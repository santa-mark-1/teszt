using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace NeighborHub_Backend
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
    }
}