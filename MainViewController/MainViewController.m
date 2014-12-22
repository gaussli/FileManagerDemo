//
//  MainViewController.m
//  FileManagerDemo
//
//  Created by lijinhai on 12/22/14.
//  Copyright (c) 2014 gaussli. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [super viewDidLoad];
    // 获得沙盒中Documents文件夹路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    NSLog(@"Documents文件夹路径：%@", documentsPath);
    // 在Documents文件夹中创建文件夹
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    [fileManager createDirectoryAtPath:testDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    
    // 在test文件夹中创建三个测试文件（test1.txt/test2.txt/test3.txt），并写入数据
    NSString *test1FilePath = [testDirectory stringByAppendingPathComponent:@"test1.txt"];
    NSString *test2FilePath = [testDirectory stringByAppendingPathComponent:@"test2.txt"];
    NSString *test3FilePath = [testDirectory stringByAppendingPathComponent:@"test3.txt"];
    // 三个文件的内容
    NSString *test1Content = @"helloWorld";
    NSString *test2Content = @"helloTest2";
    NSString *test3Content = @"helloTest3";
    // 写入对应文件
    [fileManager createFileAtPath:test1FilePath contents:[test1Content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    [fileManager createFileAtPath:test2FilePath contents:[test2Content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    [fileManager createFileAtPath:test3FilePath contents:[test3Content dataUsingEncoding:NSUTF8StringEncoding] attributes:nil];
    
    // 获得目录中的所有文件
    // 在test目录下再创建一个子目录subtest文件夹，里面再创建三个子文件（subtest1.txt/subtest2.txt/subtest3.txt）
    // 创建subtest目录
    NSString *subtestDirectoryPath = [testDirectory stringByAppendingPathComponent:@"subtest"];
    [fileManager createDirectoryAtPath:subtestDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    // 创建三个子文件
    [fileManager createFileAtPath:[subtestDirectoryPath stringByAppendingPathComponent:@"subtest1.txt"] contents:nil attributes:nil];
    [fileManager createFileAtPath:[subtestDirectoryPath stringByAppendingPathComponent:@"subtest2.txt"] contents:nil attributes:nil];
    [fileManager createFileAtPath:[subtestDirectoryPath stringByAppendingPathComponent:@"subtest3.txt"] contents:nil attributes:nil];
    
    NSArray *testDirectoryFiles = [fileManager subpathsOfDirectoryAtPath:testDirectory error:nil];
    NSLog(@"subpathsOfDirectoryAtPath的结果：%@", testDirectoryFiles);
    NSArray *testDirectoryFiles1 = [fileManager subpathsAtPath:testDirectory];
    NSLog(@"subpathsAtPath的结果：%@", testDirectoryFiles1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
