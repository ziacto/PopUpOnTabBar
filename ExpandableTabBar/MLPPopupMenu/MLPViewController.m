//
//  MLViewController.m
//  MLPopupMenu
//
//  Created by Javier Figueroa on 4/10/13.
//  Copyright (c) 2013 Mainloop LLC. All rights reserved.
//

#import "MLPViewController.h"
#import "MLPPopupMenu.h"
#import "MLPPopupMenuDataSource.h"
#import <QuartzCore/QuartzCore.h>
#import "QBPopupMenu.h"
#import "QBPlasticPopupMenu.h"
@interface MLPViewController ()
@property (nonatomic, strong) QBPopupMenu *popupMenu;
@property (nonatomic, strong) MLPPopupMenuDataSource *dataSource;
@property (nonatomic, strong) MLPPopupMenu *menuUp;
@property (nonatomic, strong) MLPPopupMenu *menuDown;

@end

@implementation MLPViewController

- (MLPPopupMenuDataSource *)dataSource
{
    if (!_dataSource) {
        _dataSource = [[MLPPopupMenuDataSource alloc] init];
    }
    
    return _dataSource;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    QBPopupMenuItem *item = [QBPopupMenuItem itemWithTitle:@"Zia" target:self action:@selector(showMeZia)];
    QBPopupMenuItem *item2 = [QBPopupMenuItem itemWithTitle:@"iOS" target:self action:@selector(showMeAlfred)];
     NSArray *items = @[item, item2];
    QBPopupMenu *popupMenu = [[QBPopupMenu alloc] initWithItems:items];
    popupMenu.highlightedColor = [[UIColor colorWithRed:0 green:0.478 blue:1.0 alpha:1.0] colorWithAlphaComponent:0.8];
    
    self.popupMenu = popupMenu;
    [super viewDidLoad];
//    // Do any additional setup after loading the view from its nib.
}
-(void)showMeZia{
   
    NSLog(@"Zia");
}
-(void)showMeAlfred{
    
  NSLog(@"iOS Developer");
}
- (void)addShadow:(UIButton*)button
{
    [button.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [button.layer setShadowOffset:CGSizeMake(0, 3)];
    [button.layer setShadowOpacity:0.125];
    [button.layer setCornerRadius:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MLPopupMenu Actions


-(IBAction)didSelectPopitUp:(id)sender event:(UIEvent*)event
{
    if ([self.menuUp isPopped]) {
        [self.menuUp hide];
    }else{
        [self.menuUp popInView:sender];
    }
}

-(IBAction)didSelectPopitDown:(id)sender event:(UIEvent *)event
{
    if ([self.menuDown isPopped]) {
        [self.menuDown hide];
    }else{
        [self.menuDown popInView:sender];
    }
}

-(IBAction)didSelectPopitDownFromNavBar:(id)sender event:(UIEvent *)event
{
    if ([self.menuDown isPopped]) {
        [self.menuDown hide];
    }else{
        [self.menuDown popInWithEvent:event];
    }
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([self.menuUp isPopped]) {
        [self.menuUp hide];
    }else{
        if (item.tag==1) {
            CGFloat tabBarHeight = self.tabBarController.tabBar.bounds.size.height;
            CGRect rect = CGRectMake(tabBar.frame.origin.x+250,tabBar.frame.origin.y, tabBarHeight, tabBarHeight);
            [self.popupMenu showInView:self.view targetRect:rect animated:YES];
        }
        
        
    }
}

@end
