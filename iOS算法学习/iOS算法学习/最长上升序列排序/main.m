//
//  main.m
//  iOS算法学习
//
//  Created by Alan on 4/30/20.
//  Copyright © 2020 zhaixingzhi. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 思路，从第一个位置开始往后循环判断，每个位置的升序数量，保存最大值
 时间复杂度基本为:最差为：O(n²），最小为O(n)
 **/
void bruteForce(NSArray *dataArr)
{
    //如果数组中没有值，就直接返回
    if (!dataArr.count) {
        return;
    }
    int res =1;
    for (int i = 0; i < dataArr.count; i++) {
        //当前循环的升序数值，默认初始值为1
        int upnum = 1;
        for (int j = i+1; j < dataArr.count; j++) {
            //如果j位置的值，小于位置的值，就进行++ 操作
            if (dataArr[i] <dataArr[j]) {
                upnum ++;
            }
        }
        //循环完成一次，就进行对比，保存最大值
        res = MAX(res, upnum);
        //如果当前最大值已经大于数组最大值和位置的差值，就不用再往后进行排序了
        if (res > dataArr.count - i) {
            break;
        }
    }
    NSLog(@"%d",res);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /**
         题目：给定一个无需的整数数组，找出其中最长的子序列长度

         举例：

         输入：[10,9,2,5,3,7,101,18]

         输出: 4

         解释：最长的上升子序列的组合，你只需要输出对应的长度即可[2,3,7,101]

         说明：

         可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
         */
        NSArray *arr = @[@10,@9,@2,@5,@3,@7,@101,@18];
        
        CFAbsoluteTime   StartTime = CFAbsoluteTimeGetCurrent();
        bruteForce(arr);
        CFAbsoluteTime EndTime = CFAbsoluteTimeGetCurrent();
        NSLog(@"执行时间为：----%f",EndTime - StartTime);
        


    }
    return 0;
}


