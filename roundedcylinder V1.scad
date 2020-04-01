// erstellt Zylinder mit runden Kanten in verschiedenen Varianten
// r=Radius des Zylinders
// h=Hoehe des Zylinder
// radius=Radius der Kanten/Ecken
// type= Typ der Rundung
//       1 = Kanten gerundet in der Aufsicht des Zylinders (Default)
//       2 = alle Kanten gerundet
// fn= Anzahl Segemente der Radien; entspricht $fn (Default = 100)
//
//Beispiel: roundedcylinder(5,10); Erstellt einen Zylinder mit allen Kanten gerundet

module roundedcylinder(r, h, radius=2, type=2, fn=100)
    {
    if(type==1)
        {
        translate([0,0,-h/2])
        rotate_extrude($fn=fn)
            {
            hull()
                {
                square(size=[radius, radius], center=false);             // Linke untere Ecke
                translate([r-radius,0])                                  // Rechte untere Ecke               
                    square(size=[radius,radius], center=false);     
                translate([r-radius,h-radius])
                    circle(radius, $fn=fn);                              // Rechte obere Ecke
                translate([0,h-radius])
                    square(size=[radius,radius], center=false);          // Linke obere Ecke
                } 
            }
        }
    
    if(type==2)
        {
        translate([0,0,-h/2])
        rotate_extrude($fn=fn)
            {
            hull()
                {
                square(size=[radius, radius], center=false);             // Linke untere Ecke
                translate([r-radius,0+radius])                           // Rechte untere Ecke               
                    circle(radius, $fn=fn);     
                translate([r-radius,h-radius])
                    circle(radius, $fn=fn);                              // Rechte obere Ecke
                translate([0,h-radius])
                    square(size=[radius,radius], center=false);          // Linke obere Ecke
                } 
            }
        }
   
}

