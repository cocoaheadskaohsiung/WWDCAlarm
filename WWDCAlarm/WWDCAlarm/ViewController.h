//
//  ViewController.h
//  WWDCAlarm
//
//  Created by Mikimoto on 13/4/11.
//  Copyright (c) 2013年 Mikimoto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSURL *wwdcUrl;
}

@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)clickRefresh:(id)sender;

@end
