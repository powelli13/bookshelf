namespace Bookshelf.DbModels

open System

type [<CLIMutable>] DbBook =
    { 
      Id: int
      Title: string
      Author: string
      YearPublished: Nullable<int>
    }
