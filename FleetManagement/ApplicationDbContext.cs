using FleetManagement.Enums;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Newtonsoft.Json.Linq;
using System.Data;

namespace FleetManagement
{
    public class ApplicationDbContext :  IdentityDbContext<IdentityUser>
    {
        public ApplicationDbContext()
        {
        }
    }
}