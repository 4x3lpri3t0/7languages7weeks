let cartesian (xs,ys) = do x <- xs; y <- ys; return (x,y)
cartesian ([1..2], [3..4])