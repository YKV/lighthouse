//
//  ViewController.m
//  AVStorybook
//
//  Created by Yevhen Kim on 2016-07-15.
//  Copyright © 2016 Yevhen Kim. All rights reserved.
//

#import "ViewController.h"

//check for authorization status
@import Photos;
// for AVPlayer
@import AVFoundation;
//for AVPlayerViewController
@import AVKit;

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // if user exits and change the device settings in app then do notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:(returnedFromBackgroundNotification:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [self ]
}

- (void)returnedFromBackgroundNotification:(NSNotification *)notification {
    [self photoLibraryAuthorizationStatus];
    [self cameraAccessAuthorizationStatus];
}

#pragma mark - PhotoLibrary Authorization

- (BOOL)photoLibraryAuthorizationStatus {
    
}

- (BOOL)cameraAccessAuthorizationStatus {
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    switch (authStatus) {
        case PHAuthorizationStatusAuthorized:
            return YES;
        case PHAuthorizationStatusNotDetermined: {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                [self photoLibraryAuthorizationStatus];
            }];
        }
            return NO;
        case PHAuthorizationStatusDenied:
            //if the user pressed on denied
            [self alertMessage:@"This App requires access to Photo Library"];
            return NO;
        case PHAuthorizationStatusRestricted:
            return NO;
        default:
            break;
    }
}

- (void)alertMessage:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Authorization" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //if user click on ok redirect to settings
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:url];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAl handler:<#^(UIAlertAction * _Nonnull action)handler#>]
}


@end
