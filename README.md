#  README

A very simple MVVM demo app.

It includes unit tests, dependency injection and a navigation facility to keep all components decoupled and fully testable.

All UI components are fully implemented in code (no .xib files or Interface Builder).

## How to install

Clone the project using the following command:

```bash
$ git clone https://github.com/jerosanchez/HastenSports.git
```

The project requires Xcode 11+ to build and supports iOS 9+.

## Dependencies

All dependencies are fetched and built automaticvally through DSwift Package Manager (SPM).

## Usage

When you open the app, it immediately issues a request to fetch available groups of players.

You can see details tapping on any player.

## Architecture

The code base is organized in the following folders:

- Assembly
- Config
- Domain
- Helpers
- Navigation
- Repository
- Scene
- Service

The project also includes unit tests for the key components: domain models, helpers, repositories and services.

## Improvements

Below are some possible improvements that can be tackled in the future:


## Credits

Dummy person image made by SimpleIcon from www.flaticon.com
