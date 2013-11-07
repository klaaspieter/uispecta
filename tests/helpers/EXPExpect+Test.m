#import "EXPExpect+Test.h"
#import "FakeTestCase.h"

@implementation EXPExpect (Test)

- (EXPExpect *)test {
  self.testCase = [[FakeTestCase alloc] init];
  return self;
}

@end
