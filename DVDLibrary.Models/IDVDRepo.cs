﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DVDLibrary.Models
{
    public interface IDVDRepo
    {
        List<DVD> GetAllDVDs();
        DVD GetDVDByTitle(string title);
        DVD GetDVDById(int id);
        int AddDVD(DVD dvd);
        void RemoveDVD(int id);
        List<DVDActorDetail> GetActorDetails(int dvdId);
        List<Actor> GetAllActors(int actorId);
        List<MPAA> GetAllMPAA();
        List<Studio> GetAllStudios();


    }
}