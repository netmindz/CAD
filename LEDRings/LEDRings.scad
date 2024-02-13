ringDia = 180;
ringPad = 12;
cableDia = 12;

width = ringDia + (ringPad * 2);
thick = 20;
inset=7;
holeDia = 7;
holeInset = 20;


difference() {

         // Outer edge
        cube([width,width,thick]);
        
    translate([(width/2), (width/2), inset])
    cylinder(h=(thick - inset), d=ringDia, $fn=100);

    translate([(width/2), (width/2), 0])
    cylinder(h=(thick), d=cableDia, $fn=100);
    
         union() {
                translate([holeInset, holeInset, 0])
                cylinder(h=thick+10, d=holeDia, $fn=100);
            }

            union() {
                translate([holeInset, width - holeInset, 0])
                cylinder(h=thick+10, d=holeDia, $fn=100);
            }      
           
     };

