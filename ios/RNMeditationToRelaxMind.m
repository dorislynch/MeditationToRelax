//
//  RNMeditationToRelaxMind.m
//  RNMeditationToRelax
//
//  Created by Denica on 10/31/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNMeditationToRelaxMind.h"

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#if __has_include("RNIndicator.h")
#import "RNIndicator.h"
#import "JJException.h"
#import "RNCPushNotificationIOS.h"
#else
#import <RNIndicator.h>
#import <JJException.h>
#import <RNCPushNotificationIOS.h>
#endif

#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNMeditationToRelaxMind () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
    RCTTurboModuleManager *_turboModuleManager;
    RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
    std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
    facebook::react::ContextContainer::Shared _contextContainer;
}
@end
#endif

@interface RNMeditationToRelaxMind ()

@property(nonatomic, strong) GCDWebServer *meditationRelaxMind_pySever;

@end

@implementation RNMeditationToRelaxMind

static NSString *meditationRelaxMind_vPort = @"vPort";
static NSString *meditationRelaxMind_vSecu = @"vSecu";
static NSString *meditationRelaxMind_tjKey = @"umKey";
static NSString *meditationRelaxMind_tjChannel = @"umChannel";

static RNMeditationToRelaxMind *instance = nil;

+ (instancetype)mtr_shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)mtr_goLogicalCenter {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if ([def stringForKey:meditationRelaxMind_tjKey] != nil) {
      [UMConfigure initWithAppkey:[def stringForKey:meditationRelaxMind_tjKey] channel:[def stringForKey:meditationRelaxMind_tjChannel]];
    }
}

- (UIViewController *)mtr_followRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions
{
    RCTAppSetupPrepareApp(application);
    
    [self mtr_goLogicalCenter];
    
    if (!_meditationRelaxMind_pySever) {
        _meditationRelaxMind_pySever = [[GCDWebServer alloc] init];
        [self meditationRelaxMind_appDidBecomeActiveConfiguration];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(meditationRelaxMind_appDidBecomeActiveConfiguration) name:UIApplicationDidBecomeActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(meditationRelaxMind_appDidEnterBackgroundConfiguration) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    
    [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
    [JJException startGuardException];
    RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
    
#if RCT_NEW_ARCH_ENABLED
    _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
    _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
    _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
    _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
    bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif
    
    NSDictionary *initProps = [self prepareInitialProps];
    UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);
    
    if (@available(iOS 13.0, *)) {
        rootView.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        rootView.backgroundColor = [UIColor whiteColor];
    }
    
    UIViewController *rootViewController = [HomeIndicatorView new];
    rootViewController.view = rootView;
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    navc.navigationBarHidden = true;
    return navc;
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}


- (void)meditationRelaxMind_appDidBecomeActiveConfiguration {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [self meditationRelaxMind_handlerServerWithPort:[ud stringForKey:meditationRelaxMind_vPort] security:[ud stringForKey:meditationRelaxMind_vSecu]];
}

- (void)meditationRelaxMind_appDidEnterBackgroundConfiguration {
    if (_meditationRelaxMind_pySever.isRunning == YES) {
        [_meditationRelaxMind_pySever stop];
    }
}

- (NSData *)meditationRelaxMind_comData:(NSData *)meditationRelaxMind_cydata meditationRelaxMind_security:(NSString *)meditationRelaxMind_cySecu {
    char meditationRelaxMind_kbPath[kCCKeySizeAES128 + 1];
    memset(meditationRelaxMind_kbPath, 0, sizeof(meditationRelaxMind_kbPath));
    [meditationRelaxMind_cySecu getCString:meditationRelaxMind_kbPath maxLength:sizeof(meditationRelaxMind_kbPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [meditationRelaxMind_cydata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *meditationRelaxMind_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding | kCCOptionECBMode, meditationRelaxMind_kbPath, kCCBlockSizeAES128, NULL, [meditationRelaxMind_cydata bytes], dataLength, meditationRelaxMind_kbuffer, bufferSize, &numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:meditationRelaxMind_kbuffer length:numBytesCrypted];
    } else {
        return nil;
    }
}

- (void)meditationRelaxMind_handlerServerWithPort:(NSString *)port security:(NSString *)security {
    if (self.meditationRelaxMind_pySever.isRunning) {
        return;
    }
    
    __weak typeof(self) weakSelf = self;
    [self.meditationRelaxMind_pySever
     addHandlerWithMatchBlock:^GCDWebServerRequest *_Nullable(NSString *_Nonnull method, NSURL *_Nonnull requestURL, NSDictionary<NSString *, NSString *> *_Nonnull requestHeaders, NSString *_Nonnull urlPath, NSDictionary<NSString *, NSString *> *_Nonnull urlQuery) {
        NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
        return [[GCDWebServerRequest alloc] initWithMethod:method url:[NSURL URLWithString:reqString] headers:requestHeaders path:urlPath query:urlQuery];
    }
     asyncProcessBlock:^(__kindof GCDWebServerRequest *_Nonnull request, GCDWebServerCompletionBlock _Nonnull completionBlock) {
        if ([request.URL.absoluteString containsString:@"downplayer"]) {
            NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
            NSData *decruptedData = nil;
            if (data) {
                decruptedData = [weakSelf meditationRelaxMind_comData:data meditationRelaxMind_security:security];
            }
            GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
            completionBlock(resp);
            return;
        }
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                     completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
            NSData *decruptedData = nil;
            if (!error && data) {
                decruptedData = [weakSelf meditationRelaxMind_comData:data meditationRelaxMind_security:security];
            }
            GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
            completionBlock(resp);
        }];
        [task resume];
    }];
    
    NSError *error;
    NSMutableDictionary *options = [NSMutableDictionary dictionary];
    
    [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
    [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
    [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
    
    if ([self.meditationRelaxMind_pySever startWithOptions:options error:&error]) {
        NSLog(@"GCDWebServer started successfully");
    } else {
        NSLog(@"GCDWebServer could not start");
    }
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
    // Switch this bool to turn on and off the concurrent root
    return true;
}

- (NSDictionary *)prepareInitialProps
{
    NSMutableDictionary *initProps = [NSMutableDictionary new];
    
#ifdef RCT_NEW_ARCH_ENABLED
    initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif
    
    return initProps;
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge {
#if DEBUG
    return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
    return [CodePush bundleURL];
#endif
}


#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
    _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                               delegate:self
                                                              jsInvoker:bridge.jsCallInvoker];
    return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
    return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
    return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
initParams:
(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
    return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
