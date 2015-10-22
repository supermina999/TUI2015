/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maps;

import java.util.ArrayList;
import models.Location;
import models.Request;

public class Way {
    public Way()
    {
        requests = new ArrayList<>();
        cords = new ArrayList<>();
        deltas = new ArrayList<>();       
    }
    public int transportId;
    public ArrayList<Request> requests;
    public ArrayList<Location> cords; 
    public ArrayList<StockDelta> deltas;
    public int mask;
    public double time;
    
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