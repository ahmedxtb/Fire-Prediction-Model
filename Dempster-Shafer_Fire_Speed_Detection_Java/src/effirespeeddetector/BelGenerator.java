/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package effirespeeddetector;

/**
 *
 * @author Dilusha 
 when a node request the Bel(fire) value with the time and
 * locations,this class generates the relavant Bel value and send to the node.
 */
public class BelGenerator {

    public double getBelfire(Fire fire, double time, int xlocation, int ylocation, int initfireXlocation, int initfireYlocation) {
        double speed = fire.getSpeed();
        double distanceFromFirenode;
        double radius = (time - 1) * speed;//propagation of the firefollows a circle
        distanceFromFirenode = Math.pow(((Math.pow((xlocation - initfireXlocation), 2)) + (Math.pow((ylocation - initfireYlocation), 2))), 0.5);
        if (radius >= distanceFromFirenode) {
            return 1;
        } else {
            double r = distanceFromFirenode - radius;
            if (r <= 1) {
                return 0.8;
            } else if (r <= 2) {
                return 0.6;
            } else if (r <= 3) {
                return 0.4;
            } else if (r <= 4) {
                return 0.2;
            } else {
                return 0;
            }

        }



    }
}
