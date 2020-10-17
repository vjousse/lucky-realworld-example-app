# Lucky Realworld Example App

This is an implementation of the [realworld backend spec](https://github.com/gothinkster/realworld) written using [Lucky](https://luckyframework.org).

### Setting up the project

1. [Install required dependencies](https://luckyframework.org/guides/getting-started/installing#install-required-dependencies)
1. Update database settings in `config/database.cr`
1. Run `script/setup`
1. Run `lucky dev` to start the app


### Testing using postman/newman
to launch test, we use [newman](https://github.com/postmanlabs/newman#getting-started)

    POSTMANCOLL=Conduit.auth.postman_collection.json APIURL=http://localhost:5000/api postman/run-api-tests.sh

### Learning Lucky

Lucky uses the [Crystal](https://crystal-lang.org) programming language. You can learn about Lucky from the [Lucky Guides](https://luckyframework.org/guides/getting-started/why-lucky).


### Progress

- [x] User
  - [x] Authentication
  - [x] Registration
  - [x] Get Current User
  - [x] Update User
- [x] Get Profile
- [x] Follow user
- [x] Unfollow user
- [x] Create Article
- [x] List Articles
  - [ ] Filter by tag
  - [ ] Filter by author
  - [ ] Filter by user
  - [ ] Favorited by user
  - [ ] Limit number of articles (default is 20)
  - [ ] Offset/skip number of articles (default is 0)
- [ ] Feed Articles
  - [ ] Limit number of articles (default is 20)
  - [ ] Offset/skip number of articlse (default is 0)
- [x] Get Article
- [x] Update Article
- [x] Delete Article
- [ ] Add Comments to an Article
- [ ] Get Comments from an Article
- [ ] Delete Comment
- [ ] Favorite Article
- [ ] Unfavorite Article
- [ ] Get Tags
