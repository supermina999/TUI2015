package maps;

import java.util.*;

public class Path {
    public ArrayList<Node> nodes;
    public double dist;
    Path(ArrayList<Node> nodes, double dist)
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
    }
}
