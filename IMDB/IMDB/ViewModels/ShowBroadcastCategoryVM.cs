using Data.EFModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace IMDB.ViewModels
{
    public class ShowBroadcastCategoryVM
    {
        public class Rows
        {
            public int BroadcastCategoryID { get; set; }
            public string BroadcastName { get; set; }
            public string CoverImagePath { get; set; }
            public string Description { get; set; }
            public string ReleaseDate { get; set; }

            public List<Cast> Casts { get; set; }
            public double AverageReview { get; set; }
            

        }
        public List<Rows> FinalResult { get; set; }
        public IFormFile CoverImage { get; set; }
        public int Review { get; set; }
        public int BroadcastCategoryID { get; set; }
        public double AverageReview { get; set; }
        public int BroadCastType { get; set; }
        public int ShowButton { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }


    }
}
