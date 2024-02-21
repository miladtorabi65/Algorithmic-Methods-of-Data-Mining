#!/bin/bash

# Set the path to the citation graph file
GRAPH_PATH="C:/Users/LENOVO/Desktop/UNI/02-ADM/homework5/clq/citation_graph.graphml"

echo "###################CLQ question 1 #############################"
# Use Python to read the citation graph and calculate node degrees
NODES_DEGREES=$(python - <<END
import networkx as nx

# Read the citation graph
graph_path=r'C:\Users\LENOVO\Desktop\UNI\02-ADM\homework5\clq\citation_graph.graphml'
G_citation= nx.read_graphml(graph_path)

# Initialize a dictionary to store node degrees
nodes_degree_dic = {}

# Identify edges and calculate node degrees
for node in G_citation.nodes():
    nodes_degree_dic[node] = G_citation.degree(node)

# Convert dictionary items to a list
node_degree_list = [f"{node} {degree}" for node, degree in nodes_degree_dic.items()]

# Print the result
print('\n'.join(node_degree_list))
END
)

# Use grep and sed to extract edges from the Python output
EDGES=$(echo "$NODES_DEGREES" | grep -E '^[0-9]+' | sed 's/\s\+/ /g')

# Use awk to sort the degrees in descending order
SORTED_DEGREES=$(echo "$EDGES" | sort -k2,2nr)

# Use awk to print the top 5 nodes and their degrees
TOP_5_NODES=$(echo "$SORTED_DEGREES" | awk 'NR <= 5')

# Print the result
echo "$TOP_5_NODES" | while read -r node degree; do
  echo "Node ID: $node  >>  Degree: $degree"
done

echo "###################CLQ question 2 #############################"

# Process the output using grep, awk, or sed
sum_of_edges=$(echo "$NODES_DEGREES" | awk '{sum += $2} END {print sum/2}')

# Count lines to get the number of nodes
sum_of_nodes=$(echo "$NODES_DEGREES" | wc -l)

# Calculate the average degree for each node with floating-point precision using awk
avg_degree_info=$(awk -v sum_of_edges="$sum_of_edges" -v sum_of_nodes="$sum_of_nodes" 'BEGIN {printf "%.4f", sum_of_edges / sum_of_nodes}')

# Display the results
echo "Sum of edges: $sum_of_edges"
echo "Sum of nodes: $sum_of_nodes"
echo "Average degree for each node: $avg_degree_info"

echo "###################CLQ question 3 #############################"
python -c '

import networkx as nx

# Read the citation graph
graph_path = r"C:\\Users\\LENOVO\\Desktop\\UNI\\02-ADM\\homework5\\clq\\citation_graph.graphml"
G_citation= nx.read_graphml(graph_path)

# Calculate degree centrality for each node
degree_centrality = nx.degree_centrality(G_citation)

# Find the node with the highest degree centrality
most_connected_node = max(degree_centrality, key=degree_centrality.get)

# Extract the subgraph centered around the most connected node
subgraph = nx.ego_graph(G_citation, most_connected_node)

# Print information about the most connected subgraph
print("Most Connected Node:", most_connected_node)
print("Degree Centrality:", degree_centrality[most_connected_node])
print("Number of Nodes in Subgraph:", subgraph.number_of_nodes())
print("Number of Edges in Subgraph:", subgraph.number_of_edges())


# Calculate the shortest path lengths between all pairs of nodes in the subgraph
shortest_path_lengths = []

for source in subgraph.nodes():
    for target in subgraph.nodes():
        if source != target:
            try:
                length = nx.shortest_path_length(subgraph, source=source, target=target)
                shortest_path_lengths.append(length)
            except nx.NetworkXNoPath:
                pass  # Skip pairs with no path
            

# Sum up all the path lengths
sum_of_path_lengths = sum(shortest_path_lengths)

# Calculate the average length of the shortest path
num_pairs_with_path = len(shortest_path_lengths)
average_shortest_path_length = sum_of_path_lengths / num_pairs_with_path if num_pairs_with_path > 0 else 0

print("Average Length of the Shortest Path Among Nodes:", average_shortest_path_length)
'