//
//  contact.m
//  TinyAddressBook
//
//  Created by Daniel Kwolek on 8/22/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

#import "contact.h"

@implementation contact


- (instancetype)init
{
    self = [self initWithName:@"Unnamed"
                        email:@"No Email"
                        buddy:nil];
    return self;
}



- (instancetype)initWithName:(NSString *)name
                       email:(NSString *)email
                       buddy:(contact *)buddy
{
    if (name == nil || email == nil)
    {
        return nil;
    }
    self = [super init];
    if (self) {
        _email = [email stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        _name = [name stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
        _buddy = buddy;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name
                       email:(NSString *)email
{
    self = [self initWithName:name email:email buddy:nil];
    return self;
}

- (NSString *)description
{
    
    if (self.buddyName == NULL)
    {
        return [NSString stringWithFormat:@"Name: %@ -o- Email: %@", self.name, self.email];
    }
    else
    {
        return [NSString stringWithFormat:@"Name: %@ -o- Email: %@ -o- Buddy: %@", self.name, self.email, self.buddyName];
    }
}

- (void)setBuddy:(contact *)buddy
{
    self.buddyName = buddy.name;
}

@end
