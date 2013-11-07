#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#define EXP_SHORTHAND
#import "Expecta.h"
#import "FakeTestCase.h"
#import "EXPExpect+Test.h"

#import <XCTest/XCTest.h>
#define TEST_SUPERCLASS XCTestCase

#define assertPass(expr) \
XCTAssertNoThrow((expr))

#define assertFail(expr, message...) \
XCTAssertThrowsSpecificNamed(expr, NSException, ## message)

#define assertEquals(a, b) XCTAssertEqual((a), (b))
#define assertEqualObjects(a, b) XCTAssertEqualObjects((a), (b))
#define assertTrue(a) XCTAssertTrue((a))
#define assertFalse(a) XCTAssertFalse((a))
#define assertNil(a) XCTAssertNil((a))

#define test_expect(a) [expect(a) test]