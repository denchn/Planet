//
//  ViewController.m
//  PlanetTest
//
//  Created by 乔丹 on 2019/3/21.
//  Copyright © 2019 乔丹. All rights reserved.
//

#import "ViewController.h"
#import "PlanetView.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self resetFrame];
    
    
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.frame = CGRectMake(50, kScreenHeight-60, 40, 30);
    [startBtn setTitle:@"开始" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    endBtn.frame = CGRectMake(startBtn.frame.origin.x+40, kScreenHeight-60, 40, 30);
    [endBtn setTitle:@"结束" forState:UIControlStateNormal];
    [endBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [endBtn addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:endBtn];
    
}

- (void)resetFrame {
    NSInteger v = 200;
    self.array = [NSMutableArray array];
    PlanetView *planet1 = [[PlanetView alloc] initWithFrame:CGRectMake(200, 200, 10, 10)];
    planet1.vx = v;
    planet1.vy = 0;
    planet1.m = 10;
    planet1.backgroundColor = [UIColor blackColor];
    [self.array addObject:planet1];
    [self.view addSubview:planet1];
    
//    PlanetView *planet2 = [[PlanetView alloc] initWithFrame:CGRectMake(200, 200, 20, 20)];
//    planet2.vx = 0;
//    planet2.vy = 0;
//    planet2.m = 10000;
//    planet2.backgroundColor = [UIColor redColor];
//    [self.array addObject:planet2];
//    [self.view addSubview:planet2];
    
//    PlanetView *planet3 = [[PlanetView alloc] initWithFrame:CGRectMake(200, 300, 20, 20)];
//    planet3.vx = -v;
//    planet3.vy = 0;
//    planet3.m = 1000;
//    planet3.backgroundColor = [UIColor blackColor];
//    [self.array addObject:planet3];
//    [self.view addSubview:planet3];
    
        PlanetView *planetC = [[PlanetView alloc] initWithFrame:CGRectMake(200, 300, 20, 20)];
        planetC.vx = 0;
        planetC.vy = 0;
        planetC.m = 15000;
        planetC.backgroundColor = [UIColor redColor];

        [self.array addObject:planetC];
        [self.view addSubview:planetC];
    
    for (PlanetView *planet in self.array) {
        planet.array = self.array;
    }
}

- (void)startAction:(UIButton *)sender {
    for (PlanetView *planet in self.array) {
        [planet startMove];
    }
}
- (void)endAction:(UIButton *)sender {
    for (PlanetView *planet in self.array) {
        [planet removeFromSuperview];
    }
    [self.array removeAllObjects];
    
    [self resetFrame];

}

@end
