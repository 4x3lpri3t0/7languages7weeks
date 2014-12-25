// XML

val movies =
  <movies>
    <movie genre="action">Pirates of the Caribbean</movie>
    <movie genre="fairytale">Edward Scissorhands</movie>
  </movies>

// To see all inner text:
movies.text

val movieNodes = movies \ "movie"

movieNodes(0)

// You can also look for attributes of individual XML nodes by using the @ symbol.
// For example, to find the genre attribute of the first element in the document:

movieNodes(0) \ "@genre"