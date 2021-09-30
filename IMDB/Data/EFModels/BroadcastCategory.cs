using System;
using System.Collections.Generic;
using System.Text;

namespace Data.EFModels
{
    public class BroadcastCategory
    {
        public int BroadcastCategoryID { get; set; }
        public int BroadcastCategoryTypeID { get; set; }
        public BroadcastCategoryType BroadcastCategoryType { get; set; }
        public string Title { get; set; }
        public string CoverImagePath { get; set; }
        public string Description { get; set; }
        public DateTime ReleaseDate { get; set; }
        public double AvgScore { get; set; }

    }
}
