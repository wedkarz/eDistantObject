//
// Copyright 2019 Google LLC.
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

#ifdef SWIFT_PACKAGE
#import "EDOServiceException.h"
#else
#import "Service/Sources/EDOServiceException.h"
#endif

NSExceptionName const EDOServiceGenericException = @"EDOServiceGenericException";
NSExceptionName const EDOServiceAllocValueTypeException = @"EDOServiceAllocValueTypeException";
NSExceptionName const EDOWeakObjectRemoteWeakMisuseException =
    @"EDOWeakObjectRemoteWeakMisuseException";
NSExceptionName const EDOWeakObjectWeakReleaseException = @"EDOWeakReleasedException";
NSExceptionName const EDOWeakReferenceBlockObjectException =
    @"EDOWeakReferenceBlockObjectException";
NSExceptionName const EDOParameterTypeException = @"EDOParameterTypeException";

NSString *const EDOExceptionUnderlyingErrorKey = @"EDOUnderlyingErrorKey";
NSString *const EDOExceptionPortKey = @"EDOExceptionPortKey";