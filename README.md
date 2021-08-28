# Users Posts Library

This is a fun application that will fetch an array of users. These users have done some posts and we will have the pictures they used in each post.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing

Clone the repo by executing the command and you be ready to go

```
ggit@github.com:viniciusromani/posts-library.git
```

## Architecture

* Clean Architecture was used and it is represented by `Presentation`, `Domain` and `Data` folders
* MVVM for presentation layer in all scenes
* Networking layer created to encapsulate responsabilities. It is split in Request/Response where the last makes use o [Decodable Protocol](https://developer.apple.com/documentation/swift/decodable) to parse server response
* Coordinator Software Pattern for routing inside application
* ViewCode using SnapKit for auto-layout
* DependencyInjection via initializer for all files's dependencies
* Reactive Programming for binding UI elements to data sources

## Features

* Users Posts Screen
	* We show a list of users and also their respectives posts
	* You can pull to refresh data
	* Every time an API call succeeds, the result is saved on Couchbase for caching
	* If the API call fails, the application tries to get data from cache
	* If the cache does not have any data too, it show an empty state
	* Each post has some images related to it and also a date

## Improvements/Ideas

* What if we develop a carrousel for posts that have more than 3 pictures?
* Testing is life! Let's add some
* We could try to replace standard `UIRefreshControl` loading to a `Skeleton` loading, it might look good? ham?
* A zoom of a post detail screen would also fit well (I think!)

## Built With

* [Alamofire](https://github.com/Alamofire/Alamofire) - Networking abstration layer
* [Kingfisher](https://github.com/onevcat/Kingfisher) - For image downloading and caching
* [CouchbaseLiteSwift](https://github.com/couchbase/couchbase-lite-ios) - For caching network responses
* [RxSwift](https://github.com/ReactiveX/RxSwift) - For Reactive binding and Network Calls
* [SnapKit](https://github.com/SnapKit/SnapKit) - For Auto-Layout constraints helper
* [Swinject](https://github.com/Swinject/Swinject) - For Dependency Injection
