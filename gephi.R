# Impor dari data R
g_edges <- edges
names(g_edges) <- c('source','label','target')
g_nodes <- nodes[, c('node_id','name')]
names(g_nodes) <- c('id','label')
# Ekspor ke CSV
write.csv(g_edges, file="gephi_edges.csv")
write.csv(g_nodes, file="gephi_nodes.csv")
# End