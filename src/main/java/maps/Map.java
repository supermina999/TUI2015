package maps;

import java.io.File;
import java.io.PrintStream;
import java.io.PrintWriter;
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
    static final String filePath = "/home/xlv/map.txt"; //  /Users/roma/Documents/map.txt
    static final double inf = 1e18;
    static final double earthRadius = 6372.795;
    
    public static void load() throws Exception
    {
        Scanner sc = new Scanner(new File(filePath)).useLocale(Locale.US);
        int n = sc.nextInt();
        for(int i = 0; i < n; i++) {
            double x = sc.nextDouble(), y = sc.nextDouble();
            nodes.add(new Node(x, y, i));
        }
        for(int i = 0; i < n; i++) {
            int m = sc.nextInt();
            ArrayList<Edge> curList = new ArrayList<>();
            for(int j = 0; j < m; j++) {
                int number = sc.nextInt();
                int safety = sc.nextInt();
                curList.add(new Edge(number, safety));
            }
            graph.add(curList);
        }
    }

    public static void save() throws Exception
    {
        if(nodes.isEmpty()) return;
        PrintStream writer = new PrintStream(filePath);
        writer.println(nodes.size());
        for(Node node : nodes)
        {
            writer.print(node.x);
            writer.print(" ");
            writer.println(node.y);
        }
        for(ArrayList<Edge> curEdges : graph)
        {
            writer.print(curEdges.size());
            for(Edge edge : curEdges)
            {
                writer.print(" ");
                writer.print(edge.node);
                writer.print(" ");
                writer.print(edge.safety);
            }
            writer.println();
        }
        writer.close();
    }
    
    static double dist(double x1, double y1, double x2, double y2)
    {
        double lat1 = x1 / 180 * Math.PI;
        double lat2 = x2 / 180 * Math.PI;
        double long1 = y1 / 180 * Math.PI;
        double long2 = y2 / 180 * Math.PI;
        
        double cl1 = Math.cos(lat1);
        double cl2 = Math.cos(lat2);
        double sl1 = Math.sin(lat1);
        double sl2 = Math.sin(lat2);
        double delta = long2 - long1;
        double cdelta = Math.cos(delta);
        double sdelta = Math.sin(delta);
        
        double y = Math.sqrt(Math.pow(cl2 * sdelta, 2) + Math.pow(cl1 * sl2 - sl1 * cl2 * cdelta, 2));
        double x = sl1 * sl2 + cl1 * cl2 * cdelta;
        
        double ad = Math.atan2(y, x);
        
        return ad * earthRadius;
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
    
    public static Path getDistance(int node1, int node2, int safety) throws Exception
    {
        if(node1 == node2) return new Path();
        if(nodes.isEmpty()) load();

        TreeSet<Position> positions = new TreeSet<>();
        TreeMap<Integer, Double> curDist = new TreeMap<>();
        TreeMap<Integer, Double> curF = new TreeMap<>();
        TreeSet<Integer> used = new TreeSet<>();
        TreeMap<Integer, Integer> previous = new TreeMap<>();
        TreeMap<Integer, Integer> previousEdge = new TreeMap<>();

        curF.put(node1, dist(node1, node2));
        curDist.put(node1, 0.0);
        positions.add(new Position(node1, dist(node1, node2)));
        while(!positions.isEmpty())
        {
            Position pos = positions.first();
            int node = pos.node;
            double tDist = curDist.get(node);
            positions.remove(pos);
            used.add(node);
            if(node == node2)
            {
                break;
            }
            for(int edgeNumber = 0; edgeNumber < graph.get(node).size(); edgeNumber++)
            {
                Edge edge = graph.get(node).get(edgeNumber);
                if (edge.safety > safety) continue;
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
                    previous.put(nxtNode, node);
                    previousEdge.put(nxtNode, edgeNumber);
                }
            }
        }

        if(previous.get(node2) == null) return null;

        ArrayList<Integer> pathNodes = new ArrayList<>();
        ArrayList<Integer> pathEdges = new ArrayList<>();
        int curNode = node2;
        while(curNode != node1) {
            pathNodes.add(curNode);
            pathEdges.add(previousEdge.get(curNode));
            curNode = previous.get(curNode);
        }
        pathNodes.add(node1);
        Path path = new Path();
        for(int i = pathNodes.size() - 1; i >= 0; i--)
        {
            path.nodes.add(nodes.get(pathNodes.get(i)));
        }
        for(int i = pathEdges.size() - 1; i >= 0; i--)
        {
            path.edgeNumbers.add(pathEdges.get(i));
        }
        path.dist = curDist.get(node2);
        return path;
    }

    public static void setSafetyOnPath(Path path, int safety)
    {
        for(int i = 0; i < path.nodes.size() - 1; i++)
        {
            graph.get(path.nodes.get(i).number).get(path.edgeNumbers.get(i)).safety = safety;
        }
    }
}
