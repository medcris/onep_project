//------------------------------------------------------------------------------
// <auto-generated>
//    Ce code a été généré à partir d'un modèle.
//
//    Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//    Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Gestion_Onep.MODEL
{
    using System;
    using System.Collections.Generic;
    
    public partial class Role
    {
        public Role()
        {
            this.agent = new HashSet<agent>();
        }
    
        public int Id { get; set; }
        public string Nom { get; set; }
        public string Remarque { get; set; }
    
        public virtual ICollection<agent> agent { get; set; }
    }
}
