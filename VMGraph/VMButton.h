//
//  VMButton.h
//  JRPlot
//
//  Created by __无邪_ on 15/3/16.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>


/*
 长按时可重复执行action
*/


@interface VMButton : UIButton
@property (nonatomic, strong) void(^longPressAction)();
@end
