namespace Bookshelf.Controllers

open Bookshelf
open Bookshelf.Models
open Microsoft.AspNetCore.Mvc

type DemoController (bookService: IBookService) =
    inherit Controller()

    member this.Index () =
        //let books = bookService.GetBooksForUser("test")
        //this.ViewData.Add("Books", books)
        let books = bookService.GetAllBooks()

        this.View(books)

    [<HttpPost>]
    member this.CreateBook (book:BookModel) =

        this.RedirectToAction("Index", book)
