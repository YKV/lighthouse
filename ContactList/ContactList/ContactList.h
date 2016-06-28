//
//  ContactList.h
//  ContactList
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contacts;

- (void)addContact:(Contact *)newContact;

- (void)listContacts;

- (void)show:(int)index;

@end
