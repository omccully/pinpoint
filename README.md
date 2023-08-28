# Pinpoint Rails App

The purpose of this Rails app is to display the current location of the [Pinpoint PIC](https://github.com/omccully/pinpoint-pic) device. This Rails app receives position updates via its REST API from the [Pinpoint Relay](https://github.com/omccully/PinPointRelay) program. When the Pinpoint PIC device generates an alarm, the alarm is relayed to this Rails app to alert the user with a sound and a blinking red light on the web page.

## Related Repositories

- [pinpoint-pic](https://github.com/omccully/pinpoint-pic) - C microcontroller program for this project
- [PinPointRelay](https://github.com/omccully/PinPointRelay) - C# Windows app for relaying messages from the device to the web server

## Demo

https://www.youtube.com/watch?v=boWn7i7RBzA

![Relay](/full-screenshot.png)
