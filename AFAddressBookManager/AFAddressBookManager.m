//
//  AFAddressBookManager.m
//
//  Created by Anders Fogh Eriksen on 09/04/13.
//  Copyright (c) 2013 Anders Eriksen. All rights reserved.
//

#import "AFAddressBookManager.h"
#import <AddressBook/AddressBook.h>
#import "AFContact.h"
#import "NSString+UnformattedPhoneNumber.h"

@implementation AFAddressBookManager

+ (NSArray *)allContactsFromAddressBook
{
    static NSMutableArray *contacts = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        CFErrorRef *error = nil;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        
        __block BOOL accessGranted = NO;
        
        // Semaphore is used for blocking until response
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
            
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            accessGranted = granted;
            dispatch_semaphore_signal(sema);
        });
            
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
        
        if (accessGranted) {
            NSArray *allPeople = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
            contacts = [NSMutableArray arrayWithCapacity:allPeople.count];
            
            for (id person in allPeople) {
                @autoreleasepool {
                    AFContact *contact = [AFContact new];
                    
                    // Get the name of the contact
                    NSString *firstName = (__bridge_transfer NSString*)ABRecordCopyValue((__bridge ABRecordRef)(person), kABPersonFirstNameProperty);
                    NSString *lastName = (__bridge_transfer NSString*)ABRecordCopyValue((__bridge ABRecordRef)(person), kABPersonLastNameProperty);
                    
                    if (!firstName)
                        firstName = @"";
                    
                    if (!lastName)
                        lastName = @"";
                    
                    contact.name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
                    
                    // Get the photo of the contact
                    CFDataRef imageData = ABPersonCopyImageData((__bridge ABRecordRef)(person));
                    UIImage *image = [UIImage imageWithData:(__bridge NSData *)imageData];
                    if (imageData) {
                        CFRelease(imageData);
                    }
                    contact.photo = image;
                    
                    // Get all phone numbers of the contact
                    ABMultiValueRef phoneNumbers = ABRecordCopyValue((__bridge ABRecordRef)(person), kABPersonPhoneProperty);
                    
                    // If the contact has multiple phone numbers, iterate on each of them
                    NSInteger phoneNumberCount = ABMultiValueGetCount(phoneNumbers);
                    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:phoneNumberCount];
                    for (int i = 0; i < phoneNumberCount; i++) {
                        NSString *phoneNumberFromAB = [(__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, i) unformattedPhoneNumber];
                        [tempArray addObject:phoneNumberFromAB];
                    }
                    CFRelease(phoneNumbers);
                    contact.numbers = tempArray;
                    [contacts addObject:contact];
                }
            }
        }
        CFRelease(addressBook);
    });
    
    return contacts;
}

+ (AFContact *)findContactWithPhoneNumber:(NSString *)phoneNumber
{
    NSArray *contacts = [AFAddressBookManager allContactsFromAddressBook];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"numbers contains %@", phoneNumber];
    NSArray *filteredArray = [contacts filteredArrayUsingPredicate:predicate];
    
    AFContact *matchedContact = [filteredArray lastObject];
    return matchedContact;
}

+ (NSString *)nameForContactWithPhoneNumber:(NSString *)phoneNumber
{
    return [AFAddressBookManager findContactWithPhoneNumber:phoneNumber].name;
}

+ (UIImage *)photoForContactWithPhoneNumber:(NSString *)phoneNumber
{
    return [AFAddressBookManager findContactWithPhoneNumber:phoneNumber].photo;
}

@end
