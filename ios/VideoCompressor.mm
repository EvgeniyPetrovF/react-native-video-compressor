#import "VideoCompressor.h"

@interface RCT_EXTERN_MODULE(VideoCompressor, NSObject)

+ (BOOL)requiresMainQueueSetup
{
   return NO;
}

RCT_EXTERN_METHOD(compressVideo
              :                 (NSURL)                     inputURL
              withResolver:     (RCTPromiseResolveBlock)    resolve
              withRejecter:     (RCTPromiseRejectBlock)     reject
              )

#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeVideoCompressorSpecJSI>(params);
}
#endif

@end
