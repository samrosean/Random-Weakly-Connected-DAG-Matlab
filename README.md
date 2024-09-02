# Generating Random Weakly-Connected Directed Acyclic Graphs
Contact: Samuel Rosean - samrosean@einsteinmed.edu

----
Create a random weakly-connected Directed Acyclic Graph (DAG) on n nodes and m edges. Much like how an Erdos-Renyi graph can be created in a G(n, m) form, where n represents the number of nodes and m the number of edges, this algorithm assembles a simple weakly-connected DAG in much the same way.

This algorithm takes advantage of two properties of DAGs and of weakly-connected graphs respectively.

1. DAGs have a topological ordering. Since DAGs can be topologically sorted so that no node i has a path to a node j where i > j, then only the upper triangle
of an adjacency matrix will have non-zero values.

2. Weakly Connected Graphs have a minimal spanning tree.

--- ---

The algorithm consists of 3 steps. 

1. Create a random spanning tree of a complete graph of n vertices using a random walk.

2. Direct the random tree so that each edge only connects from an i to a j such i < j.

3. Randomly add edges to the upper triangle randomly until the total number of edges is equal to m.
