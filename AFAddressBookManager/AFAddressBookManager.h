//
//  AFAddressBookManager.h
//
//  Created by Anders Fogh Eriksen on 09/04/13.
//  Copyright (c) 2013 Anders Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFAddressBookManager : NSObject

/**
 *  Get name of contact with specific phone number.
 *
 *  @param phoneNumber Phone number for the contact.
 *
 *  @return Name of contact.
 */
+ (NSString *)nameForContactWithPhoneNumber:(NSString *)phoneNumber;

/**
 *  Get photo of contact with specific phone number.
 *
 *  @param phoneNumber Phone number for the contact.
 *
 *  @return Photo of contact.
 */
+ (UIImage *)photoForContactWithPhoneNumber:(NSString *)phoneNumber;

@end
