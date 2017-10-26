//
//  ViewController.h
//  iOSDataStorage
//
//  Created by Sneha Kasetty Sudarshan on 9/15/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *bookName;
@property (weak, nonatomic) IBOutlet UITextField *authorName;

@property (weak, nonatomic) IBOutlet UITextField *descriptionbox;

@property (strong, nonatomic) NSString *dataFilePath;
@property (weak, nonatomic) IBOutlet UIButton *fileSave;

@property (weak, nonatomic) IBOutlet UIButton *archive;
@end


