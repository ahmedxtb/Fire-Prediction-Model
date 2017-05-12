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
public class EFfirespeedDetector {

    /**
     * @param args the command line arguments
     */
    Vector<Node> nodes = new Vector<Node>();
    public Fire fire;
    private double fireSpeed=1;
    private double samplingtime = 1;
    private Filter filter = new Filter(samplingtime);//sampling time

    public static void main(String[] args) {
        EFfirespeedDetector ef = new EFfirespeedDetector();
        ef.initializeNodes(100);
        ef.setFire(35);

    }

    private void initializeNodes(int numberofNodes) {

        for (int i = 1; i <= numberofNodes; i++) {
            Node node = new Node(i,filter);
            nodes.add(node);

        }


    }

    private void setFire(int initNode) {
        fire = new Fire(initNode, fireSpeed);
        for (int i = 0; i < nodes.size(); i++) {
            nodes.get(i).calRegion(initNode);
        }
        this.setoutput(nodes, 10);

    }
//System.out.print(nodes.get(10).getNodeNo()+" "+nodes.get(10).getyLocation());

    public void setoutput(Vector<Node> nodes, int time) {
        Vector<Vector<Double>> stateswithtime = new Vector<Vector<Double>>();
        for (int k = 1; k <= time + 1; k++) {
            Vector<Double> states = new Vector<Double>();
            for (int i = 0; i < nodes.size(); i++) {
                double state;
                double input = nodes.get(i).calculateInput(k * samplingtime, this.fire); //sampling time is 1s
                if (k == 1) {
                    state = nodes.get(i).calculateState(new Vector<Double>(), input);
                } else {
                    state = nodes.get(i).calculateState(stateswithtime.get(k - 2), input);
                }
                states.add(state);
                
            }
            filter.dofilter(states, nodes,k, 35);
            stateswithtime.add(states);
        }
        for(int j=0;j<filter.estimatedSpeed.size();j++){
       System.out.println(filter.estimatedSpeed.get(j)+" "+(j+1)) ;
        }

//        for (int i = 0; i < stateswithtime.size(); i++) {
//            System.out.println("................................................................");
//            for (int k = 0; k < stateswithtime.get(i).size(); k++) {
//                if (k == 9 || k == 19 || k == 29 || k == 39 || k == 49 || k == 59 || k == 69 || k == 79 || k == 89) {
//                    System.out.println(stateswithtime.get(i).get(k));
//                } else {
//                    System.out.print(stateswithtime.get(i).get(k));
//                    System.out.print(" ");
//                }
//                //System.out.println(stateswithtime.get(i).get(k) + " " + nodes.get(k).getNodeNo());
//                //  filter.dofilter(stateswithtime.get(i), i+1, 1, 35);
//            }
//            System.out.println("");
//
//        }
    }
}
