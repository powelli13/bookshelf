namespace bookshelf.Models

type BookModel (name:string) =
    member val Name = name with get, set
    new () = BookModel("")
