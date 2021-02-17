namespace Bookshelf.Controllers

open Bookshelf
open Bookshelf.Models
open Microsoft.AspNetCore.Mvc

type DemoController (bookService: IBookService) =
    inherit Controller()

    member this.Index () =
        let books = bookService.GetAllBooks()

        this.View(books)

    [<HttpPost>]
    member this.CreateBook (book:BookModel) =
        // TODO error detection and return error codes
        bookService.CreateBook(book)
        this.RedirectToAction("Index")
