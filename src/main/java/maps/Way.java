/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package map;

import java.util.ArrayList;
import models.Location;

public class Way {
    public Way()
    {
        requests = new ArrayList<>();
        cords = new ArrayList<>();
        deltas = new ArrayList<>();       
    }
    public int transportId;
    public ArrayList<Integer> requests;
    public ArrayList<Location> cords; 
    public ArrayList<StockDelta> deltas;
    public int mask;
    
    static public class StockDelta
    {
        public StockDelta(int stockId, int resourceTypeId, int delta)
        {
            this.stockId = stockId;
            this.resourceTypeId = resourceTypeId;
            this.delta = delta;
        }
        public int stockId;
        public int resourceTypeId;
        public int delta;
    }
  
}
