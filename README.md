# SearchableMoviesTask

This demo for iOS developer vacancy in SWVL

## About This Task

It is a simple app which fetches movies from a local data set and display them in tablview, user will have to pull tableview down to show search bar, onca the user enter the search text an categorized, ordered list of movie will be shown. When the user taps on a movie, it shows movie detail, and it will fech images related to that movie.

There are in total 2 VIPER modules: Movies and MovieDetail.

Sorry for the UI 😂

### Used Architecture

VIPER Architecture

### Dependency Graph

The dependence graph is unidirectional, which means:  <br />
**View** knows about **Presenter**.  <br />
**Presenter** knows about **Router** ,**Interactor** and **View**.  <br />
**Interactor** grab data from **Workers _ Utilities**.  <br />
**Workers** communicates with repositories.

Every inner layer doesn't know anything about the outer layer. <br />
**delegates (protocols)** used to establish a pipline from inner layers to outer layers, to inform outer layers about the changes in inner layers.

### Third Party Libraries

**Alamofire** for network requests. <br />
**kingFisher** for downloading images.

### Services

Flicker API
