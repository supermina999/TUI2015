package maps;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import models.DBEntry;
import models.EntryType;
import static models.EntryType.Date;
import models.Location;
import models.Request;
import models.Resource;
import models.Stock;
import models.Transport;

public class Planner {
    static Boolean isNBit(int mask, int n)
    {
        return ((mask >> n) & 1) == 1;
    }
    static int setNBit(int mask, int n)
    {
        return mask | (1 << n);
    }
    
    static ArrayList<Way> getPlan(Date date) throws Exception
    {
        maps.Map.load();
        ArrayList<Way> ways = new ArrayList<>();
        //Loading data
        Stock[] stocksM = Stock.getAll(null);
        Map<Integer, Stock> stocks = new HashMap<>();
        for (Stock buf : stocksM)
        {
            stocks.put(buf.getId(), buf);
        }
        DBEntry[] params = {
            new DBEntry("date", EntryType.Date, date)
        };
        Request[] requestsM = Request.getAll(params);
        Map<Integer, Request> requests = new HashMap<>();
        for (Request buf : requestsM)
        {
            requests.put(buf.getId(), buf);
        }
        Transport[] cars = Transport.getAll(null);
        
        Map<Integer, Integer> stockNodes = new HashMap<>();
        Map<Integer, Integer> RequestNodes = new HashMap<>();
        int m = 1;
        ArrayList<Location> allLocs = new ArrayList<>();
        for (Stock stock: stocksM)
        {
            allLocs.add(stock.getLocation());
            m = Math.max(stock.getLocationId(), m);
        }
        for (Request request : requestsM) {
            allLocs.add(request.getLocation());
            m = Math.max(request.getLocationId(), m);
        }
        
        double[][] distances = new double[m][m];
        for (Location loc1 : allLocs)
            for (Location loc2 : allLocs)
            {
                if (loc1.onMapId == -1) {
                    loc1.onMapId = maps.Map.getNodeByCoord(loc1.getXCoord(), loc1.getYCoord());
                }
                if (loc2.onMapId == -1) {
                    loc2.onMapId = maps.Map.getNodeByCoord(loc2.getXCoord(), loc2.getYCoord());
                }
                distances[loc1.getId()][loc2.getId()] = maps.Map.getDistance(loc1.onMapId, loc2.onMapId, 0);
                // Warning! No safety set!
            }
        
        
        int n = requestsM.length;
        // Generating bitmasks
        for(Transport car : cars)
        {
            for (int i1 = -1; i1 < n; i1++)
            for (int i2 = -1; i2 < n; i2++)
            if (i1 != i2)
            for (int i3 = -1; i3 < n; i3++)
            if (i1 != i3 && i2 != i3)
            for (int i4 = -1; i4 < n; i4++)
            if (i1 != i4 && i2 != i4 && i3 != i4)   
            for (int i5 = -1; i5 < n; i5++)
            if (i1 != i5 && i2 != i5  && i3 != i5 && i4 != i5)
            for (int i6 = 0; i6 < stocksM.length; i6++)
            for (int i7 = 0; i7 < stocksM.length; i7++)
            {
                int mask = 0;
                if (i1 >= 0) mask = setNBit(mask, i1);
                if (i2 >= 0) mask = setNBit(mask, i2);
                if (i3 >= 0) mask = setNBit(mask, i3);
                if (i4 >= 0) mask = setNBit(mask, i4);
                if (i5 >= 0) mask = setNBit(mask, i5);
                if (mask != 0)
                {
                    int k1 = Stock.getOne(car.getStockId()).getLocationId();
                    int k2 = stocksM[i6].getLocationId();
                    int k3 = stocksM[i7].getLocationId();
                    
                    //Generating needed resource list & calculating total weight;
                    double weight = 0;
                    Map<Integer, Integer> recourcesNeeded = new HashMap<>();
                    if (i1 >= 0) 
                    {
                        int resTypeId = requestsM[i1].getResourceId();
                        int resTypeCnt = requestsM[i1].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight()*resTypeCnt;
                    }
                    if (i2 >= 0) 
                    {
                        int resTypeId = requestsM[i2].getResourceId();
                        int resTypeCnt = requestsM[i2].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i3 >= 0) 
                    {
                        int resTypeId = requestsM[i3].getResourceId();
                        int resTypeCnt = requestsM[i3].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i4 >= 0) 
                    {
                        int resTypeId = requestsM[i4].getResourceId();
                        int resTypeCnt = requestsM[i4].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i5 >= 0) 
                    {
                        int resTypeId = requestsM[i5].getResourceId();
                        int resTypeCnt = requestsM[i5].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    Map<Integer, Integer> stock1Res, stock2Res, stock3Res;
                    
                    Way way = new Way();
                    
                    // check if we can carry all res
                    if (weight > car.getMaxWeight()) 
                        break;
                    
                    // Looking in first stock
                    int stockId1 = car.getStockId();
                    stock1Res = Stock.getOne(stockId1).getAllRecources();
                    Integer[] keys = stock1Res.keySet().toArray(new Integer[stock1Res.keySet().size()]);
                    for (int i = 0; i < keys.length; i++)
                    {
                        int key = keys[i];
                        if (recourcesNeeded.containsKey(key))
                        {
                            int cntN = recourcesNeeded.get(key);
                            int cntE = stock1Res.get(key);
                            if (cntN <= cntE)
                            {
                                recourcesNeeded.put(key, 0);
                                way.deltas.add(new Way.StockDelta(stockId1, key, cntN));
                            }
                            else 
                            {
                                recourcesNeeded.put(key, cntN - cntE);
                                way.deltas.add(new Way.StockDelta(stockId1, key, cntE));
                            }
                        }
                    }  
                    
                    // Looking in second stock
                    int stockId2 = stocksM[i6].getId();
                    stock2Res = Stock.getOne(stockId2).getAllRecources();
                    keys = stock2Res.keySet().toArray(new Integer[stock2Res.keySet().size()]);
                    if (stockId2 != stockId1) for (int i = 0; i < keys.length; i++)
                    {
                        int key = keys[i];
                        if (recourcesNeeded.containsKey(key))
                        {
                            int cntN = recourcesNeeded.get(key);
                            int cntE = stock2Res.get(key);
                            if (cntN <= cntE)
                            {
                                recourcesNeeded.put(key, 0);
                                way.deltas.add(new Way.StockDelta(stockId2, key, cntN));
                            }
                            else 
                            {
                                recourcesNeeded.put(key, cntN - cntE);
                                way.deltas.add(new Way.StockDelta(stockId2, key, cntE));
                            }
                        }
                    } 
                    
                    // Looking in third stock
                    int stockId3 = stocksM[i7].getId();
                    stock3Res = Stock.getOne(stockId3).getAllRecources();
                    keys = stock3Res.keySet().toArray(new Integer[stock3Res.keySet().size()]);
                    if (stockId3 != stockId1 || stockId3 != stockId2) for (int i = 0; i < keys.length; i++)
                    {
                        int key = keys[i];
                        if (recourcesNeeded.containsKey(key))
                        {
                            int cntN = recourcesNeeded.get(key);
                            int cntE = stock3Res.get(key);
                            if (cntN <= cntE)
                            {
                                recourcesNeeded.put(key, 0);
                                way.deltas.add(new Way.StockDelta(stockId3, key, cntN));
                            }
                            else 
                            {
                                recourcesNeeded.put(key, cntN - cntE);
                                way.deltas.add(new Way.StockDelta(stockId3, key, cntE));
                            }
                        }
                    }
                    
                    //check if we found all needed
                    Boolean fl = true;
                    keys = recourcesNeeded.keySet().toArray(new Integer[recourcesNeeded.keySet().size()]);
                    for (int key: keys)
                    {
                        if (recourcesNeeded.get(key) != 0) fl = false;
                    }
                    if (fl)
                    {
                        //Let's ride! Vrum  vrum
                        Double wayDist;
                        ArrayList<Location> cords = new ArrayList<>();
                        ArrayList<Request> reqs = new ArrayList<>();
                        cords.add(Stock.getOne(car.getStockId()).getLocation());
                        if (stockId2 != stockId1) cords.add(stocks.get(stockId2).getLocation());
                        if (stockId3 != stockId1 || stockId3 != stockId2) 
                            cords.add(stocks.get(stockId3).getLocation());
                        if (i1 >= 0) {
                            cords.add(requestsM[i1].getLocation());
                            reqs.add(requestsM[i1]);
                        }
                        if (i2 >= 0) {
                            cords.add(requestsM[i2].getLocation());
                            reqs.add(requestsM[i2]);
                        }
                        if (i3 >= 0) {
                            cords.add(requestsM[i3].getLocation());
                            reqs.add(requestsM[i3]);
                        }
                        if (i4 >= 0) {
                            cords.add(requestsM[i4].getLocation());
                            reqs.add(requestsM[i4]);
                        }
                        if (i5 >= 0) {
                            cords.add(requestsM[i5].getLocation());
                            reqs.add(requestsM[i5]);
                        }
                        cords.add(Stock.getOne(car.getStockId()).getLocation());  
                        
                        double distance = 0;
                        for (int i = 0; i < cords.size() - 1; i++)
                        {
                            distance += distances[cords.get(i).getId()][cords.get(i+1).getId()];
                        }
                        double time = distance/car.getSpeed();
                        
                        way.transportId = car.getId();
                        way.mask = mask;
                        way.cords = cords;
                        way.requests = reqs;
                        way.time = time;
                        ways.add(way);
                    }
                }
            }
        }
        allWays = ways;
        bestTime = 1e20;
        fullMask = (1 << (requests.size()+1)) - 1; 
        getBestWays(new ArrayList<Integer>(), 0, -1, 0);
        
        return bestWays;
    }
    
    private static ArrayList<Way> allWays;
    private static ArrayList<Way> bestWays;
    private static double bestTime;
    private static int fullMask;
    static private void getBestWays(ArrayList<Integer> maskM, int mask, int lastI, double curTime)
    {
        // Some recursive magic
        for (int i = lastI + 1; i < allWays.size(); i++)
        {
            Way way = allWays.get(i);
            maskM.add(i);
            if ( (mask & way.mask) == 0)
            {
                mask = mask | way.mask;
                curTime = Math.max(curTime, way.time);
                if (mask == fullMask)
                {
                    if (bestTime > curTime)
                    {
                        bestWays = new ArrayList<>();
                        for( int j : maskM)
                        {
                            bestWays.add(allWays.get(j));
                        }
                    }
                }
                else
                {
                    getBestWays(maskM, mask, i, curTime);
                }
            }
            maskM.remove(maskM.size()-1);
        }
    }
}
