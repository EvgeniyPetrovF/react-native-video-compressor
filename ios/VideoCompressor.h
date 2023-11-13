
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNVideoCompressorSpec.h"

@interface VideoCompressor : NSObject <NativeVideoCompressorSpec>
#else
#import <React/RCTBridgeModule.h>

@interface VideoCompressor : NSObject <RCTBridgeModule>
#endif

@end
