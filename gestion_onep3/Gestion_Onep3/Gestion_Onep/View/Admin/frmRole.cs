﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms; 

namespace Gestion_Onep.View.Admin
{
    public partial class frmRole : Form
    {
        bool NewObject = false;
        MODEL.Role curentObject;
        public frmRole()
        {
            InitializeComponent();
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect; 

            dataGridView1.SelectionChanged += (e,ee) =>
            {
                if (dataGridView1.SelectedRows.Count > 0)
                {
                    curentObject = (dataGridView1.SelectedRows[0].DataBoundItem as MODEL.Role);
                      txtNom.Text = curentObject.Nom; 
                    txtRemarque.Text = curentObject.Remarque;
                }
               
            }; 
        }
        protected override void OnLoad(EventArgs e)
        {
            dataGridView1.DataSource = BL.RoleBL.Instance.GetAll();
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
          //  userClass.add_user(txtNom.Text, txtMatricule.Text);
            // dataGridView1.DataSource = userClass.get_users();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {

                if (curentObject != null)
                {
                    curentObject.Remarque = txtRemarque.Text;
                    curentObject.Nom = txtNom.Text; 
                    //curentObject.datenaissance = dtNaissance.Value;
                    if (NewObject)
                    {
                        BL.RoleBL.Instance.Add(curentObject);
                    }
                    else
                    {
                        BL.RoleBL.Instance.Update(curentObject);
                    }
                    MessageBox.Show("Service enregister avec success");
                    btnNew.Enabled = !(NewObject = false);
                    dataGridView1.DataSource = BL.RoleBL.Instance.GetAll();

                }
            }
            catch (Exception)
            { 
              MessageBox.Show("Erreur pendant l'enregistrement");
            }
           
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (curentObject != null)
                {
                    BL.RoleBL.Instance.Delete(curentObject.Id);
                    dataGridView1.DataSource = BL.RoleBL.Instance.GetAll();
                }

            }
            catch (Exception)
            {
                MessageBox.Show("Service déjà utilisé");
            }
         
        
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = BL.RoleBL.Instance.GetAll();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnNew_Click(object sender, EventArgs e)
        { 
            btnNew.Enabled = !(NewObject = true);
            curentObject = new  MODEL.Role();
            txtRemarque.Text=txtNom.Text= "";
           
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
