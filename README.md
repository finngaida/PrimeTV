# PrimeTV
Attempting to view Amazon Prime Instant Video on the new Apple TV 

## How to install
You'll need to edit `Availability.h` for tvOS, which can be found in `/usr/include` to redirect the `__TVOS_PROHIBITED` and `__TVOS_UNAVAILABLE` flags to something that evaluates to true.
Other than that you'd want to enter your Amazon login in the main View Controller and the code to the show you're watching.

## What's this?
This makes use of the fact that `tvOS` is actually just `iOS` with some restrictions. If you remove those restrictions, you can just use the Apple TV as a web browser. With some JavaScript the fun is endless ;).

## License
Apache, I guess.
