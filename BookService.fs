namespace Bookshelf

// TODO figure out how to use bookshelf.Models namespace in here
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
            // all db books
            // convert each to a book model
            // return list
            context.Books
            |> Seq.map (fun b ->
                let yearPublished = if b.YearPublished.HasValue then b.YearPublished.Value else 1900
                new BookModel(b.Title, b.Author, yearPublished))
            |> Seq.toList
