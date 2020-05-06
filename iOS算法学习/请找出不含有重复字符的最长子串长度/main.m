//
//  main.m
//  请找出不含有重复字符的最长子串长度
//
//  Created by Alan on 5/6/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 思路：
 将字符中的每个元素放入数组中，如果已经包含就移除字符之前的所有元素，，记录数组的count值并取最大
 **/
void function1(NSString *str)
{
    NSMutableArray *arr = [NSMutableArray array];
    int max = 0;
    for (int i = 0; i < str.length; i++) {
        //获取当前位置字符串
        NSString *s = [str substringWithRange:NSMakeRange(i, 1)];
        //判断数组中是否包含当前字符串
        if ([arr containsObject:s]) {
            //数组中包含字符串，或取出字符的位置
            int index = [arr indexOfObject:s];
            //移除当前字符之前的所有元素
            [arr removeObjectsInRange:NSMakeRange(0, index+1)];
        }else{
            //如果字符不包含，就添加进入数组
            [arr addObject:s];
        }
        //当前的max和数组的count那个值大就取出那个值
        max = max > arr.count ? max : arr.count;
    }
    NSLog(@"max--%d",max);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSString *str = @"abcabcbb";
        NSString *str = @"pwwkew";


        CFAbsoluteTime   StartTime1 = CFAbsoluteTimeGetCurrent();
        function1(str);
        CFAbsoluteTime EndTime1 = CFAbsoluteTimeGetCurrent();
        NSLog(@"function2执行时间为：----%f",EndTime1 - StartTime1);
    }
    return 0;
}

