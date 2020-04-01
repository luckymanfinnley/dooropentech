 include <../Common Objects/roundedcube V3.scad>;
  include <../Common Objects/roundedcylinder V1.scad>;


$fn=99;
wall = 2;
slack = 1;
rope = 4;


baseplate();
translate([0,0,87])
	cap();
translate([0,0,25])
        slider();
translate([0, 200, 0])
    handle();


module baseplate() {
    outerDiameter = 27;
    outerRadius = outerDiameter/2;
    height = 90;
	innerRadius = outerRadius-wall;
	innerDiameter = innerRadius*2;

	
	difference() {
		hull() {
			cylinder(r=outerRadius, h=height);
			translate([-15, outerRadius-1, 0])
				cube([30, 1, height]);
		}
		translate([0,0,wall])
		cylinder(r=innerRadius, h=height);
		translate([-7,-20,wall])
			cube([14, 20, height]);
	}

}

module cap() {
    height = 5;
	slack=0.2;
	outerDiameter = 27-2*wall;
    outerRadius = outerDiameter/2;

	difference() {
	cylinder(r1=outerRadius-slack, r2=outerRadius ,h=height);			// outer cylinder
	cylinder(r=outerRadius-wall, h=height);								// hole
	}
	
	translate([0,0,height])
		roundedcylinder(r=outerRadius+wall, h=wall, radius=0.5);		// brim
}

module slider() {
    diameter = 20;
    radius = diameter/2;
	ropeDiameter=4;
    height = 40;
	pedalLength=32;
	pedalWidth=12;
	pedalHeight=6;
    
	difference() {
		translate([0,0,height/2])
			roundedcylinder(r=radius, h=height, type=2, radius=1, fn=$fn);
		cylinder(r=ropeDiameter/2, h=height);
	}
	translate([0,-pedalLength/2-radius+2, pedalHeight/2])
		roundedcube([pedalWidth, pedalLength+2, pedalHeight], type=3, radius=1, fn=$fn);
	
	hull() {
	translate([0,-radius-10,pedalHeight-1])  					 // marker on pedal for hull
		cylinder(r=pedalWidth/2-1, h=0.1);
	translate([-(pedalWidth-2)/2,-radius+2,pedalHeight+9])  	 // marker on cylinder for hull
		cube([pedalWidth-2, 0.1, 0.1]);
	translate([-(pedalWidth-2)/2,-radius+2,pedalHeight])   		// marker on corner for hull
		cube([pedalWidth-2, 0.1,0.1]);
	}

 
}

module handle() {

    innerDiameter = 19.5;
    radius = innerDiameter/2;
    height=15;
    screw = 3.2;
    
    difference() {
        cylinder(r=radius+wall/2, h=height);
        cylinder(r=radius, h=height);
        translate([radius/2, -wall/2, 0])
            cube([15, wall, height]);
    }
    
    difference() {
        union() {
            translate([radius, -wall/2-2, 0])
                cube([15, wall, height]);
       
            translate([radius, -wall/2+2, 0])
                cube([15, wall, height]);
        }
        
        translate([radius/2+2*wall+6, 100, height/2])
            rotate([90, 0, 0])
                cylinder(r=screw/2, h=999);
        
        translate([radius/2+2*wall+12, 100, height/2])
            rotate([90, 0, 0])
                cylinder(r=rope/2, h=999);
    }
}

