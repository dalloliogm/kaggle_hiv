
# resistance related 
rr <- read.table('resistrelated.first8columns.txt', sep='\t',header=F)

# best defined
bd <- read.table('BestDefined.txt', sep='\t', header=F)
names(bd) <- c("name", "short_name", "gene", "start", "end", "clade", "polimorphism", "ref", "data")

