//
//  ViewController.m
//  Decrypt
//
//  Created by mac on 12/23/14.
//  Copyright (c) 2014 (zhifei - qiuzhifei521@gmail.com). All rights reserved.
//

#import "ViewController.h"
#import "AESCrypt.h"


#define PASSWORD @"qiuzhifei"

#define DOCUMENTPATH [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

#define TxtPath [DOCUMENTPATH stringByAppendingPathComponent:@"a.txt"]

#define DataPath [DOCUMENTPATH stringByAppendingPathComponent:@"b"]

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray * models;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self encryptWithName:@"midi"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)encryptWithName:(NSString *)name
{
    NSString * path = [[NSBundle mainBundle] pathForResource:name ofType:@"txt"];
    NSString * string = [[NSString alloc] initWithContentsOfFile:path
                                                        encoding:NSUTF8StringEncoding
                                                           error:nil];
    
    string = [AESCrypt encrypt:string
                      password:PASSWORD];
    
    NSString * savePath = [DOCUMENTPATH stringByAppendingPathComponent:[name stringByAppendingFormat:@".txt"]];
    
    [string writeToFile:savePath
             atomically:YES
               encoding:NSUTF8StringEncoding
                  error:nil];
    
    
    string = [[NSString alloc] initWithContentsOfFile:savePath
                                             encoding:NSUTF8StringEncoding
                                                error:nil];
    
    string = [AESCrypt decrypt:string
                      password:PASSWORD];
    
    NSLog(@"save path == %@", savePath);
    
    NSLog(@"string == %@", string);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
