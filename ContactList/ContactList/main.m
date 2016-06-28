//
//  main.m
//  ContactList
//
//  Created by Yevhen Kim on 2016-06-28.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    //ask user to add new contact to the list
    NSString *mainMenuPrompt = @"To exit from the list please type quit\nPlease enter your new contact: ";
    
    //
    InputCollector *userInput = [[InputCollector alloc]init];
    NSString *username = [userInput inputForPrompt:mainMenuPrompt];
    
    ContactList *contacts = [[ContactList alloc]init];
    Contact *contact = [[Contact alloc]init];
    while (![username isEqualToString:@"quit"]) {
        
        
        if([username isEqualToString:@"new"]) {
            NSString *fullName = [userInput inputForPrompt:@"Please enter full name: "];
            
            NSString *email = [userInput inputForPrompt:@"Please enter email address: "];
            
            contact.name = fullName;
            contact.email = email;
            [contacts addContact:contact];
            
            NSLog(@"Name is %@ and email is %@",fullName,email);
            [contacts listContacts];
            
            

        }
        else if([username isEqualToString:@"show"]) {
            NSString *index = [userInput inputForPrompt:@"Please enter id of contact: "];
            int num = [index intValue];
            
            [contacts show:num];
            
        }
        else if([username isEqualToString:@"find"]) {
            
        }
        
        else {
            NSLog(@"Your new contact is %@", username);
        }
        username = [userInput inputForPrompt:mainMenuPrompt];
    }
    
    
    
    
    return 0;
}
