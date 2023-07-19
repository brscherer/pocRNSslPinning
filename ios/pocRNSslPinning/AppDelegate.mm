#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <TrustKit/TrustKit.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSDictionary *trustKitConfig =
  @{
    kTSKSwizzleNetworkDelegates: @YES,
    kTSKPinnedDomains: @{
        @"sslpinning.com" : @{
            kTSKIncludeSubdomains: @YES,
            kTSKEnforcePinning: @YES,
            kTSKDisableDefaultReportUri: @YES,
            kTSKPublicKeyHashes : @[
              @"<Primary SHA256 key>",
              @"<Backup SHA256 key>",
              @"XVzYYir7lwzFXd7VWMBOsk8ys3YZYDKYiJrDo/5LuTU=" // valid key
              // @"invalidkey=",
            ],
        },
    }};
  [TrustKit initSharedInstanceWithConfiguration:trustKitConfig];
  self.moduleName = @"pocRNSslPinning";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
