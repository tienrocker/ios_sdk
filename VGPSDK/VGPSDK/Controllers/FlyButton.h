//
//  FlyButton.h
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlyButton : UIButton
 {
    BOOL isMoveLittle;
    CGPoint beginpoint;
    CGPoint endpoint;
}

+ (FlyButton *)sharedInstance;

- (void)reFrame;
- (void)showButton;
- (void)hideButton;

@end

NS_ASSUME_NONNULL_END
