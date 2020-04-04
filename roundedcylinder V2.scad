// creates a cylinder with rounded edges in 2 types
// function is interachangeable with the built-in "cylinder" function
// r=radius of cylinder. r1 = r2 = r
// r1= radius bottom of cone
// r2= radius top of cone
// h=height of the cylinder
// radius=radius of the rounded edge(s)
// type= type of the rounded edge(s)
// 		1 = top egde rounded [default]
//		2 = top and bottom edges rounded
// fn=number of segments of the cylinder itself and the rounded edges [default=99]
// center=false/true position on the axis [default=false]
//
// example: roundedcylinder(r=5, h=10);

module roundedcylinder(r=1, r1, r2, h=1, radius=1, center=false, type=1, fn=99) {
	$fn=fn;
	
	
	if(type==1) {
		if (center==true) {
			translate([0,0,-h/2])
			type1(r=r, r1=r1, r2=r2, h=h, radius=radius);
		} else {
			type1(r=r, r1=r1, r2=r2, h=h, radius=radius);
		}
	}
    
    if(type==2) {
		if (center==true) {
			translate([0,0,-h/2])
			type2(r=r, r1=r1, r2=r2, h=h, radius=radius);
		} else {
			type2(r=r, r1=r1, r2=r2, h=h, radius=radius);
		}
	}
}
	
module type1(r, r1, r2, h, radius) {
	rotate_extrude() {
		hull() {
			square(size=[radius, radius], center=false);			// front left corner
			if (r1==undef) {										// front right corner 
				translate([r-radius,0])								              
					square(size=[radius,radius], center=false);
			} else {
				echo(r1);
				translate([r1-radius,0])             
					square(size=[radius,radius], center=false);
			}		
			if (r2==undef) {										// rear right corner
				translate([r-radius,h-radius])							
					circle(radius);
			} else {
				translate([r2-radius,h-radius])
					circle(radius);
				}
			translate([0,h-radius])									// rear left corner
				square(size=[radius,radius], center=false);
		} 
	}
}
	
	
module type2(r, r1, r2, h, radius) {
	rotate_extrude() {
		hull() {
			square(size=[radius, radius], center=false);				// front left corner
			if (r1==undef) {											// front right corner 
				translate([r-radius,0+radius])             
					circle(radius);
			} else {
				translate([r1-radius,0+radius])             
					circle(radius);
			}
			if (r2==undef) {											// rear right corne
				translate([r-radius,h-radius])
					circle(radius);
			} else {
				translate([r2-radius,h-radius])
					circle(radius);
			}
			translate([0,h-radius])										// rear left corner
				square(size=[radius,radius], center=false);				
		} 
	}
}

