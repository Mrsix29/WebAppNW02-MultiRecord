using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using DBSystem.DAL;
using DBSystem.ENTITIES;

namespace DBSystem.BLL
{
    public class TeamController //Category
    {
        public List<Teams> List()
        {
            using (var context = new Context())
            {
                return context.Teams.ToList();
            }
        }
        public Teams Teams_FindByID(int teamid)
        {
            using (var context = new Context())
            {
                return context.Teams.Find(teamid);
            }
        }
    }
}
