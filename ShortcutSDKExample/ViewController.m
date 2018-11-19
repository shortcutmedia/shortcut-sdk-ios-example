//
//  ViewController.m
//  ShortcutSDKExample
//
//  Created by Vladislav Jevremovic on 11/19/18.
//  Copyright (c) 2018 Shortcut Media AG. All rights reserved.
//

#import "ViewController.h"

#import <ShortcutSDK/ShortcutSDK.h>

@interface ViewController () <AVCaptureVideoDataOutputSampleBufferDelegate, SCMLiveScannerDelegate>

@property (nonatomic, strong, readwrite) SCMCaptureSessionController *captureSessionController;
@property (nonatomic, strong, readwrite) SCMLiveScanner *liveScanner;
@property (nonatomic, strong, readwrite) IBOutlet SCMPreviewView *cameraLiveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationWillResignActive:)
                                                 name:UIApplicationWillResignActiveNotification
                                               object:nil];
    
    [self setupCaptureSessionController];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.captureSessionController startSession];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        // delay creating live scanner a bit, otherwise a slowdown can occur
        [self setupLiveScanner];
    });
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self activateScanners];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self deactivateScanners];
    [self.captureSessionController stopSession];
    
    [super viewDidDisappear:animated];
}

- (void)dealloc {
    [self deactivateScanners];

    [self.captureSessionController stopSession];
    self.captureSessionController = nil;
    
    self.liveScanner.delegate = nil;
    self.liveScanner = nil;
    
    @try {
        [[NSNotificationCenter defaultCenter] removeObserver:self];
    } @catch (NSException *exception) {}
}

#pragma mark - Observers

- (void)applicationDidBecomeActive:(NSNotification *)notification {
    [self.captureSessionController startSession];
}

- (void)applicationWillResignActive:(NSNotification *)notification {
    [self.captureSessionController stopSession];
}

#pragma mark - Internal

- (void)setupCaptureSessionController {
    self.captureSessionController = [[SCMCaptureSessionController alloc] initWithMode:kSCMCaptureSessionLiveScanningMode
                                                                 sampleBufferDelegate:self];
    self.captureSessionController.previewLayer = self.cameraLiveView.videoPreviewLayer;
    self.cameraLiveView.session = self.captureSessionController.captureSession;
    [self.captureSessionController startSession];
}

- (void)setupLiveScanner {
    self.liveScanner.captureDevice = self.captureSessionController.captureDevice;
    [self.liveScanner setupForMode:kSCMLiveScannerLiveScanningMode];
    [self.liveScanner startScanning];
}

#pragma mark - Live Scanner

- (SCMLiveScanner *)liveScanner {
    if (!_liveScanner) {
        _liveScanner = [SCMLiveScanner new];
        _liveScanner.delegate = self;
        _liveScanner.scanQRCodes = YES;
    }
    return _liveScanner;
}

- (void)deactivateScanners {
    self.liveScanner.paused = true;
}

- (void)activateScanners {
    self.liveScanner.paused = false;
}

#pragma mark - Capture Output Delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    [self.captureSessionController adjustCaptureConnectionVideoOrientation:connection];
    
    if (!CMSampleBufferIsValid(sampleBuffer)) {
        return;
    }
    
    [self.liveScanner processSampleBuffer:sampleBuffer];
}

#pragma mark - SCMLiveScannerDelegate

- (void)liveScanner:(SCMLiveScanner *)scanner recognizingImage:(NSData *)imageData {
    NSLog(@"recognizingImage");
}

- (void)liveScanner:(SCMLiveScanner *)scanner didNotRecognizeImage:(NSData *)imageData {
    NSLog(@"didNotRecognizeImage");
}

- (void)liveScanner:(SCMLiveScanner *)scanner recognizedImage:(NSData *)imageData atLocation:(CLLocation *)location withResponse:(SCMQueryResponse *)response {
    NSLog(@"recognizedImage");
    
    [self deactivateScanners];
    // ... process here
    [self activateScanners];
}

- (void)liveScanner:(SCMLiveScanner *)scanner recognizedQRCode:(NSString *)text atLocation:(CLLocation *)location {
    NSLog(@"recognizedQRCode");
    
    [self deactivateScanners];
    // ... process here
    [self activateScanners];
}

- (void)liveScanner:(SCMLiveScanner *)scanner capturedSingleImageWhileOffline:(NSData *)imageData atLocation:(CLLocation *)location {
    //
}

- (void)liveScannerShouldClose:(SCMLiveScanner *)scanner {
    //
}

- (void)liveScanner:(SCMLiveScanner *)scanner didRequestPictureTakeWithCompletionHandler:(void (^)(NSData *data, NSError *error))completionHandler {
    //
}

@end
