package map;

import java.util.*;
import java.io.*;

class Point {

    double x, y;

    Point() {
    }

    Point(double x, double y) {
        this.x = x;
        this.y = y;
    }
}

class Mark implements Comparable<Mark> {

    int id;
    double f;

    Mark() {
    }

    Mark(int id, double f) {
        this.id = id;
        this.f = f;
    }

    @Override
    public int compareTo(Mark o) {
        if (id == o.id) return 0;
        if (f <= o.f) return -1;
        return 1;
    }

}

public class Algo {

    int n;
    int start = 0, finish = 22;

    ArrayList<Point> nodes = new ArrayList<>();
    HashMap<Point, Integer> index = new HashMap<>();
    
    ArrayList<ArrayList<Integer>> graph = new ArrayList<>();
    TreeSet<Mark> markSet = new TreeSet<>();
    ArrayList<Integer> used = new ArrayList<>();
    ArrayList<Integer> parent = new ArrayList<>();
    ArrayList<Double> dist = new ArrayList<>();

    double getDistance(Point a, Point b) {
        return Math.sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
    }
   
    void init() throws FileNotFoundException {
        Scanner lines = new Scanner(new File("in1.txt"));
        FileOutputStream fos = new FileOutputStream("out.txt");
        PrintStream printStream = new PrintStream(fos);
        n = lines.nextInt();
        for (int i = 0; i < n; i++) {
            double x = Double.parseDouble(lines.next());
            double y = Double.parseDouble(lines.next());
            nodes.add(new Point(x, y));
            index.put(new Point(x, y), i);
            used.add(-1);
            parent.add(i);
            dist.add(0.0);
        }
        for (int i = 0; i < n; i++) {
            int m = lines.nextInt();
            graph.add(new ArrayList<Integer>());
            for (int j = 0; j < m; j++) {
                int v = lines.nextInt();
                graph.get(i).add(v);
            }
        }
    }

    public static void main(String[] args) throws FileNotFoundException {
        new Algo();
    }

    Algo() throws FileNotFoundException {
        init();
        used.set(start, 1);
        parent.set(start,start);
        for (int i = 0; i < graph.get(start).size(); i++) {
            int v = graph.get(start).get(i);
            used.set(v, 0);
            parent.set(v, start);
            dist.set(v, getDistance(nodes.get(start),nodes.get(v)));
            markSet.add(new Mark(v, dist.get(v) + getDistance(nodes.get(v), nodes.get(finish))));
            
        }
        while (!markSet.isEmpty()) {
            Mark mark = markSet.pollFirst();
            used.set(mark.id, 1);
            if (mark.id == finish) break;
            for (int i = 0; i < graph.get(mark.id).size(); i++) {
                int v = graph.get(mark.id).get(i);
                if (used.get(v) == -1) {
                    used.set(v,0);
                    parent.set(v, mark.id);
                    dist.set(v, dist.get(mark.id) + getDistance(nodes.get(mark.id), nodes.get(v)));
                    markSet.add(new Mark(v, dist.get(v) + getDistance(nodes.get(v), nodes.get(finish))));
                } else if (used.get(v) == 0) {
                    if (dist.get(mark.id) + getDistance(nodes.get(mark.id), nodes.get(v)) < dist.get(v)) {
                        markSet.remove(new Mark(v, dist.get(v) + getDistance(nodes.get(v), nodes.get(finish))));
                        parent.set(v, mark.id);
                        dist.set(v, dist.get(mark.id) + getDistance(nodes.get(mark.id), nodes.get(v)));
                        markSet.add(new Mark(v, dist.get(v) + getDistance(nodes.get(v), nodes.get(finish))));
                    }
                }
            }
        }
        System.out.println(dist.get(finish));
        int t = finish;
        while (t != start) {
            System.out.print(t);
            System.out.print(" ");
            t = parent.get(t);
        }
        System.out.print(start);
    }

}