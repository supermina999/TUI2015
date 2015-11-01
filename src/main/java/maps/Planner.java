package maps;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import models.DBEntry;
import models.EntryType;
import java.util.Date;
import models.Location;
import models.Request;
import models.Resource;
import models.Safety;
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
    
    public static Map<Integer, ArrayList<Way> > plan;
    public static Map<Integer, Integer> status = new HashMap<>();
    public static Date date;
    public static Date lDate;
    
    public static void accepted(int safetyId)
    {
        lDate = date;
        status.put(safetyId, 4);
    }
    
    public static void createPlan(Date date) throws Exception
    {
        if (lDate != null && date.before(lDate)) return;
        Planner.date = date;
        plan = new HashMap<>();
        Safety[] safetys = Safety.getAll(null);
        for (Safety safety : safetys) {
            status.put(safety.getId(), 1);
        }
        for( Safety safety : safetys)
        {
            status.put(safety.getId(), 2);
            plan.put(safety.getId(), getPlan(date, safety.getId()));
            status.put(safety.getId(), 3);
        }
    }
    
    static ArrayList<Way> getPlan(Date date, int safetyId) throws Exception
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
            new DBEntry("date", EntryType.Date, date),
            new DBEntry("status", EntryType.Int, 0)
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
        
        Path[][] distances = new Path[m+1][m+1];
        int i11 = 0;
        int j1 = 0;
        for (Location loc1 : allLocs)
            for (Location loc2 : allLocs)
            {
                
                if (loc1.onMapId == -1) {
                    loc1.onMapId = maps.Map.getNodeByCoord(loc1.getYCoord(), loc1.getXCoord());
                }
                if (loc2.onMapId == -1) {
                    loc2.onMapId = maps.Map.getNodeByCoord(loc2.getYCoord(), loc2.getXCoord());
                }
                if (loc1.getRegionId() == loc2.getRegionId())
                {
                    distances[loc1.getId()][loc2.getId()] = 
                            maps.Map.getDistance(loc1.onMapId, loc2.onMapId, safetyId);
                  
                }
                else distances[loc1.getId()][loc2.getId()] = null;
            }
        
        
        int n = requestsM.length;
        // Generating bitmasks
        for(Transport car : cars)
        {
            for (int i1 = -1; i1 < n; i1++)
            for (int i2 = -1; i2 < n; i2++)
            if (i1 != i2 || i2 == -1)
            for (int i3 = -1; i3 < n; i3++)
            if (i1 != i3  && i2 != i3 || i3 == -1)
            for (int i4 = -1; i4 < n; i4++)
            if (i1 != i4 && i2 != i4 && i3 != i4 || i4 == -1)   
            for (int i5 = -1; i5 < n; i5++)
            if (i1 != i5 && i2 != i5  && i3 != i5 && i4 != i5 || i5 == -1)
            for (int i6 = 0; i6 < stocksM.length; i6++)
            for (int i7 = 0; i7 < stocksM.length; i7++)
            {
                if (i6!=i7) continue;
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
                    Map<Integer, Integer> recourcesNew = new HashMap<>();
                    if (i1 >= 0) 
                    {
                        int resTypeId = requestsM[i1].getResourceId();
                        int resTypeCnt = requestsM[i1].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        if (requestsM[i1].getRequestTypeId()==0)recourcesNeeded.put(resTypeId, resTypeCnt);
                        else recourcesNew.put(resTypeId, resTypeCnt);
                        weight += Resource.getOne(resTypeId).getWeight()*resTypeCnt;
                    }
                    if (i2 >= 0) 
                    {
                        int resTypeId = requestsM[i2].getResourceId();
                        int resTypeCnt = requestsM[i2].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        if (requestsM[i2].getRequestTypeId() == 0) {
                            recourcesNeeded.put(resTypeId, resTypeCnt);
                        } else {
                            recourcesNew.put(resTypeId, resTypeCnt);
                        }
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i3 >= 0) 
                    {
                        int resTypeId = requestsM[i3].getResourceId();
                        int resTypeCnt = requestsM[i3].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        if (requestsM[i3].getRequestTypeId() == 0) {
                            recourcesNeeded.put(resTypeId, resTypeCnt);
                        } else {
                            recourcesNew.put(resTypeId, resTypeCnt);
                        }
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i4 >= 0) 
                    {
                        int resTypeId = requestsM[i4].getResourceId();
                        int resTypeCnt = requestsM[i4].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        if (requestsM[i4].getRequestTypeId() == 0) {
                            recourcesNeeded.put(resTypeId, resTypeCnt);
                        } else {
                            recourcesNew.put(resTypeId, resTypeCnt);
                        }
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    if (i5 >= 0) 
                    {
                        int resTypeId = requestsM[i5].getResourceId();
                        int resTypeCnt = requestsM[i5].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        if (requestsM[i5].getRequestTypeId() == 0) {
                            recourcesNeeded.put(resTypeId, resTypeCnt);
                        } else {
                            recourcesNew.put(resTypeId, resTypeCnt);
                        }
                        weight += Resource.getOne(resTypeId).getWeight() * resTypeCnt;
                    }
                    Map<Integer, Integer> stock1Res, stock2Res, stock3Res;
                    
                    Way way = new Way();
                    
                    // check if we can carry all res
                    if (weight > car.getMaxWeight()*1000) 
                        continue;
                    
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
                    
                    //Adding new resources
                    keys = recourcesNew.keySet().toArray(new Integer[recourcesNew.keySet().size()]);
                    for (int key : keys)
                    {
                        way.deltas.add(new Way.StockDelta(stockId1, key, -recourcesNew.get(key)));
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
                        ArrayList<Location> cords = new ArrayList<>();
                        ArrayList<Request> reqs = new ArrayList<>();
                        cords.add(Stock.getOne(car.getStockId()).getLocation());
                        way.stocks.add(stocks.get(stockId1));
                        if (stockId2 != stockId1) 
                        {
                            cords.add(stocks.get(stockId2).getLocation());
                            way.stocks.add(stocks.get(stockId2));
                        }
                        if (stockId3 != stockId1 || stockId3 != stockId2) 
                        {
                            cords.add(stocks.get(stockId3).getLocation());
                            way.stocks.add(stocks.get(stockId3));
                        }
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
                        boolean badWay = false;
                        for (int i = 0; i < cords.size() - 1; i++)
                        {
                            if (distances[cords.get(i).getId()][cords.get(i + 1).getId()] == null) 
                            { 
                                badWay = true;
                                break;
                            }
                            distance += distances[cords.get(i).getId()][cords.get(i+1).getId()].dist;
                            way.path.add(distances[cords.get(i).getId()][cords.get(i+1).getId()]);
                        }
                        if (badWay) 
                            continue;
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
        fullMask = (1 << (requests.size())) - 1; 
        getBestWays(new ArrayList<Integer>(), 0, -1, 0);
        
        return bestWays;
    }
    
    private static ArrayList<Way> allWays;
    private static ArrayList<Way> bestWays;
    private static double bestTime;
    private static int fullMask;
    
    // Warning! Wrong time when using one car two or more times
    static private void getBestWays(ArrayList<Integer> maskM, int mask, int lastI, double curTime)
    {
        // Some recursive magic
        for (int i = lastI + 1; i < allWays.size(); i++)
        {
            Way way = allWays.get(i);
            maskM.add(i);
            if ( (mask & way.mask) == 0)
            {
                int Nmask = mask | way.mask;
                double NcurTime = Math.max(curTime, way.time);
                if (Nmask == fullMask)
                {
                    if (bestTime > NcurTime)
                    {
                        bestTime = NcurTime;
                        bestWays = new ArrayList<>();
                        for( int j : maskM)
                        {
                            bestWays.add(allWays.get(j));
                        }
                    }
                }
                else
                {
                    getBestWays(maskM, Nmask, i, NcurTime);
                }
            }
            maskM.remove(maskM.size()-1);
        }
    }
}
