AFAddressBookManager
====================
![Pod version](https://cocoapod-badges.herokuapp.com/v/AFAddressBookManager/badge.png)
![Pod platform](https://cocoapod-badges.herokuapp.com/p/AFAddressBookManager/badge.png)

Get contacts from iOS AddressBook by their phone numbers. Works on iOS 6+.

## Installation

### [CocoaPods](http://cocoapods.org)

```ruby
pod 'AFAddressBookManager'
```

### Manually

Copy all files from AFAddressBookManager folder to your project and add the [AddressBook framework](http://developer.apple.com/library/ios/#documentation/AddressBook/Reference/AddressBook_iPhoneOS_Framework/).

## Usage

Import `AFAddressBookManager.h` in the class where you want to use it.

### Available methods

Get name (First name and last name) of contact:
```objectivec
+ (NSString *)nameForContactWithPhoneNumber:(NSString *)phoneNumber;
```

Get photo of contact:
```objectivec 
+ (UIImage *)photoForContactWithPhoneNumber:(NSString *)phoneNumber;
```
