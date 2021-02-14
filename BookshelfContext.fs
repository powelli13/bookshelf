namespace Bookshelf

open Bookshelf.DbModels
open Microsoft.EntityFrameworkCore
open Microsoft.EntityFrameworkCore.Sqlite

type BookshelfContext =
    inherit DbContext

    new() = { inherit DbContext() }
    new(options: DbContextOptions<BookshelfContext>) = { inherit DbContext(options) }

    // TODO need to override OnModelCreating for any reason?
    override __.OnConfiguring (optionsBuilder:DbContextOptionsBuilder) =
        optionsBuilder.UseSqlite() |> ignore

    [<DefaultValue>]
    val mutable books:DbSet<DbBook>
    member c.Books
        with get() = c.books
        and set v = c.books <- v
