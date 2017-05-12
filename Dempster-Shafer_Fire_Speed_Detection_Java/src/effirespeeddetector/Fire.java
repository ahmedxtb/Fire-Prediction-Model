/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package effirespeeddetector;

/**
 *
 * @author Dilusha
 */
public class Fire {
   private int initNode;
   private double speed;

    public Fire(int initNode, double speed) {
        this.initNode = initNode;
        this.speed = speed;
    }

   
    public int getInitNode() {
        return initNode;
    }

    public void setInitNode(int initNode) {
        this.initNode = initNode;
    }

    public double getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }
   
}
