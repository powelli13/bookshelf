namespace Bookshelf.Models

open System

type BookModel (title:string, author:string, yearPublished:int) =
    member val Title = title with get, set
    member val Author = author with get, set
    member val YearPublished = yearPublished with get, set
    new () = BookModel("", "", 1900)
