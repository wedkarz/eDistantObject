//
// Copyright 2018 Google Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#include <objc/runtime.h>

#ifdef SWIFT_PACKAGE
#import "NSObject+EDOParameter.h"
#import "EDOHostService+Private.h"
#import "EDOHostService.h"
#import "EDOParameter.h"
#import "EDOProtocolObject.h"
#import "NSObject+EDOValue.h"
#else
#import "Service/Sources/NSObject+EDOParameter.h"
#import "Service/Sources/EDOHostService+Private.h"
#import "Service/Sources/EDOHostService.h"
#import "Service/Sources/EDOParameter.h"
#import "Service/Sources/EDOProtocolObject.h"
#import "Service/Sources/NSObject+EDOValue.h"
#endif

// Create a static original implementation of [NSObject -edo_parameterForTarget:service:hostPort:].
static IMP GetEDOOriginalParameterForTarget() {
  static IMP originalImplementation;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    SEL originalSelector = @selector(edo_parameterForTarget:service:hostPort:);
    Method originalMethod = class_getInstanceMethod([NSObject class], originalSelector);
    originalImplementation = method_getImplementation(originalMethod);
  });
  return originalImplementation;
}

@implementation NSObject (EDOParameter)

+ (IMP)EDOOriginalParameterForTarget {
  return GetEDOOriginalParameterForTarget();
}

- (EDOParameter *)edo_parameterForTarget:(EDOObject *)target
                                 service:(EDOHostService *)service
                                hostPort:(EDOHostPort *)hostPort {
  id boxedObject = self;

  if ([EDOProtocolObject isProtocol:boxedObject]) {
    boxedObject = [[EDOProtocolObject alloc] initWithProtocol:boxedObject];
  } else if (![boxedObject edo_isEDOValueType]) {
    // TODO(haowoo): Add the proper handler.
    NSAssert(service, @"The service isn't set up to create the remote object.");

    // Wrap it with EDOObject from the service associated with the execution queue.
    boxedObject = [service distantObjectForLocalObject:self hostPort:hostPort];
  }
  return [EDOParameter parameterWithObject:boxedObject];
}

@end
