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
public class Filter {

    double samplingTime;
    public Vector<Double> estimatedSpeed=new Vector<Double>();
    public Filter(double samplingTime) {
        this.samplingTime = samplingTime;
    }
   

    public void dofilter(Vector<Double> output,Vector<Node> nodes,int timestep,int fireinitnodeno) {
    Node fireInitNode=nodes.get(fireinitnodeno-1)  ;
    Node nodeinfire;
    double maxdis=0.0;
        for (int j = 0; j < output.size(); j++) {
         if(output.get(j) ==1.0)  {
           nodeinfire= nodes.get(j) ;
           double distance=this.getdistance(fireInitNode, nodeinfire);
           if(maxdis<distance)
           {
         maxdis=distance;
           }
         } 
        }
        this.estimatedSpeed.add(maxdis/(timestep*this.samplingTime-1)) ;
    }
    public void filterfromsignals(int nodeno,double time){
            
        }
    private double getdistance(Node fireInitNode,Node nodeinfire){
        
      double  distanceFromFirenode = Math.pow(((Math.pow((nodeinfire.getxLocation() - fireInitNode.getxLocation()), 2)) + (Math.pow((nodeinfire.getyLocation() - fireInitNode.getyLocation()), 2))), 0.5);
       return distanceFromFirenode;
    }
}
