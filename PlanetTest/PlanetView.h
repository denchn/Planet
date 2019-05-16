//
//  PlanetView.h
//  PlanetTest
//
//  Created by 乔丹 on 2019/3/28.
//  Copyright © 2019 乔丹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PlanetView : UIView
@property (nonatomic, assign) double m;//质量
@property (nonatomic, assign) double vx;//速度
@property (nonatomic, assign) double vy;//速度
@property (nonatomic, assign) double fx;//受力
@property (nonatomic, assign) double fy;//受力
@property (nonatomic, weak) NSArray *array;
- (void)startMove;
- (void)stopMove;

@end

NS_ASSUME_NONNULL_END
