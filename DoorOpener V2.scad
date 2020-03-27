
$fn=100;
wall = 2;
slack = 1;

baseplate();
translate([wall+slack,100,wall+slack])
    slider();


module baseplate() {
    
width = 60;
length = 90;
height = 20;

difference() {    
    cube([width,length,height]);
    translate([wall,wall,wall]) {
    cube([width-2*wall, length-1*wall, 999-2*wall]); }
}

// slider left
translate([wall, 0, height-2])
cube([4,length,wall]);

// slider right
translate([width-wall-4, 0, height-2])
cube([4,length,wall]);
}

module slider() {

width = 60-2*wall-2*slack;
length = 90-wall;
height = 20-2*wall-2*slack;
    
pedalHeight = 50;

difference() {
    union() {
        translate([4+slack, length/2-2 ,0])                                   // pedal
        cube([width-8-2*slack, 4, pedalHeight]);  

        difference() {  
            cube([width, length, height]);
        
            color("green")                                              // bottom hole
            translate([wall, wall, wall])
            cube([width-2*wall, length/2-2*wall, 999]);
    
            color("blue")                                               // top hole
            translate([wall, length/2+wall+10, wall])
            cube([width-2*wall, length/2-2*wall-10, 999]);
        }
    }
    translate([width/2, length/2-30 ,height/2])
        rotate([270, 0, 0])
            cylinder(r=2, h=999);
}

    
hull() {
// 3 cubes to build radius
color("red")   
translate([4+slack, length/2+1 ,height])
    cube([width-8-2*slack,1,1]);
color("red")   
translate([4+slack, length/2+1 ,height+10])
    cube([width-8-2*slack,1,1]);
color("red") 
translate([4+slack, length/2+11 ,height-1])
    cube([width-8-2*slack,1,1]);
}
}
