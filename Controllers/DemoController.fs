namespace Bookshelf.Controllers

open Bookshelf
open Bookshelf.Models
open Microsoft.AspNetCore.Mvc

type DemoController (bookService: IBookService) =
    inherit Controller()

    member this.Index (book:BookModel) =
        //let books = bookService.GetBooksForUser("test")
        //this.ViewData.Add("Books", books)

        this.View(book)

    [<HttpPost>]
    member this.CreateBook (book:BookModel) =

        this.RedirectToAction("Index", book)
