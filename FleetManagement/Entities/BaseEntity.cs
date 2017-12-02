using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FleetManagement.Entities
{
    public class BaseEntity
    {
        public Enums.ObjectState ObjState { get; set; }
        List<string> ValidationErrors { get; set; }
        //test

        //hhh - roshu
        //3333
        List<string> ValidationMessages { get; set; }
    }
}