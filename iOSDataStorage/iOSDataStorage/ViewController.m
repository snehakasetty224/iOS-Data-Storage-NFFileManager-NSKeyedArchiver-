//
//  ViewController.m
//  iOSDataStorage
//
//  Created by Sneha Kasetty Sudarshan on 9/15/17.
//  Copyright © 2017 Sneha Kasetty Sudarshan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSFileManager *filemgr;
   // NSString *_dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    
    // Identifying the document directory, as each ios application has its own private documments and tmp directories into whcih it is permitted to read and write data
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = dirPaths[0];
    
    NSLog(@"\ndocsDir %@\n", docsDir);
    
    //building path to data file
    
    _dataFilePath = [docsDir stringByAppendingPathComponent:@"datafile.archive"];
    
    NSLog(@"\ndataFile %@\n",_dataFilePath);
    
    //checking if the file already exists
    
    if([filemgr fileExistsAtPath:_dataFilePath])
    {
        // Read file contents and display in text box
        
            NSData *databuffer;
            databuffer = [filemgr contentsAtPath: _dataFilePath];
     
    }
    
    
 
    // Check if the file already exists
    if ([filemgr fileExistsAtPath: _dataFilePath])
    {
        NSMutableArray *dataArray;
        
        dataArray = [NSKeyedUnarchiver
                     unarchiveObjectWithFile: _dataFilePath];
        
        _bookName.text = dataArray[0];
        _authorName.text = dataArray[1];
        _descriptionbox.text = dataArray[2];
        
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDataInFile:(id)sender {
    
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    NSString *bookName1;
    NSString *authorName1;
    NSString *description;
    NSString *fileSaved;
    
    
    bookName1 = [@"BookName:" stringByAppendingString:_bookName.text];
    authorName1 = [@"AuthorName:" stringByAppendingString:_authorName.text];
    description = [@"Description:" stringByAppendingString:_descriptionbox.text];
    
    fileSaved = [NSString stringWithFormat:@"%@\n%@\n%@",bookName1,authorName1,description];
    
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    dataFile = [docsDir stringByAppendingPathComponent:@"datafile.dat"];
    
    NSLog(@"dataFile %@",dataFile);
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Saved to File"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
    databuffer = [fileSaved
                  dataUsingEncoding: NSASCIIStringEncoding];
    [filemgr createFileAtPath: dataFile
                     contents: databuffer attributes:nil];
    
}

- (IBAction)archiveData:(id)sender {
    
   

    NSMutableArray *contactArray;

      contactArray = [[NSMutableArray alloc] init];
      [contactArray addObject:_bookName.text];
      [contactArray addObject:_authorName.text];
      [contactArray addObject:_descriptionbox.text];
      [NSKeyedArchiver archiveRootObject:
    contactArray toFile:_dataFilePath];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Data Archived"
                                                    message:@""
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}



@end
