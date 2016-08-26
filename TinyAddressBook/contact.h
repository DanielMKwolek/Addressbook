//
//  contact.h
//  TinyAddressBook
//
//  Created by Daniel Kwolek on 8/22/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface contact : NSObject
{
    
}
- (instancetype)initWithName:(NSString *)name
                       email:(NSString *)email;

- (instancetype)initWithName:(NSString *)name
                       email:(NSString *)email
                       buddy:(contact *)buddy NS_DESIGNATED_INITIALIZER;


@property (nonatomic, copy, readonly)NSString *name;
@property (nonatomic, copy, readonly)NSString *email;
@property (nonatomic, copy, readonly)contact *buddy;
@property (nonatomic, copy)NSString *buddyName;



@end
