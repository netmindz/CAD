$fn=200;

length = 86;
width= 46;
height = 19;
cornerRadius = 0;

translate([10, 10, 0]){
    difference() {
            roundedBox(length, width, height, cornerRadius); 
            translate([1,1,1]) {
                roundedBox(length-2, width-2, height-1, cornerRadius); 
            }
    }
}


translate([((width*2) + 20), 10, 0]){
    mirror([1,0,0]) {
        roundedBox(length, width, 1, cornerRadius);
        difference() {
            translate([1,1,0]) {
                roundedBox(length-2,width-2,4,cornerRadius);
            }
            translate([2,2,0]) {
                roundedBox(length-4,width-4,4,cornerRadius);
            }    
        }
    }
}




module roundedBox(length, width, height, radius)
{
    dRadius = 2*radius;

    //cube bottom right
    translate([width-dRadius,-radius,0]) {
        cube(size=[radius,radius,height+0.01]);
    }

    //cube top left
    translate([-radius,length-dRadius,0]) {
        cube(size=[radius,radius,height+0.01]);
    }

    //base rounded shape
    minkowski() {
        cube(size=[width-dRadius,length-dRadius, height]);
        cylinder(r=radius, h=0.01);
    }
  
    
  
}