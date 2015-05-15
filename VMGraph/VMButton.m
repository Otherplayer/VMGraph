//
//  VMButton.m
//  JRPlot
//
//  Created by __无邪_ on 15/3/16.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "VMButton.h"

static float pressInterval = 0.1;

@interface VMButton ()
@property (nonatomic, strong)NSTimer *startTimer;
@end

@implementation VMButton


- (instancetype)init{
    self = [super init];
    if (self) {
        UILongPressGestureRecognizer *longPressGecongnizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPressGecongnizer.minimumPressDuration = 0.5;
        [longPressGecongnizer setAllowableMovement:0];
        [self addGestureRecognizer:longPressGecongnizer];
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPress)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILongPressGestureRecognizer *longPressGecongnizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        longPressGecongnizer.minimumPressDuration = 0.5;
        [longPressGecongnizer setAllowableMovement:0];
        [self addGestureRecognizer:longPressGecongnizer];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(longPress)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer{
    
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
        NSLog(@"long press begin");
        if (self.startTimer) {
            [self.startTimer invalidate];
            self.startTimer = nil;
        }
        
        self.startTimer = [NSTimer scheduledTimerWithTimeInterval:pressInterval target:self selector:@selector(longPress) userInfo:nil repeats:YES];
        [self.startTimer fire];
    }
    else if(gestureRecognizer.state == UIGestureRecognizerStateEnded){
        NSLog(@"long press end");
        if (self.startTimer) {
            [self.startTimer invalidate];
            self.startTimer = nil;
        }
    }
    else if(gestureRecognizer.state == UIGestureRecognizerStateChanged){
    }
    
}

- (void)longPress{
    if (self.longPressAction) {
        self.longPressAction();
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
