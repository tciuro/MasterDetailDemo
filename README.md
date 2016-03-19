# MasterDetailDemo

This project demonstrates an issue that occurs on a standard Master-Detail project. The code is exactly what's shipping in Xcode 7. The only difference is the additional UITableViewController with a UISearchBar that I've added to demonstrate the problem.

### What's the problem?
Basically, the controller with the search bar will "jump" from the Master section to the Detail one after the device has been fully rotated.

#### Starting Point:
![Alt text](https://www.dropbox.com/s/aww62eiy6717ge4/one.png?dl=0;raw=true "One")

#### Tapping on "One" shows:
![Alt text](https://www.dropbox.com/s/zczyy1u45ns2dw3/two.png?dl=0;raw=true "Two")

#### Rotate to Portrait mode shows:
![Alt text](https://www.dropbox.com/s/69jggyb40rlyfho/three.png?dl=0;raw=true "Three")

#### Rotate to Landscape shows:
![Alt text](https://www.dropbox.com/s/1f4lbclmlxue9y6/four.png?dl=0;raw=true "Four")

### See the problem?
The controller with the search bar should be displayed in Master, but instead remains in the Detail section.