include <../Common Objects/roundedcube V4.scad>;
include <../Common Objects/roundedcylinder V2.scad>;


$fn=99;
wall = 2;
slack = 1;
rope = 4;


baseplate();
translate([0,0,88])
	cap();
translate([0,0,25])
        slider();
translate([0, 100, 0])
    handle();


module baseplate() {
    outerDiameter = 27;
    outerRadius = outerDiameter/2;
    height = 90;
	innerRadius = outerRadius-wall;
	innerDiameter = innerRadius*2;

	
	difference() {
		hull() {
			roundedcylinder(r=outerRadius, h=height, type=2);
			translate([-15, outerRadius-1, 0])
				roundedcube([30, 1, height], type=3);
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
		rotate([180,0,0])
			roundedcylinder(r2=outerRadius-slack, r1=outerRadius, h=height, radius=0.5, type=1, center=true);			// outer cylinder
		cylinder(r=outerRadius-wall, h=height, center=true);								// hole
	}
	
	translate([0,0,height/2])
		roundedcylinder(r=outerRadius+wall, h=wall, radius=0.5, type=2);		// brim
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
		roundedcylinder(r=radius, h=height, type=2, radius=1, fn=$fn);
		cylinder(r=ropeDiameter/2, h=height);
	}
	translate([-pedalWidth/2,-pedalLength-radius+1, 0])
		roundedcube([pedalWidth, pedalLength+2, pedalHeight], type=3, radius=1, fn=$fn);
	
	hull() {
	translate([0,-radius-7,pedalHeight-1])  					 // marker on pedal for hull
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
		roundedcylinder(r=radius+wall/2, h=height, radius=0.5);
        cylinder(r=radius, h=height);
        translate([radius/2, -wall/2-1, 0])
            cube([15, wall*2, height]);
    }
    
    difference() {
        union() {
            translate([radius-0.25, -wall/2-3, 0])
                roundedcube([15, wall, height], type=3, radius=1);
       		
            translate([radius-0.25, -wall/2+3, 0])
                roundedcube([15, wall, height], type=3, radius=1);
        }
        
        translate([radius/2+2*wall+6, 100, height/2])
            rotate([90, 0, 0])
                cylinder(r=screw/2, h=999);
        
        translate([radius/2+2*wall+12, 100, height/2])
            rotate([90, 0, 0])
                cylinder(r=rope/2, h=999);
    }
}

