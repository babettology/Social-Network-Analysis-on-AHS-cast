# R script 

library(readr)
library(igraph)
library(blockmodeling)
library(GGally)
library(dplyr)
library(tidyr)
library(ggraph)
library(tidygraph)
library(readr)

co_starring_df <- read_csv("")
View(co_starring_df)

graph <- graph_from_data_frame(co_starring_df, directed = FALSE)
graph <- simplify(graph, remove.loops = TRUE, remove.multiple = TRUE)

# Plot AHS Network 
set.seed(1)
# Plot the network with ggraph
ggraph(tbl_graph, layout = 'fr') +
  geom_edge_fan(aes(alpha = after_stat(index)),color = "steelblue", show.legend = F) +
  geom_node_point(aes(size = Popularity), color = "orange") +
  geom_node_text(aes(label = name),  repel = F,
                 box.padding = 0.1, point.padding = 0.5, max.overlaps = 200) +
  theme_graph(foreground = 'steelblue', fg_text_colour = 'white') +
  labs(title = "AHS Co-Starring Network")

# average degree 
degree(graph)
2 * ecount(graph) / vcount(graph)

# Centrality measures
centrality_data <- data.frame(
  Degree = degree(graph),
  Closeness = closeness(graph, normalized = F), # nomalised closeness values
  Eigenvector = eigen_centrality(graph)$vector)

# Correlations between measures 
ggpairs(centrality_data)

# centralisation with the freeman formaula 
centr_degree(graph)$centralization

# B) 

# graph into adjacency matrix
adj <- as.matrix(as_adjacency_matrix(graph))

# Find all cliques of size 5 or larger
cliques <- cliques(graph, min = 5)


# Plot network with largest clique highlighted
# Create a vector for coloring nodes
V(graph)$in_largest_clique <- ifelse(V(graph) %in% unlist(largest_cliques), "red", "lightblue")

# Create a plot layout
set.seed(123)  # for reproducibility
layout <- layout_with_fr(graph)

# Plot with largest clique highlighted

plot(graph, 
     vertex.color = V(graph)$in_largest_clique,
     vertex.label.cex = 0.6,
     vertex.size = 8,
     layout = layout,
     main = "Largest Cliques Highlighted")

# K-Cores 
# graph with vertices colored by coreness
plot(graph, vertex.size=10, vertex.color=coreness(graph), main='Coreness', asp=0)

# Components
components(graph)

# Blockmodelling 
adj <- as.matrix(as_adjacency_matrix(graph))

ahs2 <- optRandomParC(M=adj, k=2, rep=10, approach="ss", blocks = "com") 
ahs4 <- optRandomParC(M=adj, k=4, rep=10, approach="ss", blocks = "com") 
ahs8 <- optRandomParC(M=adj, k=8, rep=10, approach="ss", blocks = "com") 
ahs20 <- optRandomParC(M=adj, k=20, rep=10, approach="ss", blocks = "com") 


set.seed(1)
plot(ahs2, main="Two block partition")
plot(graph,
     vertex.color = ahs2$best$best1$clu,
     vertex.label.cex = 0.6,
     vertex.size = 8,
     layout = layout,
     main = "Two Block Partition")

set.seed(1)
plot(ahs4, main="Four block partition")
plot(graph,
     vertex.color = ahs4$best$best1$clu,
     vertex.label.cex = 0.6,
     vertex.size = 8,
     layout = layout,
     main = "Four Block Partition")

set.seed(1)
plot(ahs8, main="Eight block partition")
plot(graph,
     vertex.color = ahs8$best$best1$clu,
     vertex.label.cex = 0.6,
     vertex.size = 8,
     layout = layout,
     main = "Eight Block Partition")

set.seed(1)
plot(ahs20, main="Twenty block partition")
plot(graph,
     vertex.color = ahs4$best$best1$clu,
     vertex.label.cex = 0.6,
     vertex.size = 8,
     layout = layout,
     main = "Twenty block partition")



# D)  
# Transitivity 
# Global clustering
round(transitivity(graph), digits = 2)


# Local clustering vs. Betweeness 
T <- transitivity(graph, type="local")               #new vector storing local clustering coeffs
B <- betweenness(graph)                              #new vector storing betweenness
plot(T, B, xlab="Local clustering", ylab="Betweenness")          #plotting them, the rest below are cosmetic
abline(lm(B ~ T))   #adding a regression (best-fitting) line on plot 
text(0.8, 100, paste("Correlation:", round(cor(T,B),2))) #adding correlation between T and B on plot
text(T, B, labels=V(graph)$name,cex=0., font=2, pos=1) #adding the character


