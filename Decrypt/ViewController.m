//
//  ViewController.m
//  Decrypt
//
//  Created by mac on 12/23/14.
//  Copyright (c) 2014 (zhifei - qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"
#import "AESCrypt.h"


#define PASSWORD @"PASSWORD"

#define DOCUMENTPATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define TxtPath [DOCUMENTPATH stringByAppendingPathComponent:@"a.txt"]

#define DataPath [DOCUMENTPATH stringByAppendingPathComponent:@"b"]

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray * models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString * text = @"123";
    
    text = [AESCrypt encrypt:text
                    password:PASSWORD];
    
    text = [AESCrypt decrypt:text
                    password:PASSWORD];
    
    NSLog(@"text == %@", text);

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
