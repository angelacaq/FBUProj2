# Project 2 - Flix

Flix is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **16** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [X] User sees an error message when there's a networking error.
- [X] Movies are displayed using a CollectionView instead of a TableView.
- [X] User can search for a movie.
- [X] All images fade in as they are loading.
- [X] Customize the UI. (included a different TableView design, gradients, etc.)

The following **additional** features are implemented:

- [X] Include large poster
- [X] Incorporate details screen where users can see large poster, movie title, and full overview
- [X] Customize the navigation bar
- [X] Customize the selection effect of the cell (by removing it)
- [X] Add rating stars which displays rating and number of votes
- [X] Add icons
- [X] Include links to Fandango (for showtimes) and iMDB (for movie info)

## Video Walkthrough

Here's a walkthrough of implemented user stories. Click to watch video:

[![Video Walkthrough](https://img.youtube.com/vi/jtAbyCUkTmI/0.jpg)](https://www.youtube.com/watch?v=jtAbyCUkTmI)

<img src='http://i.imgur.com/597p0II.png' width='' /> <img src='http://i.imgur.com/8o3RK1y.png' width='' />
<img src='http://i.imgur.com/RrDaGOo.png' width='' /> <img src='http://i.imgur.com/b3XDnBP.png' width='' />

## Notes

**ISSUES**
- Strange bug on emulator with the pull to refresh, but doesn't seem present on an actual device

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [HCSStarRatingView](https://github.com/hsousa/HCSStarRatingView) - basic star rating interface
- [Pexels](https://www.pexels.com/photo/camera-event-live-settings-66134/) - film stock photo
- [iconmonstr.com](http://iconmonstr.com/magnifier-5/?png) - magnifying glass icon

## License

    Copyright 2016 Angela Chen

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
