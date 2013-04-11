//
//  ViewController.m
//  WWDCAlarm
//
//  Created by Mikimoto on 13/4/11.
//  Copyright (c) 2013年 Mikimoto. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    wwdcUrl = [NSURL URLWithString:@"http://mopcon.org"];
}

- (void)viewDidAppear:(BOOL)animated {
    [self refreshPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshPage {
    AFHTTPClient *client = [[AFHTTPClient alloc] init];
    AFHTTPRequestOperation *operation =
    [client HTTPRequestOperationWithRequest:[NSURLRequest requestWithURL:wwdcUrl]
                                    success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                        [self handlePageLoad:responseObject];
                                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                        [self handleFailureToLoadPage:error];
                                    }];
    [operation start];
}

- (IBAction)clickRefresh:(id)sender {
    [self refreshPage];
}

- (void)handlePageLoad:(NSData *)responseData {
    NSString *newPage = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(newPage);
    [self.webView loadHTMLString:newPage baseURL:wwdcUrl];
}

- (void)handleFailureToLoadPage:(NSError *)err {
    
}

@end
