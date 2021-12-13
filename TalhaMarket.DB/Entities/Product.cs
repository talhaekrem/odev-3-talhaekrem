﻿using System;
using System.Collections.Generic;

#nullable disable

namespace TalhaMarket.DB.Entities
{
    public partial class Product
    {
        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public string DisplayName { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public int Stock { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime InsertDate { get; set; }
        public DateTime? UpdateDate { get; set; }
        public int InsertedUser { get; set; }
        public int? UpdatedUser { get; set; }

        public virtual Category Category { get; set; }
        public virtual User InsertedUserNavigation { get; set; }
    }
}
