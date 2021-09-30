using System;
using System.Collections.Generic;
using System.Text;

namespace Data.EFModels
{
    public class BroadcastCategoryCast
    {
        public int CastID { get; set; }
        public Cast Cast { get; set; }
        public int BroadcastCategoryID { get; set; }
        public BroadcastCategory BroadcastCategory { get; set; }
    }
}
