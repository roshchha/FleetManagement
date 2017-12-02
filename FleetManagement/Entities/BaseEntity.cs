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

        ///hhhh vishal
        List<string> ValidationMessages { get; set; }
    }
}