namespace Bookshelf.Models

open System

type BookModel (title:string, author:string, published:DateTime) =
    member val Title = title with get, set
    member val Author = author with get, set
    member val Published = published with get, set
    new () = BookModel("", "", DateTime.Now)
