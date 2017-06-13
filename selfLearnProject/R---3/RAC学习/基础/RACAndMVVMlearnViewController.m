//
//  RACAndMVVMlearnViewController.m
//  Runloopuse
//
//  Created by HYZ on 17/6/12.
//  Copyright © 2017年 HYZ. All rights reserved.
//

#import "RACAndMVVMlearnViewController.h"
#import "ReactiveObjC.h"
#import "LoginViewModel.h"
@interface RACAndMVVMlearnViewController ()
@property(nonatomic,strong)UITextField * name;
@property(nonatomic,strong)UITextField * passWord;
@property(nonatomic,strong)UIButton     * button;
@property(nonatomic,strong)LoginViewModel * Loginmodel;
@end

@implementation RACAndMVVMlearnViewController
-(LoginViewModel*)Loginmodel
{
    if (!_Loginmodel) {
        _Loginmodel = [[LoginViewModel alloc]init];
    }
    return _Loginmodel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
     //
    self.view.backgroundColor = [UIColor whiteColor];
    _name = [[UITextField alloc]initWithFrame:CGRectMake(50, 70, 200, 30)];
    _name.placeholder =@"用户名";
    [self.view addSubview:_name];
    
    _passWord = [[UITextField alloc]initWithFrame:CGRectMake(50, 140, 200, 30)];
    _passWord.placeholder =@"密码";
    [self.view addSubview:_passWord];
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(90, 180, 100, 30)];
    //[_button addTarget:self action:@selector(butclick) forControlEvents:UIControlEventTouchUpInside];
    [_button setBackgroundColor:[UIColor orangeColor]];
    [_button setTitle:@"登陆" forState:UIControlStateNormal];
    [self.view addSubview:_button];
    RAC(self.Loginmodel,account) = _name.rac_textSignal;
    RAC(self.Loginmodel,pwd) = _passWord.rac_textSignal;
    RAC(_button,enabled)  = self.Loginmodel.loginEnable;
    
//    //绑定
//    RAC(_button,enabled)=
//    [ RACSignal combineLatest:@[_name.rac_textSignal,_passWord.rac_textSignal] reduce:^id _Nullable(NSString*acount,NSString* pwd){
//       return  @(acount.length&& pwd.length);
//   }];
    

      
    [[_button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        //
        NSLog(@"当按钮要执行的事情就写在这里");
        
        [self.Loginmodel.loginCommand execute:nil];
    }];
    
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end


//MVVM




