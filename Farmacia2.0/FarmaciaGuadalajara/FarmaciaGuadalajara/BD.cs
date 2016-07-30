using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace FarmaciaGuadalajara
{
    class BD
    {
        public MySqlConnection conexionMySql()
        {
            MySqlConnection conexion = null;
            string cadenaConexion = "";
            cadenaConexion = "server=localhost;port=3306;uid=root;pwd=usbw;database=proyectoADS";
            try
            {
                conexion = new MySqlConnection(cadenaConexion);
            }
            catch (Exception ex)
            {
                throw new System.Exception(ex.Message);

            }
            return conexion;
        }
    }
}
