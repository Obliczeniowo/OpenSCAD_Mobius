
r = 20;
r2 = 40;

module surface(r = 20, r2 = 30) {
    $fn = 100;

    difference() {
        circle(r = r);

        for(i = [0:180:180]) {
            rotate([0, 0, i])
            translate([r2 + 2, 0, 0])
            circle(r = r2);
            
        }
    }
}

difference() {
    for(angle = [0: 1: 360]) {

        hull() {
            rotate([0, angle, 0])
            translate([100, 0, 0])
            rotate([0, 0, angle])
            linear_extrude(0.1)
            surface(r, r2);
            
            rotate([0, angle + 1, 0])
            translate([100, 0, 0])
            rotate([0, 0, angle + 1])
            linear_extrude(0.1)
            surface(r, r2);
        }
        
    }

    for (angle = [0: 20: 360]) {
        rotate([0, angle, 0])
        translate([100, 0, 0])
        sphere(r - 4);
    }
}

difference() {
    for(angle = [0: 1: 360]) {

        hull() {
            rotate([0, angle, 0])
            translate([100, 0, 0])
            rotate([0, 0, angle + 90])
            linear_extrude(0.1)
            surface(r, r2);
            
            rotate([0, angle + 1, 0])
            translate([100, 0, 0])
            rotate([0, 0, angle + 1 + 90])
            linear_extrude(0.1)
            surface(r, r2);
        }
        
    }

    for (angle = [0: 20: 360]) {
        rotate([0, angle + 10, 0])
        translate([100, 0, 0])
        sphere(r - 4);
    }
}