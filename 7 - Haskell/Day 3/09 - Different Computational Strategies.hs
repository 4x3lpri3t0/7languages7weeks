instance Monad [] where
	m >>= f	 = concatMap f m
	return x = [x] 