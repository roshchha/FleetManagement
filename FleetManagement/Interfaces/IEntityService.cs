using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FleetManagement.Interfaces
{
    interface IEntityService<T>
    {
        /// <summary>
        /// Get all entities or entity for the given ID
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        List<T> Get(int ID = 0);

        /// <summary>
        /// Insert the entity into database
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        bool Insert(T obj);

        /// <summary>
        /// Update the entity into database
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        bool Update(T obj);

        /// <summary>
        /// Delete the entity from database
        /// </summary>
        /// <param name="ID"></param>
        /// <returns></returns>
        bool Delete(int ID);

        /// <summary>
        /// Create entity object from datarow
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        T Fill(DataRow item);
    }
}
