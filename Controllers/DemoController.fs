namespace bookshelf.Controllers

open bookshelf
open bookshelf.Models
open Microsoft.AspNetCore.Mvc
open System.Collections.Generic

type DemoController (bookService: IBookService) =
    inherit Controller()

    member this.Index (name:string) =
        let viewDataName = if not (isNull name) then name else "Test Name 2"
        this.ViewData.Add("Name", viewDataName)

        let books = bookService.GetBooksForUser("test")
        this.ViewData.Add("Books", books)

        this.View()

    [<HttpPost>]
    member this.SetName (book:BookModel) =
        let routeDict = new Dictionary<string, string>()
        routeDict.["name"] <- book.Name

        this.RedirectToAction("Index", routeDict)
