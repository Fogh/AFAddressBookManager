//
//  AFAddressBookManager.h
//
//  Created by Anders Fogh Eriksen on 09/04/13.
//  Copyright (c) 2013 Anders Eriksen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFContact.h"

@interface AFAddressBookManager : NSObject

+ (NSString *)nameForContactWithPhoneNumber:(NSString *)phoneNumber;
+ (UIImage *)photoForContactWithPhoneNumber:(NSString *)phoneNumber;

@end
