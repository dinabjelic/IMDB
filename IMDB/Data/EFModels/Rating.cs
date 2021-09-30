using System;
using System.Collections.Generic;
using System.Text;

namespace Data.EFModels
{
    public class Rating
    {
        public int RatingID { get; set; }
        public int BroadcastCategoryID { get; set; }
        public BroadcastCategory BroadcastCategory { get; set; }
        public int Review { get; set; }
    }
}
