# Project 2 - Flix

Flix is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: **11** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.

The following **optional** features are implemented:

- [X] User sees an error message when there's a networking error.
- [X] Movies are displayed using a CollectionView instead of a TableView.
- [ ] User can search for a movie.
- [ ] All images fade in as they are loading.
- [X] Customize the UI. // Included a different TableView design, gradients, etc.

The following **additional** features are implemented:

- [X] Include large poster
- [X] Incorporate details screen where users can see large poster, movie title, and full overview
- [X] Customize the navigation bar
- [X] Customize the selection effect of the cell (by removing it)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/PLKd8R9.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

**TODO**
- Include refresh and loading state on CollectionView screen

**ISSUES**
- Strange bug on emulator with the pull to refresh, but doesn't seem present on an actual device

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

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
