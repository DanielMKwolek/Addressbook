//
//  main.m
//  TinyAddressBook
//
//  Created by Daniel Kwolek on 8/22/16.
//  Copyright © 2016 Arcore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "contact.h"


int addressBookAddContact(NSMutableArray *addressbook);
int addressBookBuddies(NSMutableArray *addressbook, int i);
NSMutableString *getStringFromUser(int namelength, NSString *prompt);
int getIntFromUser(int minnum, int maxnum, NSString *prompt);
void setBuddy(contact *contactone, contact *contacttwo);
contact *getBuddyFromUser(NSMutableArray *addressbook);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *addressbook = [[NSMutableArray alloc] init];
        int Continue = 0;
        while (Continue == 0)
        {
            Continue = addressBookAddContact(addressbook);
        }
        NSLog(@"%@", addressbook);
        Continue = 0;
        int i = 0;
        while (Continue == 0)
        {
            Continue = addressBookBuddies(addressbook, i);
            i++;
        }
        NSLog(@"AddressBookBuddies Finished\n %@", addressbook);
    }
    return 0;
}

int addressBookAddContact(NSMutableArray *addressbook)
{
    NSString *contactName = getStringFromUser(20, @"What is the name of your contact?");
    NSString *contactEmail = getStringFromUser(30, @"and their email?");
    [addressbook addObject:[[contact alloc] initWithName:contactName email:contactEmail]];
    return getIntFromUser(0, 1, @"Are you done adding contacts?\n0: No\n1: Yes");

}
int addressBookBuddies(NSMutableArray *addressbook, int i)
{
    if ([addressbook count] > 1 && i < [addressbook count])
    {
        contact *currentcontact = [addressbook objectAtIndexedSubscript:i];
        NSLog(@"O: none");
        int tempCount = 1;
        for (contact *c in addressbook)
        {
            if ([c.name isEqual:currentcontact.name])
            {
                
            } else
            {
                NSLog(@"%@: %@", @(tempCount), c.name);
                tempCount++;
            }

        }
        int buddynum = getIntFromUser(0, ([addressbook count] - 1), [NSString stringWithFormat:@"Please enter the number of %@'s buddy", currentcontact.name]);
        if (buddynum > i)
        {
            setBuddy([addressbook objectAtIndex:i], [addressbook objectAtIndex:(buddynum)]);
        } else if (buddynum > 0)
        {
            setBuddy([addressbook objectAtIndex:i], [addressbook objectAtIndex:(buddynum - 1)]);
        }
        
        
        return 0;
    } else
    {
        return 1;
    }
}

NSMutableString *getStringFromUser(int namelength, NSString *prompt)
{

    fpurge(stdin);
    
    char *buffer = malloc(sizeof(char));
    char *result = NULL;
    while (result != buffer)
    {
        fpurge(stdin);
        NSLog(@"%@", prompt);
        result = fgets(buffer, namelength, stdin);
    }
    NSMutableString *returnvalue = [NSMutableString stringWithString:@(buffer)];
    free(buffer);
    return returnvalue;
}

void setBuddy(contact *contactone, contact *contacttwo)
{
    [contactone setBuddyName:contacttwo.name];
}
int getIntFromUser(int minnum, int maxnum, NSString *prompt)
{
    fpurge(stdin);
    int userinput = INT_MIN;
    while (userinput < minnum || userinput > maxnum)
    {
        NSLog(@"%@\n valid choices: %d...%d", prompt, minnum, maxnum);
        scanf("%d", &userinput);
        fpurge(stdin);
    }
    return userinput;
}

