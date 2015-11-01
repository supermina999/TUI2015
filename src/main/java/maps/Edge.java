package maps;

public class Edge
{
    public int node, safety = 0;
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