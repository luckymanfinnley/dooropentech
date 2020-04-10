// works exactly like the built-in cube function but produces cubes with rounded corners
// type = 1 [default] rounded edges top view
// type = 2 rounded edges top view and rounded edges and corners on the top
// type = 3 all corners and edges rounded
//
// radius radius of the edges and corners [default = 1]
//
// center = true|false position of the cube in the system [default = false]
//
// fn resolution of the rounded edges and corners [default = 99] 
//
// example roundedcube([10,10,10]);

module roundedcube(dimension=[1,1,1], radius=1, type=1, fn=99, center=false)
    {
	x=dimension[0];
	y=dimension[1];
	z=dimension[2];
	$fn=fn;
	
    if(type==1) {
		if (center == true) {
			type1(x=x, y=y, z=z, radius=radius);
		 } else { 
			translate([x/2,y/2,z/2])
				type1(x=x, y=y, z=z, radius=radius);
		}
	}
    
    if(type==2) {
		if (center==true) {
			type2(x=x, y=y, z=z, radius=radius);
		} else {
			translate([x/2,y/2,z/2])
				type2(x=x, y=y, z=z, radius=radius);
		}
	}
    

    if(type==3) {
		if (center==true) {
			type3(x=x, y=y, z=z, radius=radius);
		} else {
			translate([x/2,y/2,z/2])
				type3(x=x, y=y, z=z, radius=radius);
		}
	}
        
}

module type1(x, y, z, radius) {
	hull() {												// hull four cylinders
		translate([-x/2+radius, -y/2+radius, -z/2])			// front left corner full height cylinder
		   cylinder(r=radius, h=z);
		translate([x/2-radius, -y/2+radius, -z/2])			// front right corner full height cylinder
			cylinder(r=radius, h=z);
		translate([x/2-radius, y/2-radius, -z/2])			// rear right corner full height cylinder
			cylinder(r=radius, h=z);
		translate([-x/2+radius, y/2-radius, -z/2])			// rear left corner full height cylinder
			cylinder(r=radius, h=z);
		}
}

module type2(x, y, z, radius) {
	hull() {												// hull four cylinder bottom and four spheres top
		translate([-x/2+radius, -y/2+radius, -z/2])			// front left corner small cylinder
			cylinder(r=radius, h=z/999);
		translate([x/2-radius, -y/2+radius, -z/2])			// front right corner small cylinder
			cylinder(r=radius, h=z/999);
		translate([x/2-radius, y/2-radius, -z/2])			// rear right corner small cylinder
			cylinder(r=radius, h=z/999);
		translate([-x/2+radius, y/2-radius, -z/2])			// rear left corner small cylinder
			cylinder(r=radius, h=z/999);
			
		translate([-x/2+radius, -y/2+radius, z/2-radius])   // top front left corner sphere
			sphere(r=radius);   
		translate([x/2-radius, -y/2+radius, z/2-radius])	// top front right corner sphere
			sphere(r=radius);                          
		translate([x/2-radius, y/2-radius, z/2-radius])		// top rear right corner sphere
			sphere(r=radius);                          
		translate([-x/2+radius, y/2-radius, z/2-radius])	// top rear left corner sphere
			sphere(r=radius);                          
		}
}

module type3(x, y, z, radius) {
	hull() {
		translate([-x/2+radius, -y/2+radius, -z/2+radius])	// bottom front left corner sphere
			sphere(r=radius); 
		translate([x/2-radius, -y/2+radius, -z/2+radius])	// bottom front right corner sphere
			sphere(r=radius); 
		translate([x/2-radius, y/2-radius, -z/2+radius])	// bottom rear right corner sphere
			sphere(r=radius); 
		translate([-x/2+radius, y/2-radius, -z/2+radius])	// bottom rear left corner sphere
			sphere(r=radius); 
			
		translate([-x/2+radius, -y/2+radius, z/2-radius])	// top front left corner sphere
			sphere(r=radius);   
		translate([x/2-radius, -y/2+radius, z/2-radius])	// top front right corner sphere
			sphere(r=radius);                          
		translate([x/2-radius, y/2-radius, z/2-radius])		// top rear right corner sphere
			sphere(r=radius);                       
		translate([-x/2+radius, y/2-radius, z/2-radius])	// top rear left corner sphere
			sphere(r=radius);                          
		}
}
