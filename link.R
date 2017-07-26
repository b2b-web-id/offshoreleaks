library(RMySQL)
con <- dbConnect(MySQL(), dbname='offshoreleaks',
                 username='offshoreleaks', host='localhost')
dbListTables(con)
edges <- dbReadTable(con, "edges")
entities <- dbReadTable(con, "entities")
entities_id <- dbFetch(dbSendQuery(con, "SELECT * FROM entities
                                         WHERE country_codes LIKE '%IDN%'"), n=-1)
officers <- dbReadTable(con, "officers")
officers_id <- dbFetch(dbSendQuery(con, "SELECT * FROM officers
                                         WHERE country_codes LIKE '%IDN%'"), n=-1)

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
