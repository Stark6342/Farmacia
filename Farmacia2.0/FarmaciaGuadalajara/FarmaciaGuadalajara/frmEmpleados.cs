using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FarmaciaGuadalajara
{
    public partial class frmEmpleados : Form
    {
        public frmEmpleados()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmAltaEmpleado frm = new frmAltaEmpleado();
            frm.Show();
            this.SetVisibleCore(false);
        }

        private void frmEmpleados_Load(object sender, EventArgs e)
        {
            Procesos persona = new Procesos();

            DataTable empleados = new DataTable();
            try
            {
                lv.Clear();
                lv.Columns.Add("Nombre", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Paterno", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Materno", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Telefono", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Calle", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Colonia", 100, HorizontalAlignment.Left);
                lv.Columns.Add("Número", 100, HorizontalAlignment.Left);

                empleados = persona.getEmpleados();
                for (int i = 0; i < empleados.Rows.Count; i++)
                {
                    DataRow dr = empleados.Rows[i];
                    ListViewItem listitem = new ListViewItem(dr["nombre"].ToString());
                    listitem.Tag = dr["idEmpleado"].ToString();
                    listitem.SubItems.Add(dr["paterno"].ToString());
                    listitem.SubItems.Add(dr["materno"].ToString());
                    listitem.SubItems.Add(dr["telefono"].ToString());
                    listitem.SubItems.Add(dr["calle"].ToString());
                    listitem.SubItems.Add(dr["colonia"].ToString());
                    listitem.SubItems.Add(dr["numero"].ToString());
                    lv.Items.Add(listitem);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                this.Close();
            }

        }
    }
}
