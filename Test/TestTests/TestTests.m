//
//  TestTests.m
//  TestTests
//
//  Created by Yevhen Kim on 2016-07-01.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import <XCTest/XCTest.h>

//we can write classes here like this:
@interface Dog: NSObject
@end
@implementation Dog

<#methods#>

@end


//this is test part
@interface TestTests : XCTestCase

@end

@implementation TestTests



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // create new instancce of the class:
    Dog *d = [Dog new];
}



@end
