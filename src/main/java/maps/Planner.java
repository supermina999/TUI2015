/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package maps;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import jdk.management.resource.ResourceType;
import models.DBEntry;
import models.EntryType;
import static models.EntryType.Date;
import models.Request;
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
        
        int[][] distances = null;
        
        int n = requestsM.length;
        // Generating bitmasks
        for(Transport car : cars)
        {
            for (int i1 = -1; i1 < n; i1++)
            for (int i2 = -1; i2 < n; i2++)
            for (int i3 = -1; i3 < n; i3++)
            for (int i4 = -1; i4 < n; i4++)
            for (int i5 = -1; i5 < n; i5++)
            for (int i6 = 0; i6 < stocksM.length; i6++)
            for (int i7 = 0; i7 < stocksM.length; i7++)
            {
                int mask = 0;
                if (i1 > 0) mask = setNBit(mask, i1);
                if (i2 > 0) mask = setNBit(mask, i2);
                if (i3 > 0) mask = setNBit(mask, i3);
                if (i4 > 0) mask = setNBit(mask, i4);
                if (i5 > 0) mask = setNBit(mask, i5);
                if (mask != 0)
                {
                    int k1 = Stock.getOne(car.getStockId()).getLocationId();
                    int k2 = stocksM[i6].getLocationId();
                    int k3 = stocksM[i7].getLocationId();
                    
                    //Generating needed resource list
                    Map<Integer, Integer> recourcesNeeded = new HashMap<>();
                    if (i1 > 0) 
                    {
                        int resTypeId = requestsM[i1].getResourceId();
                        int resTypeCnt = requestsM[i1].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                    }
                    if (i2 > 0) 
                    {
                        int resTypeId = requestsM[i2].getResourceId();
                        int resTypeCnt = requestsM[i2].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                    }
                    if (i3 > 0) 
                    {
                        int resTypeId = requestsM[i3].getResourceId();
                        int resTypeCnt = requestsM[i3].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                    }
                    if (i4 > 0) 
                    {
                        int resTypeId = requestsM[i4].getResourceId();
                        int resTypeCnt = requestsM[i4].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                    }
                    if (i5 > 0) 
                    {
                        int resTypeId = requestsM[i5].getResourceId();
                        int resTypeCnt = requestsM[i5].getNumber();
                        Integer resTypeCntPr = recourcesNeeded.get(resTypeId);
                        if (resTypeCntPr != null) resTypeCnt += resTypeCntPr;
                        recourcesNeeded.put(resTypeId, resTypeCnt);
                    }
                    Map<Integer, Integer> stock1Res, stock2Res, stock3Res;
                    
                    Way way = new Way();
                    
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
                    
                    
                }
            }
        }        
        return null;
    }
}
