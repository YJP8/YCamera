//
//  YCamera.m
//  LifeService-Ass
//
//  Created by Levante on 2019/9/19.
//  Copyright © 2019 FansLift. All rights reserved.
//

#import "YCamera.h"

@interface YCamera()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *pickerController;

@end

@implementation YCamera

+ (instancetype)sharedManager {
    
    static YCamera *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)startPhotoWithAllowEditing:(BOOL)allowEditing {
    if([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        
        _pickerController = [[UIImagePickerController alloc]init];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = allowEditing;
        _allowsEditing = allowEditing;
        _pickerController.sourceType =UIImagePickerControllerSourceTypeCamera;
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:_pickerController animated:YES completion:nil];
    }
}

- (void)startPhotoLibraryWithAllowEditing:(BOOL)allowEditing {
    if([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        
        _pickerController = [[UIImagePickerController alloc]init];
        //_pickerController.navigationController.navigationBar.barTintColor = [UIColor y_colorWithHexString:APPBACKGROUNDCOLOR alpha:1.0f];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = allowEditing;
        _allowsEditing = allowEditing;
        _pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:_pickerController animated:YES completion:nil];
    }
}


- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    /// 在这里拿到照片
    //    NSDate
    UIImage *photo;
    if (_allowsEditing) {
        photo = [info objectForKey:UIImagePickerControllerEditedImage];
    }else {
        photo = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    if (self.FinishedBlock) {
        self.FinishedBlock(photo);
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
}



@end
