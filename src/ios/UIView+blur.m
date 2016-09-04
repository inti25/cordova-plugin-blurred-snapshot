//
//  UIView+blur.m
//  blurTest
//
//  Created by Muukii on 9/28/13.
//  Copyright (c) 2013 Muukii. All rights reserved.
//
#import "UIView+blur.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageEffects.h"

/**
 * Tag of blurred UIView
 */
static int BLUR_VIEW_TAG = 1234;

@implementation UIView (blur)

/**
 * Snapshot of current UIView with burred effect
 */
-(UIImage *)blurredSnapshot {
    UIImage *blurredSnapshotImage;
    // Configure on your demand
    UIColor *tintColor = [UIColor colorWithWhite:1.0 alpha:0.7];

    if ([UIDevice currentDevice].systemVersion.floatValue < 7.0) {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        // Configure on your demand
        blurredSnapshotImage = [snapshotImage applyBlurWithRadius:4.0 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
        UIGraphicsEndImageContext();
    } else {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        // Configure on your demand
        blurredSnapshotImage = [snapshotImage applyBlurWithRadius:4.0 tintColor:tintColor saturationDeltaFactor:1.8 maskImage:nil];
        UIGraphicsEndImageContext();
    }
    return blurredSnapshotImage;
}

/**
 * Add Snapshot of current UIView with burred effect for window
 */
-(void)addBlurredSnapshot {
    UIView *currentSnapshot = [self viewWithTag:BLUR_VIEW_TAG];
    if (currentSnapshot) {
        return;
    }
    UIImageView *blurredSnapshot = [[UIImageView alloc] initWithImage:[self blurredSnapshot]];
    blurredSnapshot.tag = BLUR_VIEW_TAG;
    blurredSnapshot.bounds = self.bounds;
    [self addSubview:blurredSnapshot];
}

/**
 * Remove Snapshot of current UIView with burred effect for window
 */
-(void)removeBlurredSnapshot {
    UIView *blurredSnapshot = [self viewWithTag:BLUR_VIEW_TAG];
    if (!blurredSnapshot) {
        return;
    }
    [UIView animateWithDuration:0.5 animations:^{
        blurredSnapshot.alpha = 0;
    } completion:^(BOOL finished) {
        [blurredSnapshot removeFromSuperview];
    }];
}
@end
