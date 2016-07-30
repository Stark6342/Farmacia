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
    public partial class frmPrincipal : Form
    {
        public frmPrincipal()
        {
            InitializeComponent();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            frmEmpleados frm = new frmEmpleados();
            frm.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            frmProductos frm = new frmProductos();
            frm.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            frmConsultaProducto frm = new frmConsultaProducto();
            frm.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            frmVenta frm = new frmVenta();
            frm.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            frmConsultaVentas frm = new frmConsultaVentas();
            frm.Show();
        }

        private void frmPrincipal_Load(object sender, EventArgs e)
        {

        }

        private void btnInventario_Click(object sender, EventArgs e)
        {
            frmInventario frm = new frmInventario();
            frm.Show();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            var confirmResult = MessageBox.Show("¿Quiere cerrar la sesión ? ",
                                     "Confirme",
                                     MessageBoxButtons.OKCancel);
            if (confirmResult == DialogResult.OK)
            {
                this.Close();
            }
        }
    }
}
