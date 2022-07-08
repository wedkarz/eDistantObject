#ifdef SWIFT_PACKAGE
#import "EDOChannelErrors.h"
#else
#import "Channel/Sources/EDOChannelErrors.h"
#endif

NSString *const EDOChannelErrorDomain = @"com.google.edo.channel";

NSErrorUserInfoKey const EDOChannelPortKey = @"EDOErrorChannelPort";
