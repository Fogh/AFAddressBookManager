AFAddressBookManager
====================

Get contacts from iOS AddressBook by their phone numbers. Works on iOS 6+.

## Installation

### Using [CococaPods](http://cocoapods.org). NOT WORKING YET!

```ruby
pod 'AFAddressBookManager'
```

### Manually

Import all files from AFAddressBookManager folder to your project and add the AddressBook framework.

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
