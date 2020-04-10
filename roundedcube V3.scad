// erstellt Kuben mit runden Ecken/Kanten in verschiedenen Varianten
// x= Ausdehnung des Kubus in X-Richtung
// y= Ausdehnung des Kubus in Y-Richtung
// z= Ausdehnung des Kubus in Z-Richtung
// radius= Radius der Kanten/Ecken
// type= Typ der Rundung
//       1 = Kanten gerundet in der Aufsicht des Kubus (Default)
//       2 = Kanten und Ecken gerundet in der Aufsicht des Kubus plus Oberseite
//       3 = alle Kanten und Ecken gerundet
// fn= Anzahl Segemente der Radien; entspricht $fn (Default = 20)
//
// Beispiel: roundedcube(20,20,20,4,3,10); Erstellt einen Würfel mit allen Kanten und
//            Ecken gerundet
// Version 2: der Kubus wird zentriert gebaut

module roundedcube(dimension=[1,1,1], radius=2, type=1, fn=20)
    {
	x=dimension[0];
	y=dimension[1];
	z=dimension[2];
    if(type==1)
        {
        hull()
            {
            translate([-x/2+radius, -y/2+radius, -z/2])
                cylinder(r=radius, h=z, $fn=fn);
            translate([x/2-radius, -y/2+radius, -z/2])
                cylinder(r=radius, h=z, $fn=fn);
            translate([x/2-radius, y/2-radius, -z/2])
                cylinder(r=radius, h=z, $fn=fn);
            translate([-x/2+radius, y/2-radius, -z/2])
                cylinder(r=radius, h=z, $fn=fn);
            }
        }
    
    if(type==2)
        {
        hull()
            {
            translate([-x/2+radius, -y/2+radius, -z/2])
                cylinder(r=radius, h=1, $fn=fn);
            translate([x/2-radius, -y/2+radius, -z/2])
                cylinder(r=radius, h=1, $fn=fn);
            translate([x/2-radius, y/2-radius, -z/2])
                cylinder(r=radius, h=1, $fn=fn);
            translate([-x/2+radius, y/2-radius, -z/2])
                cylinder(r=radius, h=1, $fn=fn);
                
            translate([-x/2+radius, -y/2+radius, z/2-radius])      // Linke vordere obere Ecke
                sphere(r=radius, $fn=fn);   
            translate([x/2-radius, -y/2+radius, z/2-radius])
                sphere(r=radius, $fn=fn);                          // Rechte vordere obere Ecke
            translate([x/2-radius, y/2-radius, z/2-radius])
                sphere(r=radius, $fn=fn);                          // Rechte hintere obere Ecke
            translate([-x/2+radius, y/2-radius, z/2-radius])
                sphere(r=radius, $fn=fn);                         // Linke hintere obere Ecke
            }
        }
    

    if(type==3)
        {
        hull()
            {
            translate([-x/2+radius, -y/2+radius, -z/2+radius])
                sphere(r=radius, $fn=fn); 
            translate([x/2-radius, -y/2+radius, -z/2+radius])
                sphere(r=radius, $fn=fn); 
            translate([x/2-radius, y/2-radius, -z/2+radius])
                sphere(r=radius, $fn=fn); 
            translate([-x/2+radius, y/2-radius, -z/2+radius])
                sphere(r=radius, $fn=fn); 
                
            translate([-x/2+radius, -y/2+radius, z/2-radius])      // Linke vordere obere Ecke
                sphere(r=radius, $fn=fn);   
            translate([x/2-radius, -y/2+radius, z/2-radius])
                sphere(r=radius, $fn=fn);                          // Rechte vordere obere Ecke
            translate([x/2-radius, y/2-radius, z/2-radius])
                sphere(r=radius, $fn=fn);                          // Rechte hintere obere Ecke
            translate([-x/2+radius, y/2-radius, z/2-radius])
                sphere(r=radius, $fn=fn);                          // Linke hintere obere Ecke
            }
        }  
}

