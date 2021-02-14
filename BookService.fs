namespace Bookshelf

// TODO figure out how to use bookshelf.Models namespace in here

type IBookService =
    abstract member GetBooksForUser: string -> string[]

type BookService() =
    interface IBookService with
        member __.GetBooksForUser(username:string) =
            [|"Abc Book"; "Def Book"|]
