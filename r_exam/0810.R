install.packages("ggmap")
library(ggmap)
add1 = c('수원시', '화성시', '성남시')
add2 = enc2utf8(add1)
? geocode
add3 = geocode(add2, output = 'latlona')
add3$ad = add2

install.packages('leaflet')
library(leaflet)

leaflet(add3) %>% addTiles() %>% addMarkers(lng=~lon,lat=~lat,popup =~ad)
