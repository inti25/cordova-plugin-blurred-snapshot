//
//  UIView+blur.h
//  blurTest
//
//  Created by Muukii on 9/28/13.
//  Copyright (c) 2013 Muukii. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (blur)

/**
 * Snapshot of current UIView with burred effect
 */
-(UIImage *)blurredSnapshot;

/**
 * Add Snapshot of current UIView with burred effect for window
 */
-(void)addBlurredSnapshot;

/**
 * Remove Snapshot of current UIView with burred effect for window
 */
-(void)removeBlurredSnapshot;
@end
