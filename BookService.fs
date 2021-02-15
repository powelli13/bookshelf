namespace Bookshelf

open Bookshelf.DbModels
open Bookshelf.Models

type IBookService =
    abstract member GetBooksForUser: string -> string[]
    abstract member GetAllBooks: unit -> List<BookModel>

type BookService(context:BookshelfContext) =
    interface IBookService with
        member __.GetBooksForUser(username:string) =
            [|"Abc Book"; "Def Book"|]

        member __.GetAllBooks() =
            context.Books
            |> Seq.map (fun b ->
                // TODO I'd like to be more elegant here, perhaps using the option type to map the nullable columns
                let yearPublished = if b.YearPublished.HasValue then b.YearPublished.Value else 1900
                new BookModel(b.Title, b.Author, yearPublished))
            |> Seq.toList
