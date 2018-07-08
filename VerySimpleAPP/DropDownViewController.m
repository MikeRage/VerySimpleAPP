//
//  DropDownViewController.m
//  VerySimpleAPP
//
//  Created by Белецкий Михаил Александрович on 07.07.18.
//  Copyright © 2018 Белецкий Михаил Александрович. All rights reserved.
//

#import "DropDownViewController.h"
#import "Values.h"
#import "SinModel.h"

@interface DropDownViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *dropDownTable1;
@property (weak, nonatomic) IBOutlet UIButton *buttonDropDown;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *dropDown1_Height;
@property (weak, nonatomic) IBOutlet UIView *dropDownView;
@property (weak, nonatomic) IBOutlet UILabel *sinText;

@property (nonatomic, strong) NSArray *data;
@end

@implementation DropDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setup
{
    [self setupView];
    [self fillData];
}

-(void) setupView
{
    _dropDownView.layer.masksToBounds = NO;
    _dropDownView.layer.shadowOffset = CGSizeMake(-3, 3);
    _dropDownView.layer.shadowRadius = 2;
    _dropDownView.layer.shadowOpacity = 0.5;
    _dropDown1_Height.constant = 0;
    
    _buttonDropDown.titleLabel.numberOfLines = 0;
    _buttonDropDown.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//    [_buttonDropDown setUserInteractionEnabled:NO];
    
}

-(void) fillData
{
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[Values getData] options:0 error:nil];
    NSMutableArray *array = [NSMutableArray new];
    for(NSDictionary *sinDict in dict[@"sins"])
    {
        SinModel *sin = [[SinModel alloc] initWithDictionary:sinDict];
        [array addObject:sin];
    }
    _data = array;
    [_dropDownTable1 reloadData];
}

#pragma mark - Button actions

- (IBAction)ToggleDropDown:(id)sender {
    [UIView transitionWithView:_dropDownTable1 duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _dropDownTable1.hidden = !_dropDownTable1.hidden;
        if(!_dropDownTable1.hidden)
           _dropDown1_Height.constant = 250;
        else
           _dropDown1_Height.constant = 0;
        
    } completion:nil];
    [self.view layoutIfNeeded];
}



#pragma mark - TableView operations

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(tableView == _dropDownTable1)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        SinModel *sin = _data[indexPath.row];
        cell.textLabel.text = sin.title;
        return cell;
    }
    
    return [[UITableViewCell alloc] init];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_data count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == _dropDownTable1)
    {
        SinModel *sin = _data[indexPath.row];
        [_buttonDropDown setTitle:[NSString stringWithFormat:@"%@ (%@)",[Values getButtonDropDownTitle],sin.title] forState:UIControlStateNormal] ;
        [self ToggleDropDown:nil];
        _sinText.text = sin.text;
    }
}


@end
