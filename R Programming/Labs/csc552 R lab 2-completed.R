#James Curtis Addy
#J00812469

#Use the grass2 data from the Beginning.RData file for this activity, which you use to reorder
#and add to.

# 1 Look at the data frame called grass2 simply by typing its name:
grass2

#2. Create an index using the values in the mow column, 
# with ties resolved by the unmow column:
ordered_indices = order(grass2[,1],grass2[,2])

# 3.Look at the index you just created:
ordered_indices

# 4. Now create a new data frame using the sort index you just made: 
ordered_grass2 = grass2[ordered_indices,]


# 5. Select a different order for the columns 
# by specifying them in the square brackets in a new order:
ordered_grass2[, c(2,1)]

# 6. Now create a new vector of values:
v = c(100, 200, 300, 400, 500)

#7. Finally, create a data frame that includes the original data 
# plus the new vector you just created. Use
# the sort index from before:
new_frame = data.frame(grass2, v)[ordered_indices,]
