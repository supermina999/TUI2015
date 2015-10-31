package maps;

import java.util.*;

public class Path {
    public ArrayList<Node> nodes;
    public ArrayList<Integer> edgeNumbers;
    public double dist;
    Path(ArrayList<Node> nodes, ArrayList<Integer> edgeNumbers, double dist)
    {
        this.nodes = nodes;
        this.dist = dist;
    }

    Path() {
        nodes = new ArrayList<>();
        dist = 0;
    }
    
    void add(Path path)
    {
        dist += path.dist;
        for (int i = 1; i < path.nodes.size(); i++)
        {
            nodes.add(path.nodes.get(i));
        }
        for (int edgeNumber : path.edgeNumbers)
        {
            edgeNumbers.add(edgeNumber);
        }
    }
}
