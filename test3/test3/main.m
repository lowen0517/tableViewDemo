//
//  main.m
//  test3
//
//  Created by fisher_xia on 16/8/24.
//  Copyright © 2016年 phicomm. All rights reserved.
//

#import <Foundation/Foundation.h>

void test1(){
    //NSRange rg={3,5};//第一参数是起始位置第二个参数是长度
    //NSRange rg;
    //rg.location=3;
    //rg.length=5;
    //NSRange rg={.location=3,.length=5};
    //常用下面的方式定义
    NSRange rg2=NSMakeRange(3,5);//使用NSMakeRange定义一个NSRange
    //打印NSRange可以使用Foundation中方法
    NSLog(@"rg2 is %@", NSStringFromRange(rg2));//注意不能直接NSLog(@"rg2 is %@", rg2)，因为rg2不是对象（准确的说%@是指针）而是结构体
}
/*NSPoint表示一个点*/
void test2(){
    //NSPoint p=NSMakePoint(10, 15);//NSPoint其实就是CGPoint
    //这种方式比较常见
    NSPoint p2=CGPointMake(10, 15);
    NSLog(NSStringFromPoint(p2));
}
/*NSSize表示大小*/
void test3(){
    //NSSize s=NSMakeSize(10, 15);//NSSize其实就是CGSize
    //这种方式比较常见
    CGSize s2=CGSizeMake(10, 15);
    NSLog(NSStringFromSize(s2));
}
/*NSRect表示一个矩形*/
void test4(){
    //NSRect r=NSMakeRect(10, 5, 100, 200);//NSRect其实就是CGRect
    //这种方式比较常见
    NSRect r2=CGRectMake(10, 5, 100, 200);
    NSLog(NSStringFromRect(r2));
}



/**字符串操作*/
void test11(){
    char *str1="C string";//这是C语言创建的字符串
    NSString *str2=@"OC string";//ObjC字符串需要加@，并且这种方式创建的对象不需要自己释放内存
    
    //下面的创建方法都应该释放内存
    NSString *str3=[[NSString alloc] init];
    str3=@"OC string";
    NSString *str4=[[NSString alloc] initWithString:@"Objective-C string"];
    NSString *str5=[[NSString alloc] initWithFormat:@"age is %i,name is %.2f",19,1.72f];
    NSString *str6=[[NSString alloc] initWithUTF8String:"C string"];//C语言的字符串转换为ObjC字符串
    
    //以上方法都有对应静态方法（一般以string开头）,不需要管理内存（系统静态方法一般都是自动释放）
    NSString *str7=[NSString stringWithString:@"Objective-C string"];
}


void test22(){
    NSLog(@"\"Hello world!\" to upper is %@",[@"Hello world!" uppercaseString]);
    //结果："Hello world!" to upper is HELLO WORLD!
    NSLog(@"\"Hello world!\" to lowwer is %@",[@"Hello world!" lowercaseString]);
    //结果："Hello world!" to lowwer is hello world!
    
    //首字母大写，其他字母小写
    NSLog(@"\"Hello world!\" to capitalize is %@",[@"Hello world!" capitalizedString]);
    //结果："Hello world!" to capitalize is Hello World!
    
    BOOL result= [@"abc" isEqualToString:@"aBc"];
    NSLog(@"%i",result);
    //结果：0
    NSComparisonResult result2= [@"abc" caseInsensitiveCompare:@"aBc"];//如果是[@"abc" caseInsensitiveCompare:@"aBc"]则忽略大小写比较
    if(result2==NSOrderedAscending){
        NSLog(@"left<right.");
    }else if(result2==NSOrderedDescending){
        NSLog(@"left>right.");
    }else if(result2==NSOrderedSame){
        NSLog(@"left=right.");
    }
    //结果：left>right.
}
void test33(){
    NSLog(@"has prefix ab? %i",[@"abcdef" hasPrefix:@"b"]);
    //结果：has prefix ab? 1
    NSLog(@"has suffix ab? %i",[@"abcdef" hasSuffix:@"ef"]);
    //结果：has suffix ab? 1
    NSRange range=[@"abcdefabcdef" rangeOfString:@"cde"];//注意如果遇到cde则不再往后面搜索,如果从后面搜索或其他搜索方式可以设置第二个options参数
    if(range.location==NSNotFound){
        NSLog(@"not found.");
    }else{
        NSLog(@"range is %@",NSStringFromRange(range));
    }
    //结果：range is {2, 3}
}
//字符串分割
void test44(){
    NSLog(@"%@",[@"abcdef" substringFromIndex:3]);//从第三个索引开始（包括第三个索引对应的字符）截取到最后一位
    //结果：def
    NSLog(@"%@",[@"abcdef" substringToIndex:3]);////从0开始截取到第三个索引（不包括第三个索引对应的字符）
    //结果：abc
    NSLog(@"%@",[@"abcdef" substringWithRange:NSMakeRange(2, 3)]);
    //结果：cde
    NSString *str1=@"12.abcd.3a";
    NSArray *array1=[str1 componentsSeparatedByString:@"."];//字符串分割
    NSLog(@"%@",array1);
    /*结果：
     (
     12,
     abcd,
     3a
     )
     */
    
}
//其他操作
void test55(){
    NSLog(@"%i",[@"12" intValue]);//类型转换
    //结果：12
    NSLog(@"%zi",[@"hello world,世界你好！" length]);//字符串长度注意不是字节数
    //结果：17
    NSLog(@"%c",[@"abc" characterAtIndex:0]);//取出指定位置的字符
    //结果：a
    const char *s=[@"abc" UTF8String];//转换为C语言字符串
    NSLog(@"%s",s);
    //结果：abc
}





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //test1();
        //test2();
        //test3();
        //test4();
        //test22();
        //test33();
        //test44();
        //test55();
        
        
    }
    return 0;
}
