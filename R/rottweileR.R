#' rottweileR
#'
#' This function was inspired by and named for my Rottweiler, Einstein. These aren't pictures of Einstein. If you want to see those, check out einsteinstheoryofbarktivity on Instagram!
#'
#' @return A photo of a Rottweiler is downloaded and displayed in the plot window.
#'
#'
#' @examples
#' rottweileR()
#'
#' @export
#'
rottweileR <- function(){
  # This is where all the doggos are
  dogpark <- html_session("https://free-images.com/search/?q=rottweiler&cat=st")

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
