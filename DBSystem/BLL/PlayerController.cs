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
    public class PlayerController //Players
    {
        public List<Players> FindByID(int id)
        {
            using (var context = new Context())
            {
                IEnumerable<Players> results =
                    context.Database.SqlQuery<Players>("Player_GetByTeam @ID"
                        , new SqlParameter("ID", id));
                return results.ToList();
            }
        }
    }
}
