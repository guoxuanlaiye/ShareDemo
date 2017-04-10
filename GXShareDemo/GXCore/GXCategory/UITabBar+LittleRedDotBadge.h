//
//  UITabBar+LittleRedDotBadge.h
//  RememberTime
//
//  Created by yingcan on 16/10/10.
//  Copyright © 2016年 yingcan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (LittleRedDotBadge)
- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;

@end
