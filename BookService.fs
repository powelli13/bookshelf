namespace Bookshelf

open Bookshelf.DbModels
open Bookshelf.Models

type IBookService =
    abstract member GetBooksForUser: string -> string[]
    abstract member GetAllBooks: unit -> List<BookModel>
    abstract member CreateBook: BookModel -> unit

type BookService(context:BookshelfContext) =
    interface IBookService with
        member __.GetBooksForUser(username:string) =
            [|"Abc Book"; "Def Book"|]

        member __.GetAllBooks() =
            context.Books
            |> Seq.map (fun b ->
                let yearPublished =
                    if b.YearPublished.HasValue 
                    then b.YearPublished.Value 
                    else 1900
                new BookModel(b.Title, b.Author, yearPublished))
            |> Seq.toList

        member __.CreateBook(book:BookModel) =
            // TODO move advance conversion somewhere else
            let newBook = { Id = 0; Title = book.Title; Author = book.Author; YearPublished = book.YearPublished }
            context.Books.Add(newBook) |> ignore
            context.SaveChanges true |> ignore