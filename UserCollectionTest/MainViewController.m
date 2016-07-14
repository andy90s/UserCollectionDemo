//
//  MainViewController.m
//  UserCollectionDemo
//
//  Created by liangbing on 16/7/12.
//  Copyright © 2016年 liangxianhua. All rights reserved.
//

#import "MainViewController.h"
#import "UserModel.h"
#import "UserRecord.h"
#import "SecViewController.h"
#import "UserDataManager.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *myTableView;
@property (nonatomic,strong) NSMutableArray  *dataArr;
@property (nonatomic,strong) NSArray *sortedArray;

@end

@implementation MainViewController

-(instancetype)init
{
    if (self = [super init]) {
        self = [[UIStoryboard storyboardWithName:@"MyStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"MainViewController"];
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self createData];
    [self sortData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareForUI];
    
}

-(void)prepareForUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"CoreDataDemo";
    [self.view addSubview:self.myTableView];
}

-(void)createData
{
    //testData
    [self.dataArr removeAllObjects];
    for (int i = 0; i < 10; i ++) {
        UserModel *model = [UserModel new];
        model.deviceId = [NSString stringWithFormat:@"%d",i*10 + 1000];
        model.operationCount = [[UserDataManager sharedUserDataManager] getCountWithDeviceID:[NSString stringWithFormat:@"%d",i*10 + 1000]];
        [self.dataArr addObject:model];
    }
}
//排序 从大到小依次...
-(void)sortData
{
    self.sortedArray = [self.dataArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        UserModel *model1 = obj1;
        UserModel *model2 = obj2;
        if (model1.operationCount < model2.operationCount) {
            return NSOrderedDescending;//将序
        }
        else if (model1.operationCount > model2.operationCount)
        {
            return NSOrderedAscending;//升序
        }
        else
        {
            return NSOrderedSame;//相当
        }
    }];
    [self.myTableView reloadData];
    
    //NSLog(@"====>%@",self.sortedArray);
}

#pragma mark -
#pragma mark - lazy

-(NSArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSArray *)sortedArray
{
    if (!_sortedArray) {
        _sortedArray = [NSMutableArray new];
    }
    return _sortedArray;
}

-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,APPW, APPH) style:UITableViewStylePlain];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"myCell"];
    }
    return _myTableView;
}



#pragma mark -
#pragma mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sortedArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    UserModel *model = self.sortedArray[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"设备号:%@---操作次数%ld",model.deviceId,model.operationCount];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

//点击一次记录一次
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserModel *model = self.sortedArray[indexPath.row];
    [[UserDataManager sharedUserDataManager] updateDataWithDeviceID:model.deviceId];
    SecViewController *sec = [SecViewController new];
    [self.navigationController pushViewController:sec animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
