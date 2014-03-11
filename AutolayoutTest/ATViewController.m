//
//  ATViewController.m
//  AutolayoutTest
//
//  Created by Durgesh Dhurve on 15/10/13.
//  Copyright (c) 2013 Diaspark. All rights reserved.
//

#import "ATViewController.h"

@interface ATViewController ()

@property (strong, nonatomic) IBOutlet UIView *Topview;
@property (strong, nonatomic) IBOutlet UIView *Bottmview;

@end

@implementation ATViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *superview=[self view];
    
    _Topview=[[UIView alloc]init];
    _Topview.backgroundColor=[UIColor redColor];
    _Topview.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:_Topview];

    // Constraint with constraintWithItem method
    
    NSLayoutConstraint *leftConstraint=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:superview  attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    
    //NSLayoutConstraint *topConstraint=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeTop multiplier:0 constant:200];
    
    NSLayoutConstraint *centerV=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:-20];
    
    NSLayoutConstraint *width=[NSLayoutConstraint  constraintWithItem:_Topview attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview  attribute:NSLayoutAttributeWidth multiplier:0 constant:100];
    
    NSLayoutConstraint *height=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeHeight multiplier:0 constant:50];
    
    NSLayoutConstraint *rightConstraint=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    
    //NSLayoutConstraint *bottomConstraint=[NSLayoutConstraint constraintWithItem:_Topview attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:superview attribute:NSLayoutAttributeBottom multiplier:0 constant:-200];
    
    [superview addConstraints:@[leftConstraint,centerV,width,height,rightConstraint]];
    

    /*
    UILabel *lblTemp=[[UILabel alloc]initWithFrame:CGRectMake(110, 200, 100, 50)];
    lblTemp.text=@"Temp Label";
    lblTemp.backgroundColor=[UIColor greenColor];
    
    [self.view addSubview:lblTemp];
     */
    
    
    
    // To create multiple constraint at once with constraintVisualFormat method
    
    UILabel *tempLabel=[[UILabel alloc]init];
    tempLabel.backgroundColor=[UIColor greenColor];
    tempLabel.translatesAutoresizingMaskIntoConstraints=NO;
    tempLabel.text=@"Temprory Label";
    
    [self.view addSubview:tempLabel];
    
    UILabel *secLabel=[[UILabel alloc]init];
    [secLabel setBackgroundColor:[UIColor greenColor]];
    secLabel.translatesAutoresizingMaskIntoConstraints=NO;
    secLabel.text=@"Second Label";
    
    //[self.view addSubview:secLabel];
//    NSDictionary *viewsDictionary=@{ @"tempLabel" : tempLabel };
    
    NSDictionary *viewsDictionary=NSDictionaryOfVariableBindings(tempLabel,secLabel);
    NSArray *allHConsraints=[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-30-[tempLabel(>=50)][secLabel(>=50)]-30-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDictionary];
    
    
    [self.view addConstraints:allHConsraints];
    
    NSArray *allVConstraints=[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(<=320)-[tempLabel(50)]-(>=20)-|" options:NSLayoutFormatAlignAllTop metrics:nil views:viewsDictionary];
    
    [self.view addConstraints:allVConstraints];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
