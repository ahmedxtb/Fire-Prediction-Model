/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package effirespeeddetector;

import java.util.Vector;

/**
 *
 * @author Dilusha
 */
public class Node {

    private int nodeNo;
    private String region;
    private int xLocation;
    private int yLocation;
    private int initfireXLocation;
    private int initfireYLocation;
    private BelGenerator belgen = new BelGenerator();
    private Filter filter;

    Node(int nodeNo, Filter filter) {

        this.nodeNo = nodeNo;
        Vector<Integer> location = this.calculatenodelocation(nodeNo);
        this.xLocation = location.get(0);
        this.yLocation = location.get(1);
        this.filter = filter;
    }
    //calculate either the fire initiate node or current node location

    private Vector<Integer> calculatenodelocation(int initNode) {
        int xintlocation = 0;
        int yintlocation = 0;
        Vector<Integer> initLocation = new Vector<Integer>();
        xintlocation = (initNode % 10);
        if (xintlocation == 0) {
            xintlocation = 10;
        }

        double y = initNode / 10.0;

        if (y <= 1.0) {
            yintlocation = 1;
        } else if (y <= 2.0) {
            yintlocation = 2;
        } else if (y <= 3.0) {
            yintlocation = 3;
        } else if (y <= 4.0) {
            yintlocation = 4;
        } else if (y <= 5.0) {
            yintlocation = 5;
        } else if (y <= 6.0) {
            yintlocation = 6;
        } else if (y <= 7.0) {
            yintlocation = 7;
        } else if (y <= 8.0) {
            yintlocation = 8;
        } else if (y <= 9.0) {
            yintlocation = 9;
        } else if (y <= 10.0) {
            yintlocation = 10;
        }
        initLocation.add(xintlocation);
        initLocation.add(yintlocation);
        return initLocation;

    }

    public double calculateInput(double time, Fire fire) {
        double belFire = this.belgen.getBelfire(fire, time, this.xLocation, this.yLocation, this.initfireXLocation, this.initfireYLocation);
        return belFire;
    }

    public double calculateState(Vector<Double> previousTimestates, double input) //previousTimestates =states of the all the nodes at previous tome instance
    {
        double state;
        //this.readdatabase(nodeNo);
        //this.savedatabase(nodeNo); //then save the state in the database
        if (previousTimestates.size() != 0) {
            if (this.region == "A") {
                //first get the node number of the neighboring node,this depends of the region.then get its previous state from the vector
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation + 1, this.yLocation - 1) - 1) + 0.5 * input;


            } else if (this.region == "B") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation, this.yLocation - 1) - 1) + 0.5 * input;

            } else if (this.region == "C") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation - 1, this.yLocation - 1) - 1) + 0.5 * input;

            } else if (this.region == "D") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation - 1, this.yLocation) - 1) + 0.5 * input;

            } else if (this.region == "E") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation - 1, this.yLocation + 1) - 1) + 0.5 * input;

            } else if (this.region == "F") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation, this.yLocation + 1) - 1) + 0.5 * input;

            } else if (this.region == "G") {
                state = 0.5 * previousTimestates.get(this.getNodefromLocation(this.xLocation + 1, this.yLocation + 1) - 1) + 0.5 * input;

            } else if (this.region == "H") { //region is H
                int nodeno = this.getNodefromLocation(this.xLocation + 1, this.yLocation);
                double prevstate = previousTimestates.get(nodeno - 1);
//          if(this.nodeNo==34){
//              System.out.println(prevstate+" "+xLocation+" "+yLocation+"************************************");
//          }
                state = 0.5 * prevstate + 0.5 * input;

            } else {//the fire init node "O"
                state = input;
            }

        } else { //at the first time step,initial states are zero
            state = 1 * input;
            return state;
        }
        if (state == 1) {
         filter.filterfromsignals(this.nodeNo, state);  
        }
        return state;
    }

    private int getNodefromLocation(int xlocation, int ylocation) {
        int node = (ylocation - 1) * 10 + xlocation;
        return node;
    }

    private void savedatabase(double todatabase) {
    }

    private void readdatabase(double todatabase) {
        //read the 
    }

    public double calculateOutput() {
        return 1;
    }

    public int getNodeNo() {
        return nodeNo;
    }

    public int getxLocation() {
        return xLocation;
    }

    public int getyLocation() {
        return yLocation;
    }

    public void calRegion(int initfireNode) {
        Vector<Integer> initfirelocation = this.calculatenodelocation(initfireNode);
        this.initfireXLocation = initfirelocation.get(0);
        this.initfireYLocation = initfirelocation.get(1);
        if (this.yLocation > initfirelocation.get(1) && this.xLocation < initfirelocation.get(0)) {
            this.region = "A";

        } else if (this.xLocation == initfirelocation.get(0) && this.yLocation > initfirelocation.get(1)) {
            this.region = "B";

        } else if (this.yLocation > initfirelocation.get(1) && this.xLocation > initfirelocation.get(0)) {
            this.region = "C";

        } else if (this.yLocation == initfirelocation.get(1) && this.xLocation > initfirelocation.get(0)) {
            this.region = "D";

        } else if (this.yLocation < initfirelocation.get(1) && this.xLocation > initfirelocation.get(0)) {
            this.region = "E";

        } else if (this.xLocation == initfirelocation.get(0) && this.yLocation < initfirelocation.get(1)) {
            this.region = "F";

        } else if (this.yLocation < initfirelocation.get(1) && this.xLocation < initfirelocation.get(0)) {
            this.region = "G";

        } else if (this.yLocation == initfirelocation.get(1) && this.xLocation < initfirelocation.get(0)) {
            this.region = "H";

        } else //if the node itself is the fire init node
        {
            this.region = "O";
        }
    }

    public String getRegion() {
        return region;
    }
}
