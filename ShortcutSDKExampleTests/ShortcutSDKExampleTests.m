//
//  ShortcutSDKExampleTests.m
//  ShortcutSDKExampleTests
//
//  Created by Severin Schoepke on 06/02/15.
//  Copyright (c) 2015 Shortcut Media AG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface ShortcutSDKExampleTests : XCTestCase

@end

@implementation ShortcutSDKExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
