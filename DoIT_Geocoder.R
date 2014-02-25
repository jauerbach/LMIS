#Uses NYC DOIT's Gecoder API to retrieve the latitiude and longitude from an address

library(RCurl)
library(RJSONIO)

site <- function(houseNumber,
                street,
                borough,
                app_id,
                app_key,
                format="json"){
    url <- paste("https://api.cityofnewyork.us/geoclient/v1/address.",
                 format,
                 "?houseNumber=",houseNumber,
                 "&street=",street,
                 "&borough=",borough,
                 "&app_id=",app_id,
                 "&app_key=",app_key,
                 sep="")
    return(URLencode(url))
}

geocode <- function(houseNumber,
                    street,
                    borough,
                    app_id="5d912c7f",
                    app_key="2064c7ce62b202d96bd02d102e6fb64e"
                    ){
    data <- fromJSON(
                     paste(getURL(site(houseNumber=houseNumber,
                                          street=street,
                                          borough=borough,
                                          app_id=app_id,
                                          app_key=app_key)),collapse="")
                     )
    Latitude<-data$address$latitude
    Longitude<-data$address$longitude
    return(c(Latitude,Longitude))
}
