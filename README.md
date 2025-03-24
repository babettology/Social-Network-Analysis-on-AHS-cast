# Social-Network-Analysis-on-AHS-cast

# Introduction 

This report assess the network of cast members of American Horror Story (AHS) television show. The show is an American-based series that started in 2011 and is still running, with over 12 seasons as of 2025.
Unlike conventional TV shows, AHS follows an anthology format, changing storylines and most actors each season. Despite the format’s fragmentation, recurring actor co-appearances and an overarching narrative persist across seasons, making network analysis a valuable tool for exploring these connections.

# A) Network Description

We transcribed the data from the AHS cast Wikipedia page, excluding one-off actors, guest stars, and co-starring roles , then processed to show only co-appearances. 

In this network we have 55 nodes, each representing a cast member and the edges as the actors co-appearances in the series. Given that co-acting relationships are mutual, the network is undirected and unweighted.

Figure 1: AHS Co-Starring Network 
![AHS network_page-0001](https://github.com/user-attachments/assets/7014530d-fe2b-44cc-8853-f59326a5be07)


# B) Characteristics of the network and its nodes

With a density of 0.45, the network shows significant actor collaboration without being fully connected. Additionally, the network diameter is 2 meaning the farthest distance between any two actors in the AHS cast network is at most two steps. This suggests high cohesion with recurrent actors efficiently spreading influence.

We should also look at centrality measures to capture the relative importance of nodes within a network.

## a) Degree Centrality

Firstly, degree centrality is the most evident way of looking at the importance of nodes. This measure the number of direct connections an actor has within the network and where a high degree centrality indicates an actor who frequently collaborates with diverse cast members.

Table 1: Top scoring nodes by degree
![t1_page-0001](https://github.com/user-attachments/assets/c5e70030-4b1f-4de0-a152-3cba545e1274)

From table 1, the degree values reflect the actors who have collaborated with the most diverse range of cast members throughout the series. Lily Rabe's high degree centrality (53) means she has shared scenes with 96% of all major cast members across the series. This high collaboration network suggests she's been a consistent presence across multiple seasons, adapting to different roles and storylines.

## b) Closeness Centrality

In addition, closeness centrality measures how efficiently an actor can reach all others in the network. Calculated as the inverse of the sum of distances from a node to all others, higher scores indicate faster access to the entire network and reinforce their prominence within the network.

Table 2: Top scoring nodes by closeness
![t2_page-0001](https://github.com/user-attachments/assets/40ceefc1-d081-4e12-8dc2-cbc06a2bba33)


Form table 2, Lily Rabe's closeness score (0.0182) suggests she has the most efficient paths to reach other cast members, making her central to the network's communication and influence dynamics. However, the small range of closeness values suggests a uniformly accessible network with efficient information flow.

## c) Eigenvector Centrality

Lastly, unlike previous measures which treated all connections equally, eigenvector centrality weighs connections based on the importance of neighboring nodes. This makes it particularly relevant for identifying key figures whose influence extends beyond direct edges. 

Table 3: Top scoring nodes by Eigenvector
![t3_page-0001](https://github.com/user-attachments/assets/5776584f-3c7d-4ce2-9828-3418192e83bc)

From Table 3,  Lily Rabe's score (1.000) and the three actors after follow very close indicating they not only work with many actors but specifically collaborate with other highly connected cast members. This suggests they are central to the  most important ensemble scenes and storylines of the show.

Table 5: Correlation between centrality measures 
 ![t5_page-0001](https://github.com/user-attachments/assets/2277ca97-7ee8-46c5-87c7-ccbf733f3c81)

From table 5, we can see that all measures are statistically significant and highly correlated, where actors who score highly in one measure tend to do so in other measures. 

Lastly, the Freeman's centralisation formula, yields a score of 0.53. This shows that while certain nodes have a higher degree of connectivity, network as a whole does not revolve around a single dominant node. Instead, influence and connectivity are distributed among a group of central nodes. 

Overall, the centrality measures seems to show that rather than focusing on a central actor, groups seems to continuously work together throughout the show, with the most central being the trio Sarah Paulson, Lily Rabe, and Denis O'Harewhich  consistently ranking at the top across all measures, indicating their fundamental importance to the show's casting structure. 

# B) Characteristics of groups of nodes

Beyond individual actor influence, the network also show distinctive substructures. 

## a)	Cliques

A clique is defined within an undirected network as a set of nodes where every member is directly connected to every other member by an edge. In the study, a clique represents a group of actors who have all co-appeared with each other and illustrate the strongest collaborative bonds within the network. 
 
Figure 2: Largest cliques in the network and corresponding actors.
![Lclique_page-0001](https://github.com/user-attachments/assets/407011ca-eb2e-4515-85f2-1884451772d2)
![clique 1 2 _page-0001](https://github.com/user-attachments/assets/40856c8c-0faa-4ffb-bcc0-060ce05eb262)

Figure 2 shows the two largest cliques in the network, where actors are fully connected through shared appearances. While cliques highlight tightly knit collaborations, they do not account for actors who connect multiple groups without forming strict cliques. To better understand these broader connections, we turn to k-core analysis.

## b) K-Cores

In that case, we should look at coreness as the degree of connectivity each actor has in the network. The k-core highlights the most central and well-connected to many others actors in order to measure the network's robustness and cohesion.

Figure 3 : K-cores in the AHS Network
![Coreness_page-0001](https://github.com/user-attachments/assets/c7c82480-9e44-4730-90af-6c48b3b7ed32)


Figure 3 shows that the majority of the vertices have coreness values of 18, indicating high centrality and strong communication within the network. The 12-core contains three moderately connected actors, while the 13-core includes eight actors bridging central and peripheral groups, enhancing network cohesion. This network reflects the show's strategy of maintaining continuity while also incorporating new elements with less central cast members, aligning with the anthology format.

While we could examine components, the network consists of a single connected component with 55 vertices, meaning all actors share a common membership. This reflects the dataset’s focus on key cast members while excluding one-time appearances and guest roles.

Nonetheless, k-core focuses on high centrality and may miss smaller groups who might still play important roles in the series’ collaborations but are not part of the dense core. To address this, blockmodelling offers an alternative perspective. 


## a)	Blockmodelling

The blockmodelling method partitions the network into blocks based on the similarity of actors' connections, grouping nodes with comparable patterns of connectivity, even if they are not directly connected. This identify actors with structural equivalance, allowing for the grouping of those who may not appear together but frequently collaborate within the network. 

To identify the most effective partitioning, we compared different blockmodelling. 

Figure 4: Comparing different number of block partitions 
![block rep_page-0001](https://github.com/user-attachments/assets/0c5c7265-da96-4ce0-9d91-7b436223c879)


Figure 4 shows that a 2-block partition oversimplifies the network, missing key patterns, while a 20-block partition is too granular, losing its significance. The difference between the 4-block and 8-block partitions seems minimal, with the central and peripheral groups not too changed, suggesting that increasing blocks beyond 4 does not provide much additional insight.
A 4-block partition strikes a good balance, capturing key subgroups and clusters while maintaining the overall network structure.
However, while blockmodelling enhances our understanding of actor dynamics, it has inherent limitations, such as the trade-off between granularity and interpretability, which ultimately leaves room for subjective interpretation by researchers.


# C) Characteristics of the edges:

Finally, we examine the network's transitivity

The global clustering coefficient of 0.66 indicates high transitivity, meaning there is a 66% chance that two actors neighbours will also be connected. This high value is typical in tv-show networks, forming cliques and triangles. Yet by its anthology nature, this indicates that AHS relies on an interconnected pool of actors, rather than casting each season independently.

Furthermore, analysing local clustering and betweenness centrality reveals the role of actors in transmitting information within the network.

Figure 5: Local clustering and betweenness regression analysis
![f5_page-0001](https://github.com/user-attachments/assets/3f3fd9ed-bf23-49d8-98fe-548b7355511e)

Figure 5 presents the strong negative correlation of -0.84 suggests that actors with high betweenness centrality tend to have low local clustering, and vice versa. 

Actors such as Sarah Paulson, Lily Rabe, and Denis O'Hare, with high betweenness and low clustering, serve as key connectors between isolated groups, facilitating communication across the network. Their positions enable them to influence interactions beyond their immediate connections.

On the other hand, some actors seem to cluster around high local clustering values (around 0.8) but low betweenness, which could suggest that many actors are tightly integrated within their subgroups but do not bridge these subgroups to the larger network. This reflects the broader pattern, where a core group of actors bridges the network, while smaller and likely tied to specific seasons, play a lesser role in overall network dynamics.
    
# Conclusion

The AHS cast network is a well-connected and cohesive structure that represents the tv-show unique anthology format. Our study seem to show that rather than a single dominant actor, groups of similar actors collaborate regularly. The network's cohesion promotes efficient influence and collaboration with key actors like Sarah Paulson, Lily Rabe, and Denis O'Hare consistently ranking high in centrality measures. 
Lastly, the presence of strong sub-structures further ensures continuity despite changing storylines, confirm the series intentional casting strategy in preserving
