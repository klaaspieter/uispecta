#import <objc/runtime.h>

#import "EXPExpect+Test.h"
#import "FakeTestCase.h"

@interface EXPExpect ()
@property (nonatomic, readwrite, strong) FakeTestCase *fakeTestCase;
@end

static char fakeTestCaseKey;

@implementation EXPExpect (Test)

- (EXPExpect *)test {
  self.fakeTestCase = [[FakeTestCase alloc] init];;
  self.testCase = self.fakeTestCase;
  return self;
}

- (FakeTestCase *)fakeTestCase;
{
  return objc_getAssociatedObject(self, &fakeTestCaseKey);
}

- (void)setFakeTestCase:(FakeTestCase *)fakeTestCase;
{
  objc_setAssociatedObject(self, &fakeTestCaseKey, fakeTestCase, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
