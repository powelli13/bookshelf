namespace bookshelf.Controllers

open Microsoft.AspNetCore.Mvc
open Microsoft.Extensions.Logging

type DemoController () =
    inherit Controller()

    member this.Index (name:string) =
        let viewDataName = if name <> null then name else "Test Name 2"
        this.ViewData.Add("Name", viewDataName)
        this.View()
