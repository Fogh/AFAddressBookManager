AFAddressBookManager
====================
![Pod version](http://img.shields.io/cocoapods/v/AFAddressBookManager.svg?style=flat)
![Pod platform](http://img.shields.io/cocoapods/p/AFAddressBookManager.svg?style=flat)

Get contacts from iOS Address Book by their phone numbers and email addresses. Works on iOS 6+.

## Installation

### [CocoaPods](http://cocoapods.org)

```ruby
platform :ios, '6.0'
pod 'AFAddressBookManager', '~> 1.1'
```

### Manually

Copy all files from AFAddressBookManager folder to your project and add the [Address Book framework](http://developer.apple.com/library/ios/#documentation/AddressBook/Reference/AddressBook_iPhoneOS_Framework/).

## Usage

Import `AFAddressBookManager.h` in the class where you want to use it.

### Available methods

Get name (first and last) of contact by phone number:
```objectivec
+ (NSString *)nameForContactWithPhoneNumber:(NSString *)phoneNumber;
```

Get photo of contact by phone number:
```objectivec 
+ (UIImage *)photoForContactWithPhoneNumber:(NSString *)phoneNumber;
```

Get name (first and last) of contact by email address:
```objectivec
+ (NSString *)nameForContactWithEmailAddress:(NSString *)emailAddress;
```

Get photo of contact by email address:
```objectivec 
+ (UIImage *)photoForContactWithEmailAddress:(NSString *)emailAddress;
```

---

<a href="http://Fogh.tip.me">
  <img
    alt="Tip Me With ChangeTip"
    src="https://cdn.changetip.com/img/logos/tipme_square.png?1"/>
</a>
