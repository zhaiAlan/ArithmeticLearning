//
//  main.m
//  两数之和为固定值返回下标
//
//  Created by Alan on 4/30/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 暴力破解法
 两层循环，
 **/
void function1(NSArray *dataArr,int target)
{
    for (int i = 0; i < dataArr.count; i++) {
        //第一层循环从初始位置开始
        for (int j = i+1;j<dataArr.count ; j++) {
            //遍历i后面值，找到i,j位置和为目标值，并输出i,j位置
            if ([dataArr[j] intValue] == target - [dataArr[i] intValue]) {
                NSLog(@"位置分别为： %d----%d",i,j);
                return;
            }
        }
    }
    NSLog(@"此数组无解");
}
/**
 思路：
 1.先循环遍历数组：保存一个字典：
 使用字典进行keyValue形式保存数组，key为值，value为位置，
 2.再次循环数组，直接计算出需要找到的值，然后判断字典中key是否存在
 时间复杂度为O(n)
 */
void function2(NSArray *dataArr,int target)
{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:dataArr.count];
    for (int i = 0; i < dataArr.count; i++) {
        //先遍生成字典，key为值，value为位置，
        [dic setValue:@(i) forKey:dataArr[i]];
    }
    for (int i = 0; i <dataArr.count; i++) {
        //获取差值
        int  complement =target - [dataArr[i] intValue] ;
        //判断字典中key值有没有差值元素，切差值元素不是当前遍历元素
        if ([dic.allKeys containsObject:@(complement)] &&[dic[@(complement)] intValue] != i) {
           NSLog(@"位置分别为： %d----%@",i,dic[@(complement)]);
            return;
        }
        
    }
    NSLog(@"此数组无解");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /**
         题目：
         给定一个整数数组，nums和一个目标值target ,请在数组中找出何为目标值的两个整数，并返回下标
         要求：
         不能出国内服利用这个数组中的同一元素，例如：8+8 = 16；
         
         举例：
         给定nums = [2,3,9,12],target = 15;
         因为给定的nums[1] + nums[3] = 3+12 = 15
         所以返回[1,3];
         
         */
        NSArray *arr = @[@2,@9,@8,@16,@3,@12,@10,@18];
        int target = 15;
        CFAbsoluteTime   StartTime = CFAbsoluteTimeGetCurrent();
        function1(arr,15);
        CFAbsoluteTime EndTime = CFAbsoluteTimeGetCurrent();
        NSLog(@"执行时间为：----%f",EndTime - StartTime);
        
        CFAbsoluteTime   StartTime1 = CFAbsoluteTimeGetCurrent();
        function2(arr,15);
        CFAbsoluteTime EndTime1 = CFAbsoluteTimeGetCurrent();
        NSLog(@"function2执行时间为：----%f",EndTime1 - StartTime1);

    }
    return 0;
}
