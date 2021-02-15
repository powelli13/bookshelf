namespace Bookshelf

open Bookshelf.DbModels
open Microsoft.EntityFrameworkCore
open Microsoft.EntityFrameworkCore.Sqlite

type BookshelfContext =
    inherit DbContext

    new() = { inherit DbContext() }
    new(options: DbContextOptions<BookshelfContext>) = { inherit DbContext(options) }

    // TODO replace with data source coming from configuration
    //override __.OnConfiguring (optionsBuilder:DbContextOptionsBuilder) =
        //optionsBuilder.UseSqlite(@"Data Source=.\SqlScripts\bookshelf.db") |> ignore

    override __.OnModelCreating modelBuilder =
        modelBuilder.Entity<DbBook>().ToTable("Books").HasKey("Id") |> ignore

    [<DefaultValue>]
    val mutable books:DbSet<DbBook>
    member c.Books
        with get() = c.books
        and set v = c.books <- v
