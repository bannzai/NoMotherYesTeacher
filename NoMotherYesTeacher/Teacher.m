//
//  Teacher.m
//  NoMotherYesTeacher
//
//  Created by Yudai.Hirose on 2019/07/02.
//  Copyright © 2019 bannzai. All rights reserved.
//

#import "Teacher.h"
#import <objc/runtime.h>

@implementation Teacher

- (void)teacher {
    NSLog(@"Hi");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if ([NSStringFromSelector(sel) isEqualToString:@"mother"]) {
        class_addMethod([self class], sel, (IMP)instanceMethod, "v@:");
    }

    return YES;
}
void instanceMethod(id self, SEL _cmd) {
    NSLog(@"Mother って呼ばれちゃった。。。(///ω///)");
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    return [super methodSignatureForSelector:aSelector];
}

@end
