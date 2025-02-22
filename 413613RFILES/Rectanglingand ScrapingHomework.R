

# DS 413/613 HOMEWORK 7 KEY

library(rvest)
library(dplyr)
library(tidyverse)
library(repurrrsive)
listviewer::jsonedit(gh_users)


Link <- "https://www.imdb.com/list/ls091520106/"
page = read_html(Link)
Title = page%>% html_nodes(".lister-item-header a")%>%
  html_text()
Title



Link <- "https://www.imdb.com/list/ls091520106/"
page = read_html(Link)
Runtime = page%>% html_nodes(".runtime")%>%
  html_text()
Runtime



Link <- "https://www.imdb.com/list/ls091520106/"
page = read_html(Link)
Ratings = page%>% html_nodes(".ipl-rating-star.small .ipl-rating-star__rating")%>%
  html_text()
Ratings


Link <- "https://www.imdb.com/list/ls091520106/"
page = read_html(Link)
Years = page%>% html_nodes(".text-muted.unbold")%>%
  html_text()
Years

moviesdataframe3 = data.frame(Title,Ratings, Runtime)
moviesdataframe3

as_tibble(moviesdataframe3)-> y
y

moviesdataframe3$Ratings <- as.numeric(as.character(moviesdataframe3$Ratings))
moviesdataframe3$Ratings

#2

gh_repos



# gh_repos similarly, by putting it in a tibble:
  
  repos <- tibble(repo = gh_repos)
repos


listviewer::jsonedit(gh_repos)


list(repos$repo[[1]])

repos <- repos %>% unnest_wider(repo)
repos


repos%>%
  filter(fork == "FALSE")


repos %>% hoist(repo, 
                login = c("owner", "login"), 
                name = "name",
                homepage = "homepage",
                watchers = "watchers_count"
)

repos %>% 
  hoist(repo, owner = "owner") %>% 
  unnest_wider(owner)

#2e

tibble(repo = gh_repos) %>% 
  unnest_auto(repo) %>% 
  unnest_auto(repo)


q()
y