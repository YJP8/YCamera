//
//  YCamera.h
//  LifeService-Ass
//
//  Created by Levante on 2019/9/19.
//  Copyright © 2019 FansLift. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YCamera : NSObject

+ (instancetype)sharedManager;

/// 相机拍照
/// @param allowEditing 是否裁剪
- (void)startPhotoWithAllowEditing:(BOOL)allowEditing;

/// 相册选择
/// @param allowEditing 是否裁剪
- (void)startPhotoLibraryWithAllowEditing:(BOOL)allowEditing;

@property (nonatomic, copy) void(^FinishedBlock)(UIImage *image);

/**
 是否裁剪
 */
@property (nonatomic, assign) BOOL allowsEditing;

@end

NS_ASSUME_NONNULL_END
