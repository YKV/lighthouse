//
//  ContactList.m
//  ContactList
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

- (instancetype)init {
    self = [super init];
    if (self) {
        _contacts = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addContact:(Contact *)newContact {
    [self.contacts addObject:newContact];
}

- (void)listContacts {
    for (int i = 0; i < [self.contacts count]; i++) {
        Contact *currentContact = self.contacts[i];
        NSLog(@"%d: %@", i,currentContact.name);
    }
}

//BONUS 1 show command with id of contact
- (void)show:(int)index {
    if (index < [self.contacts count]) {
        Contact *showContact = self.contacts[index];
        NSLog(@"%d: %@ %@",index,showContact.name,showContact.email);

    }
    else {
        NSLog(@"There is no contact information with provided id");
    }
}

//BONUS 2 find command with name of contact
//- (void)find:

@end
