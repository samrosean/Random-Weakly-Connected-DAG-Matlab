%{ 

Create a random weakly-connected Directed Acyclic Graph (DAG) on n nodes with m edges. 

Much like how an Erdos-Renyi graph can be created in a G(n, m) form, where n represents the number of 
nodes and m the number of edges, this algorithm assembles a simple weakly-connected DAG in much the same way.

This algorithm takes advantage of two properties of DAGs and of weakly-connected graphs respectively.

1 - DAGs have a topological ordering. Since DAGs can be topologically sorted so that no node i has a 
path to a node j where i > j, then only the upper triangle of an adjacency matrix will have non-zero values.

2 - Weakly-Connected Graphs have a minimal spanning tree.

%}


function dag = randomDAG(nodes, connections)

    if connections > ((nodes*(nodes-1))/2)
        fprintf("Too many connections to create a DAG \n")
        dag = NaN;
        return
    elseif connections < nodes - 1
        fprintf("Not enough connections to make a weakly-connected graph on the given number of vertices. \n")
        dag = NaN;
        return
    elseif nodes < 2
        fprintf("At least two nodes are required to make a graph. \n")
        dag = NaN;
        return
    else
        unReached = 2:nodes;
        minimalEdges = [ones(nodes,2)];
        currentLocation = 1;
        while ~isempty(unReached)
            newLocation = randi(nodes,1);
            if ismember(newLocation, unReached)
                minimalEdges(newLocation, :) = [currentLocation, newLocation];
                unReached = unReached(unReached~=newLocation);
            end
            currentLocation = newLocation;
        
        
        end
        
        matrix = zeros(nodes, nodes);
        for i = 2:size(minimalEdges,1)
            if minimalEdges(i,1) > minimalEdges(i,2)
                matrix(minimalEdges(i,2),minimalEdges(i,1)) = 1;
            else
                matrix(minimalEdges(i,1),minimalEdges(i,2)) = 1;
            end
        end
        
        i = 0;
        while i <= connections - nodes
            index = randi(nodes-1,1);
            index2 = randi([index+1,nodes],1);
            if matrix(index,index2) == 0
                matrix(index,index2) = 1;
                i = i + 1;
            end
        end
        dag = matrix;

        return
    end

       
end