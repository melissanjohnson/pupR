#' pupR
#'
#' Your daily dose of doggo!
#'
#' @param dog_type The type of doggo you want to stare at!
#'      The argument is defaulted to 'dog', but you can choose to search for a specific type.
#'      If the type of doggo you are searching for has more than one word, make
#'      sure to include the URL encoder for space (+ or \%20) in between them.
#'
#' @return A photo of a dog is downloaded and displayed in the plot window.
#'
#' @importFrom rvest html_session html_nodes html_attr
#' @importFrom imager load.image
#' @importFrom stringr str_split str_remove_all
#' @importFrom graphics plot
#' @importFrom utils download.file
#'
#' @examples
#' pupR()
#'
#' pupR(dog_type = "great+dane")
#'
#' @export
pupR <- function(dog_type = "dog"){

  # make the url
  url <- paste0('https://free-images.com/search/?q=', dog_type, '&cat=st')
  # This is where all the doggos are
  dogpark <- html_session(url = url)

  # Play hide and seek with the doggos
  hiddendoggos <- html_nodes(dogpark, "img")

  # Found them!
  nothiddendoggos <- html_attr(hiddendoggos,"src")
  nothiddendoggos <- paste0("https://free-images.com",nothiddendoggos)

  # Take them home
  temporary_file_location <- paste0(tempdir(), "/doggo.png")
  download.file(nothiddendoggos[sample(1:length(nothiddendoggos),1)],
                temporary_file_location, mode = "wb")

  # Bring the doggo to R
  doggo <- load.image(temporary_file_location)

  # Display the doggo
  plot(doggo, yaxt = 'n', axes = FALSE)
}

