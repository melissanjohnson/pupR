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
  dogpark <- html_session("https://pixabay.com/en/photos/rottweiler/")

  # Play hide and seek with the doggos
  hiddendoggos <- html_nodes(dogpark, "img")

  # Found them!
  nothiddendoggos <- html_attr(hiddendoggos,"src")
  nothiddendoggos <- nothiddendoggos[-grep("static", nothiddendoggos)]

  # Wait... We are missing some
  extrasneakydoggos <- html_attr(hiddendoggos,"data-lazy-srcset")
  extrasneakydoggos <- str_split(na.omit(str_remove_all(extrasneakydoggos,"[1-9]x")),",")
  extrasneakydoggos <- unlist(extrasneakydoggos)

  # Round them all up
  goodboyz <- c(nothiddendoggos, extrasneakydoggos)

  # Take them home
  temporary_file_location <- paste0(tempdir(), "/doggo.png")
  download.file(goodboyz[sample(1:length(goodboyz),1)],
                temporary_file_location, mode = "wb")

  # Bring the doggo to R
  rottie <- load.image(temporary_file_location)

  # Display the doggo
  plot(rottie, yaxt = 'n', axes = FALSE)
}
