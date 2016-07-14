//
//  SecViewController.m
//  UserCollectionDemo
//
//  Created by liangbing on 16/7/13.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

- (IBAction)backClick:(UIButton *)sender;

@end

@implementation SecViewController

-(instancetype)init
{
    if (self = [super init]) {
        self = [[UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"SecViewController"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二级页面";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
