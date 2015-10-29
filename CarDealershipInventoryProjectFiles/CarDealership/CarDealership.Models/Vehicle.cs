﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarDealership.Models
{
    public class Vehicle
    {
        public int VehicleID { get; set; }
        public string Make { get; set; }
        public string Model { get; set; }
        public DateTime Year { get; set; }
        public int Milage { get; set; }
        public string AdTitle { get; set; }
        public string Description { get; set; }
        public decimal? Price { get; set; }
        public string UrlPicture { get; set; }
        public bool IsAvailable { get; set; }
    }
}