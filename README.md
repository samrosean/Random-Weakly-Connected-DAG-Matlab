# Generating Random Weakly-Connected Directed Acyclic Graphs in Matlab
Contact: Samuel Rosean - samrosean@einsteinmed.edu

----
## randomDAG.m 

Create a random weakly-connected Directed Acyclic Graph (DAG) on n nodes and m edges. Much like how an Erdos-Renyi graph can be created in a G(n, m) form, where n represents the number of nodes and m the number of edges, this algorithm assembles a simple weakly-connected DAG in much the same way.

This algorithm takes advantage of two properties of DAGs and of weakly-connected graphs respectively.

1. DAGs have a topological ordering. Since DAGs can be topologically sorted so that no node i has a path to a node j where i > j, then only the upper triangle
of an adjacency matrix will have non-zero values.

2. Weakly Connected Graphs have a minimal spanning tree.

--- ---

The algorithm consists of 3 steps. 

1. Create a random spanning tree of a complete graph of n vertices using a random walk.

2. Direct the random tree so that each edge only connects from an i to a j such i < j.

3. Randomly add edges to the upper triangle until the total number of edges is equal to m.

----
## randomDAGInOut.m 

Create a random weakly-connected Directed Acyclic Graph (DAG) on n nodes with m edges with the additional constraint of x start-nodes and y exit-nodes.

Start-nodes are nodes with no in-edges, and exit nodes are nodes with no out-edges, this also gaurantees that all nodes which are not start or exit nodes will have both in and out edges.

This algorithm starts by creating a complete DAG on n nodes, that is, the upper triangle of the adjacency matrix. Next it removes all in edges from the first x nodes, and all out edges of the last y nodes.

Next the algorithm starts to randomly removes edges from that semi-complete DAG until it arrives at configuration with the correct number of edges, while ensuring at each step that it does not disconnect the graph or change the number of start-nodes or exit-nodes.

Because it is a destructive process which is randomly removing edges it can sometimes trap itself in topologies that cannot be reduced to the desired number of edges, so it
also randomly adds edges if there are 2 generations in a row where an edge cannot be removed. This still does not gaurantee a solution, as it may still get caught in specific valleys in topology space. This algorithm is also incredibly costly as it has to check wether each edge is a bridge-edge over every single iteration, as well as delete, possibly, almost every edge from a complete DAG. For a DAG of 300 nodes that can be 89,700 edges.

If you can think of a better way of doing this, especially as a constructive algorithm, please let me know. 
