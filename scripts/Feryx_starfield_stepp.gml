///Feryx_starfield_stepp()
/*
    Simple horizontal/vertical speed with parallax math. Only
    needed after the Feryx_starfield_Speed has been called
*/
background_hspeed[6]=(sph);         // Speed is -player speed
background_vspeed[6]=(spv);

background_hspeed[5]=(sph/2);       // Speed is 1/2 -player speed
background_vspeed[5]=(spv/2);

background_hspeed[4]=(sph/3);       // Speed is 1/3 -player speed
background_vspeed[4]=(spv/3);

background_hspeed[3]=(sph/4);       // Speed is 1/4 -player speed
background_vspeed[3]=(spv/4);

background_hspeed[2]=(sph/5);       // Speed is 1/5 -player speed
background_vspeed[2]=(spv/5);
