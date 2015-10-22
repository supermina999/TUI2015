package maps;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;

class Edge
{
    int node, safety = 0;
    Edge(int node, int safety) 
    {
        this.node = node;
        this.safety = safety;
    }
    Edge(int node)
    {
        this.node = node;
    }
}

class Node
{
    double x, y;
    Node(double x, double y)
    {
        this.x = x;
        this.y = y;
    }
}

class Position implements Comparable<Position>
{
    int node;
    double dist;
    Position(int node, double dist)
    {
        this.node = node;
        this.dist = dist;
    }

    @Override
    public int compareTo(Position o)
    {
        if(dist != o.dist) return ((Double)dist).compareTo(o.dist);
        return ((Integer)node).compareTo(o.node);
    }
}

public class Map
{
    static ArrayList<Node> nodes = new ArrayList<>();
    static ArrayList<ArrayList<Edge>> graph = new ArrayList<>();
    static String filePath = "/home/xlv/map.txt";
    static double inf = 1e18;
    
    public static void load() throws Exception
    {
        Scanner sc = new Scanner(new File(filePath));
        int n = sc.nextInt();
        for(int i = 0; i < n; i++) {
            double x = sc.nextDouble(), y = sc.nextDouble();
            nodes.add(new Node(x, y));
        }
        for(int i = 0; i < n; i++) {
            int m = sc.nextInt();
            ArrayList<Edge> curList = new ArrayList<>();
            for(int j = 0; j < m; j++) {
                int number = sc.nextInt();
                curList.add(new Edge(number));
            }
            graph.add(curList);
        }
    }
    
    static double dist(double x1, double y1, double x2, double y2)
    {
        return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
    }
    
    public static int getNodeByCoord(double x, double y) throws Exception
    {
        if(nodes.isEmpty()) load();
        double ansDist = dist(nodes.get(0).x, nodes.get(0).y, x, y);
        int ansNumber = 0;
        for(int i = 0; i < nodes.size(); i++)
        {
            double curDist = dist(nodes.get(i).x, nodes.get(i).y, x, y);
            if(curDist < ansDist)
            {
                ansDist = curDist;
                ansNumber = i;
            }
        }
        return ansNumber;
    }
    
    static double dist(int node1, int node2)
    {
        return dist(nodes.get(node1).x, nodes.get(node1).y, nodes.get(node2).x, nodes.get(node2).y);
    }
    
    public static double getDistance(int node1, int node2, int safety) throws Exception
    {
        if(node1 == node2) return 0;
        if(nodes.isEmpty()) load();
        TreeSet<Position> positions = new TreeSet<>();
        TreeMap<Integer, Double> curDist = new TreeMap<>();
        TreeMap<Integer, Double> curF = new TreeMap<>();
        TreeSet<Integer> used = new TreeSet<>();
        curF.put(node1, dist(node1, node2));
        curDist.put(node1, 0.0);
        positions.add(new Position(node1, dist(node1, node2)));
        while(!positions.isEmpty())
        {
            Position pos = positions.first();
            int node = pos.node;
            double tF = pos.dist;
            double tDist = curDist.get(node);
            positions.remove(pos);
            used.add(node);
            if(node == node2)
            {
                break;
            }
            for(Edge edge : graph.get(node))
            {
                int nxtNode = edge.node;
                if(used.contains(nxtNode)) continue;
                Double nxtDist = curDist.get(nxtNode);
                Double nxtF = curF.get(nxtNode);
                if(nxtDist == null)
                    nxtDist = inf;
                if(nxtF == null)
                    nxtF = inf;
                if(nxtF > tDist + dist(node, nxtNode) + dist(nxtNode, node2))
                {
                    if(nxtF != inf)
                    {
                        Position nxtPos = new Position(nxtNode, nxtF);
                        positions.remove(nxtPos);
                    }
                    nxtF = tDist + dist(node, nxtNode) + dist(nxtNode, node2);
                    nxtDist = tDist + dist(node, nxtNode);
                    Position nxtPos = new Position(nxtNode, nxtF);
                    positions.add(nxtPos);
                    curDist.put(nxtNode, nxtDist);
                    curF.put(nxtNode, nxtF);
                }
            }
        }
        return curDist.get(node2);
    }
}
