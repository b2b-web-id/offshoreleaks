edges <- read.csv("data/edges.csv", header=T, sep=";")
nodes <- read.csv("data/nodes.csv", header=T, sep=";")
edges_fix <- edges[, c('Entity_ID1', 'Entity_ID2', 'Entity_ID1', 'description_')]
edges_fix <- merge(edges_fix, nodes[,c('Unique_ID','Description_')], by.x=c('Entity_ID1'), by.y=c('Unique_ID'))
edges_fix <- merge(edges_fix, nodes[,c('Unique_ID','Description_')], by.x=c('Entity_ID2'), by.y=c('Unique_ID'))
names(edges_fix) <-c('ID2','ID1','ID11','LINK','NAME1','NAME2')
edges_fix <- edges_fix[, c('ID1','ID2','LINK','NAME1','NAME2')]
nodes_fix <- nodes[, c('Unique_ID','Description_')]
names(nodes_fix) <- c('ID','NAME')
rm(edges)
rm(nodes)
write.table(edges_fix, file="data/edges_link.csv", sep=";", row.names=F)
write.table(nodes_fix, file="data/nodes_link.csv", sep=";", row.names=F)
save.image(file="link/link.RData")
