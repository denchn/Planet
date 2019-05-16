//
//  PlanetView.m
//  PlanetTest
//
//  Created by 乔丹 on 2019/3/28.
//  Copyright © 2019 乔丹. All rights reserved.
//

#import "PlanetView.h"

@interface PlanetView ()
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation PlanetView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.width/2;
        
    }
    return self;
}

- (void)startMove {
    double t = 0.01;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:t repeats:YES block:^(NSTimer * _Nonnull timer) {
        //计算力
        double g = 280;
        BOOL first = YES;
        for (PlanetView *planet in self.array) {
            if (planet != self) {
                if (first) {
                    self.fx = 0;
                    self.fy = 0;
                }
                
                double dx = planet.center.x-self.center.x;
                double dy = planet.center.y-self.center.y;
                double rr= pow(dx, 2) + pow(dy, 2);
                double d = sqrt(rr);
                double f = g*planet.m*self.m/rr;//收到的引力
                double fx = f*dx/d;
                double fy = f*dy/d;
                self.fx += fx;
                self.fy += fy;
                
                first = NO;
            }
        }
        
        
//        NSLog(@"vx:%f vy:%f",self.vx,self.vy);
        //移动位置
        CGRect frame = self.frame;

        CGRect newFrame = CGRectMake(frame.origin.x+self.vx*t, frame.origin.y+self.vy*t, frame.size.width, frame.size.height);
        self.frame = newFrame;
        //计算速度
//        f = ma;
        
        double ax = self.fx/self.m;
        double ay = self.fy/self.m;
        self.vx += (ax*t);
        self.vy += (ay*t);
    }];
}

- (void)stopMove {
    [self.timer invalidate];
    self.timer = nil;
}

@end
