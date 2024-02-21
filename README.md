# Algorithmic Methods of Data Mining (Sc.M. in Data Science). Homewok 5

The repository contains the submission of the fifth homework for the course "Algorithmic Methods of Data Mining", for the Group #23.

The main goal of this project is to dig deep into graphs using analysis techniques. We want to unravel interesting characteristics in the graph structures, find patterns, see how things relate to each other, and pull out useful insights. The objective is to analyze and extract valuable insights from a dataset containing information about academic papers and their citation relationships. Two graphs are constructed to model these relationships: a citation graph, representing unweighted and directed paper citations, and a collaboration graph, representing weighted and undirected collaborations among authors. Due to the dataset's size, the analysis focuses on the most connected component of the graphs, specifically the top 10,000 papers with the highest number of citations. The project is divided into Backend and Frontend components, each with specific functionalities designed to examine graph features, identify influential papers/authors, find the shortest ordered walk in the collaboration graph, disconnect graphs, and extract communities.

Additionally, the following questions have been answered in the CommandLine.sh file:

Is there any node that acts as an important "connector" between the different parts of the graph?
How does the degree of citation vary among the graph nodes?
What is the average length of the shortest path among nodes?
Finally, regarding the algorithm question, we determined the maximum global score that can be achieved with the available athletes.

## Team members
* Milad Torabi</p>
    > Github: @miladtorabi65
* Riccardo Corrente</p>
    > Github: RiccardoCorr
* Nadir Nuralin</p>
    > Github: nadir2k
* Paolo Meli
## Contents
The repository has the following files and folders:

* __`main.ipynb`__
    > The Jupyter notebook with the solutions to all the questions, containing the graph analysis and both backend and frontend implementations. The cells are already executed.
* __`Other`__
    > A folder containing:</p>
    >      `CommandLine.sh` The command line scripts used to answer the CLQ questions.</p>
    >     `citation_graph.graphml` the saved format of the citation graph.</p>
    >     `sorted_sliced_10,000_data` the slice of the top 10,000 papers with the highest citations.
