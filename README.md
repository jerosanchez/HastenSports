#  README

A very simple MVVM demo app.

It includes unit tests, dependency injection, centralized app configuration and a navigation facility to keep all components decoupled and fully testable.

All UI components are fully implemented in code (no .xib files or Interface Builder are used).

## How to install

Clone the project using the following command:

```bash
$ git clone https://github.com/jerosanchez/HastenSports.git
```

The project supports iOS 9+ and requires Xcode 11+ to build.

## Dependencies

All dependencies are fetched and built automatically through Swift Package Manager (SPM):

- SDWebImage: to download images asynchronously with a cache mechanism

## Usage

When you open the app, it immediately issues a request to fetch a list of all available players.

You can see the detail of any player tapping on the corresponding row.

## Architecture

The code base is organized in the following folders:

- Assembly - A simple dependency injection facility to keep all app components decoupled
- Config - A struct organized with extensions to keep a central place to setup key app behaviours 
- Domain - Domain models; for simplicity, we use the same models for both web services and the app (no mapper is used)
- Helpers - Some useful UIKit extensions and classes, and the Observable facility to build our MVVM architecture
- Navigation - A simple navigation mechanism to keep all scenes decoupled from each other
- Repository - The single access point to our data (either remote or local) so we don't need to couple scenes to the network layer 
- Scene - One subfolder per scene, each one including necessary controllers, subviews, view models, etc.
- Service - Gateway layer between our app and third-party frameworks so it's easy to exchange concrete implementations

The project also includes unit tests for the key components: domain models, helpers (not extensions), repositories and services.

## Improvements

Below are some possible improvements that can be tackled:

- Add unit tests also for scenes components
- Add a Hasten Sports app icon

## Credits

Dummy picture image by SimpleIcon from www.flaticon.com
