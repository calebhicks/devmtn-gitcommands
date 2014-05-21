//
//  GRScrollViewController.m
//  Git Reference
//
//  Created by Caleb Hicks on 5/20/14.
//  Copyright (c) 2014 Dev Mountain. All rights reserved.
//

#import "GRScrollViewController.h"

static NSString * const Command = @"command";
static NSString * const Reference = @"reference";

@interface GRScrollViewController ()

@end

@implementation GRScrollViewController


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
    // Do any additional setup after loading the view.
    
    // Initialize the Scroll View
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    // Size the Scroll View 1.5 times higher than the content
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
    
    // Add the Scroll View to the Actual View
    [self.view addSubview:scrollView];
    
    
    // Create a background so the text doesn't show up on the toolbar
    UIView *toolbarStayWhite = [[UIView alloc] initWithFrame: CGRectMake(0, 0, self.view.frame.size.width, 40)];
    toolbarStayWhite.backgroundColor = [UIColor whiteColor];
    
    
    [self.view addSubview:toolbarStayWhite];
    
    
    // Create a Fancy Background For My Title Label
    UIView *titleBackground = [[UIView alloc] initWithFrame: CGRectMake(0, 20, self.view.frame.size.width, 40)];
    titleBackground.backgroundColor = [UIColor lightGrayColor];
    
    
    [self.view addSubview:titleBackground];
    
    
    // Create a Title Label
    
    UILabel *titleForView = [[UILabel alloc] initWithFrame: CGRectMake(10, 10, self.view.frame.size.width, 20)];
    
    NSString *titleForViewText = @"GitHub Commands";
    titleForView.text = titleForViewText;
    titleForView.textAlignment = NSTextAlignmentCenter;
    
    // Add My Title Label to the Actual View
    [titleBackground addSubview:titleForView];
    
    
    // Logging the dictionary to console, then will turn logs into the labels
    
    // Margin count is for the line spacing, should rename the variable
    
    NSInteger marginCount = 60;
    
    // todo: review for in loops for quick enumeration
    
    for (NSDictionary *gitDict in [self gitCommands]) {
        
        // get and set the text for the command, initialize the label
        
        NSString *specificGitCommand = gitDict[Command];
        UILabel *titleLabelForCommand = [[UILabel alloc] initWithFrame: CGRectMake(10, marginCount, self.view.frame.size.width, 20)];
        
        NSString *titleLabelForCommandText = specificGitCommand;
        titleLabelForCommand.text = titleLabelForCommandText;
        
        // add the label to the scroll view
        [scrollView addSubview:titleLabelForCommand];

        // get and set the text for the reference, initialize the label
        NSString *specificGitReference = gitDict[Reference];
        UILabel *titleLabelForReference = [[UILabel alloc] initWithFrame: CGRectMake(10, marginCount + 20, self.view.frame.size.width, 20)];
        
        NSString *titleLabelForReferenceText = specificGitReference;
        titleLabelForReference.text = titleLabelForReferenceText;
        
        // add the label to the scroll view
        [scrollView addSubview:titleLabelForReference];
        
        marginCount += 60;

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray *)gitCommands {
    
    return @[@{Command: @"git status", Reference: @": shows changed files"},
             @{Command: @"git diff", Reference: @": shows actual changes"},
             @{Command: @"git add .", Reference: @": adds changed files to the commit"},
             @{Command: @"git commit -m \"notes\"", Reference: @": commits the changes"},
             @{Command: @"git push origin _branch_", Reference: @": pushes commits to branch named _branch_"},
             @{Command: @"git log", Reference: @": displays progress log"},
             @{Command: @"git comment --amend", Reference: @": re-enter last commit message"}
             ];
    
}

@end
