namespace bookshelf.Controllers

open bookshelf.Models
open Microsoft.AspNetCore.Mvc
open System.Collections.Generic

type DemoController () =
    inherit Controller()

    member this.Index (name:string) =
        let viewDataName = if not (isNull name) then name else "Test Name 2"
        this.ViewData.Add("Name", viewDataName)
        this.View()

    [<HttpPost>]
    member this.SetName (name:string) =
        let routeDict = new Dictionary<string, string>()
        routeDict.Add("name", name)

        this.RedirectToAction("Index", routeDict)
