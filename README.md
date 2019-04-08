# SSPlaceHolderTableView

> This is simple, customized and easy state wise PlaceHolder for TableView and CollectionView.

[![Version](https://img.shields.io/cocoapods/v/SSPlaceHolderTableView.svg?style=flat)](https://cocoapods.org/pods/SSPlaceHolderTableView)
[![License][license-image]][license-url]
[![Platform](https://img.shields.io/cocoapods/p/SSPlaceHolderTableView.svg?style=flat)](https://cocoapods.org/pods/SSPlaceHolderTableView)
[![Swift Version][swift-image]][swift-url]
[![PRs Welcome][PR-image]][PR-url]

![Example](https://media.giphy.com/media/TL6hrx7L4YUXh8HnnX/giphy.gif)
## Requirements

- iOS 11.0+
- Xcode 10.0+

## Installation
SSPlaceHolderTableView doesn't contain any external dependencies.

It is available through [CocoaPods](https://cocoapods.org/pods/SSPlaceHolderTableView). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SSPlaceHolderTableView'
```

## Usage example

### Set UITableView to TableView
![alt text](https://raw.githubusercontent.com/simformsolutions/SSPlaceHolderTableView/master/SSPlaceHolderTableView/ScreenShot/TableView.png)


### Set UICollectionView to CollectionView
![alt text](https://raw.githubusercontent.com/simformsolutions/SSPlaceHolderTableView/master/SSPlaceHolderTableView/ScreenShot/CollectionView.png)

### Set TableView State to Use Placeholder TableView

## Usage example

**NetworkUnReachableBlock**
- If you want to use inbuild Reachability for API call, You can simply add your API call inside this networkUnReachableBlock.
- Put this code in *viewDidLoad*


        tblView.networkUnReachableBlock = {
        // put your API Call here.
        }
        
**Loading State**   
- You can put this state before your API call or data collecting method.
- **Customisation**: In loadingImg param, You can pass your custom image and in loadingLabelTitle you can pass your custom attributed string.


        tblView.setState(.loading(loadingImg: nil, loadingLabelTitle: nil))

**Data Available State**   
- When your data successfully available simply put this line in your code.


        tblView.setState(.dataAvailable(viewController: self))

**Data UnAvailable State**   
- When your data not available simply put this line in your code.
- **Customisation**: In noDataImg param, You can pass your custom image for no data and in noDataLabelTitle you can pass your custom attributed string.


        tblView.setState(.noDataAvailable(noDataImg: nil, noDataLabelTitle: nil))
**No Internet available State**       
- When Internet is not available put this line.
- **Customisation**: In noInternetImg param You can pass your custom image for no internet state and in noInternetLabelTitle you can pass your custom attributed string.


        tblView.setState(.checkInternetAvaibility(noInternetImg: nil, noInternetLabelTitle: nil))
## NOTE
- If you want to use this in UICollectionView Simply replace your collectionView object with tblView in above codes.

## Contribute

We would love you for the contribution to SSPlaceHolderTableView, check the LICENSE file for more info.

## License

SSPlaceHolderTableView is Distributed under the MIT license. See ``LICENSE`` for more information..


[PR-image]:https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square
[PR-url]:http://makeapullrequest.com
[swift-image]:https://img.shields.io/badge/swift-4.2-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
