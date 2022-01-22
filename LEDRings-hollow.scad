ringDia = 180;
ringPad = 5;

width = ringDia + (ringPad * 2);
thick = 20;
wallThick = 4;
inset=1;
holeDia = 20;

//intersection() {

difference() {

         // Outer edge
        cube([width,width,thick]);
        
        // Inner surface to make cube hollow
        translate([wallThick, wallThick, wallThick])
        cube([width - (wallThick * 2),width - (wallThick * 2), (thick - (wallThick * 2))]);    


        translate([(width/2), (width/2), inset])
        cylinder(h=thick, d=ringDia, $fn=100);
 
         union() {
                translate([holeDia, holeDia, 0])
                cylinder(h=thick+10, d=holeDia, $fn=100);
            }

            union() {
                translate([holeDia, width - holeDia, 0])
                cylinder(h=thick+10, d=holeDia, $fn=100);
            }      
           
     };
//};

difference() {
    translate([(width/2), (width/2), inset])
    cylinder(h=(thick - inset), d=ringDia, $fn=100);

    translate([(width/2), (width/2), inset])
    cylinder(h=(thick - inset), d=ringDia - wallThick, $fn=100);
}