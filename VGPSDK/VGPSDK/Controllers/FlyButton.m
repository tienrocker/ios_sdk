//
//  FlyButton.m
//  VGPSDK
//
//  Created by  Tien Tran on 2/6/20.
//  Copyright © 2020  Tien Tran. All rights reserved.
//

#import "FlyButton.h"
#import "VGPHelper.h"
#import "VGPUI.h"
#import "VGPAPI.h"
#import "VGPUserData.h"
#import "VGPInterface.h"

#define DELTA  8
static CGFloat WH_BUTTON = 30;
static CGFloat MARGIN_LEFT = 0;
static CGFloat MARGIN_TOP = 0;
static CGFloat MARGIN_RIGHT = 0;
static CGFloat MARGIN_BOTTOM = 0;

@interface FlyButton ()

@end

@implementation FlyButton


static FlyButton *sharedController = nil;
+ (FlyButton *)sharedInstance {
    if (!sharedController) {
        sharedController = [FlyButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) WH_BUTTON = WH_BUTTON * 2;
        [sharedController createButton];
    }
    
    return sharedController;
}

- (void)createButton {
    MARGIN_LEFT = [VGPHelper getScreenWidth] * .03 + WH_BUTTON / 2; // 3%
    MARGIN_TOP = [VGPHelper getScreenHeight] * .03 + WH_BUTTON / 2;
    MARGIN_RIGHT = [VGPHelper getScreenWidth] - [VGPHelper getScreenWidth] * .03 - WH_BUTTON * 3 / 2;
    MARGIN_BOTTOM = [VGPHelper getScreenHeight] - [VGPHelper getScreenHeight] * .03 - WH_BUTTON * 3 / 2;
    
    self.show = NO;
    
    MoveEnable = YES;
    self.frame = [self convertRectWith:CGRectMake(MARGIN_LEFT, [VGPHelper getScreenHeight] / 2 - WH_BUTTON / 2, WH_BUTTON, WH_BUTTON)];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        if(([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)
           || ([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
            if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)) {
                self.transform = CGAffineTransformMakeRotation(-M_PI/2);
            } else {
                self.transform = CGAffineTransformMakeRotation(M_PI/2);
            }
        }
    }
    
    [self initFrameIfNeed];
    [self setBackgroundImage:[VGPHelper getUIImageWithImageName:@"btn-float" andType:nil] forState:UIControlStateNormal];
    //self.backgroundColor = [UIColor blueColor];
    self.layer.zPosition = 100;
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    [self addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
}

- (void)removeButton {
    if (self != nil) {
        [self removeFromSuperview];
    }
}

- (void)initFrameIfNeed {
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        if(([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)||([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
            if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)) {
                self.frame = CGRectMake(0, [VGPHelper getScreenHeight] * 0.9, WH_BUTTON, WH_BUTTON);
            } else {
                self.frame = CGRectMake([VGPHelper getScreenWidth] * 0.9, 0, WH_BUTTON, WH_BUTTON);
            }
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    MoveEnabled = NO;
    isMoveLittle = NO;
    self.alpha = 1;
    
    [super touchesBegan:touches withEvent:event];
    if (!MoveEnable) return;
    
    UITouch *touch = [touches anyObject];
    beginpoint = [touch locationInView:self];
    
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        if(([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)||([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
            if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)) {
                beginpoint = CGPointMake(beginpoint.y, [VGPHelper getScreenWidth] - beginpoint.x);
            } else {
                beginpoint = CGPointMake([VGPHelper getScreenHeight] -beginpoint.y, beginpoint.x);
            }
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.alpha = 1;
    MoveEnabled = YES;
    
    if (!MoveEnable) return;
    
    UITouch *touch = [touches anyObject];
    CGPoint currentPosition = [touch locationInView:self];
    if ([[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        if(([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)||([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeRight)) {
            if (([[UIApplication sharedApplication] statusBarOrientation] == UIInterfaceOrientationLandscapeLeft)) {
                currentPosition = CGPointMake(currentPosition.y, [VGPHelper getScreenWidth] - currentPosition.x);
            } else {
                currentPosition = CGPointMake([VGPHelper getScreenHeight] -currentPosition.y, currentPosition.x);
            }
        }
    }
    
    float offsetX = currentPosition.x - beginpoint.x;
    float offsetY = currentPosition.y - beginpoint.y;
    self.center = CGPointMake(self.center.x + offsetX, self.center.y + offsetY);
    
    if (self.center.x > (self.superview.frame.size.width-self.frame.size.width/2)) {
        CGFloat x = self.superview.frame.size.width-self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
    } else if (self.center.x < self.frame.size.width/2) {
        CGFloat x = self.frame.size.width/2;
        self.center = CGPointMake(x, self.center.y + offsetY);
    }
    
    if (self.center.y > (self.superview.frame.size.height-self.frame.size.height/2)) {
        CGFloat x = self.center.x;
        CGFloat y = self.superview.frame.size.height-self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    } else if (self.center.y <= self.frame.size.height/2) {
        CGFloat x = self.center.x;
        CGFloat y = self.frame.size.height/2;
        self.center = CGPointMake(x, y);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!MoveEnable) return;
    UITouch *touch = [touches anyObject];
    endpoint = [touch locationInView:self];
    [self moveButtonWhenEnTouch];
    if ((fabs(endpoint.x - beginpoint.x)<DELTA) && (fabs(endpoint.y - beginpoint.y)<DELTA)) isMoveLittle = YES;
    [super touchesEnded: touches withEvent: event];
    [self performSelector:@selector(alphaButton)  withObject:nil afterDelay:2];
}

- (void)moveButtonWhenEnTouch {
    [UIView beginAnimations:@"move" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    self.frame = [self getFrameButton];
    [UIView commitAnimations];
}

- (CGRect)getFrameButton {
    float xP;
    float yP;
    
    if (self.center.x <= self.superview.frame.size.width/2) {
        if (self.center.y <= self.superview.frame.size.height/2) {
            // MyLog(@"goc 1");
            if (self.center.x <= self.center.y) {
                xP = MARGIN_LEFT;
                yP = self.center.y - WH_BUTTON/2;
            } else {
                xP = self.center.x - WH_BUTTON/2;
                yP = MARGIN_TOP;
            }
            
            if(xP < MARGIN_LEFT) xP = MARGIN_LEFT;
            if(yP < MARGIN_TOP) yP = MARGIN_TOP;
        } else {
            // MyLog(@"goc 3");
            if (self.center.x <= self.superview.frame.size.height -self.center.y ) {
                xP = MARGIN_LEFT;
                yP = self.center.y - WH_BUTTON/2;
            } else {
                xP = self.center.x - WH_BUTTON/2;
                yP = self.superview.frame.size.height - WH_BUTTON;
            }
            
            if(xP < MARGIN_LEFT) xP = MARGIN_LEFT;
            if(yP > MARGIN_BOTTOM) yP = MARGIN_BOTTOM;
        }
    } else {
        if (self.center.y <= self.superview.frame.size.height/2) {
            // MyLog(@"goc 2");
            if (self.superview.frame.size.width -self.center.x  <=self.center.y) {
                xP = self.superview.frame.size.width - WH_BUTTON;
                yP = self.center.y - WH_BUTTON/2;
            } else {
                xP = self.center.x - WH_BUTTON/2;
                yP = MARGIN_TOP;
            }
            
            if(xP > MARGIN_RIGHT) xP = MARGIN_RIGHT;
            if(yP < MARGIN_TOP) yP = MARGIN_TOP;
        } else {
            // MyLog(@"goc 4");
            if (self.superview.frame.size.width - self.center.x < self.superview.frame.size.height - self.center.y) {
                xP = self.superview.frame.size.width - WH_BUTTON;
                yP = self.center.y - WH_BUTTON/2;
            } else {
                xP = self.center.x - WH_BUTTON/2;
                yP = self.superview.frame.size.height - WH_BUTTON;
            }
            
            if(xP > MARGIN_RIGHT) xP = MARGIN_RIGHT;
            if(yP > MARGIN_BOTTOM) yP = MARGIN_BOTTOM;
        }
    }
    
    
    return CGRectMake(xP , yP, WH_BUTTON, WH_BUTTON);
}

- (void)alphaButton {
    if (self.alpha != 0.5) {
        self.alpha = 0.5;
    }
}

- (CGRect)convertRectWith:(CGRect)oRect {
    return oRect;
}

- (void)moveButtonIfNeed {
    if ( [[UIDevice currentDevice].systemVersion floatValue] < 8.0) {
        self.frame = CGRectMake(self.frame.origin.y ,self.frame.origin.x, WH_BUTTON,WH_BUTTON);
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)clickButton {
    if ((!MoveEnabled) || (isMoveLittle)) {
        [self showPopup];
    }
    self.alpha = 1;
    [[VGPInterface sharedInstance] showProfile];
//    /**
//    @TODO: nếu người dùng đã lưu đăng nhập trước đó thì hiện profile view
//    */
//    [VGPAPI tokenLogin:^(id  _Nonnull responseObject) {
//        [[VGPInterface sharedInstance] showProfile];
//    } failure:^(NSError * _Nonnull error) {
//        [[VGPInterface sharedInstance] loginGame];
//    }];
}

- (void)showPopup {
    self.show = YES;
}

- (void)showButton {
    if(self.hidden == YES) {
        MyLog(@"showButton");
        self.hidden = NO;
    }
}

- (void)hideButton {
    if(self.hidden == NO) {
        MyLog(@"hideButton");
        self.hidden = YES;
    }
}

@end
