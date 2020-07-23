//
//  main.m
//  MinPathSum0064
//
//  Created by Xuyang Li on 2020/7/23.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
// 最小路径和

#import <Foundation/Foundation.h>

//给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
//说明：每次只能向下或者向右移动一步。
/**
 动态规划C语言实现
 */
int minPathSum(int** grid, int gridSize, int* gridColSize){

    int rows = gridSize, cols = gridColSize[0];
        if (rows == 0 || cols == 0) {
            return 0;
        }
     
    int dp[rows][cols];
    
    dp[0][0] = grid[0][0];
    
    for (int i = 1; i<rows; i++) {
        dp[i][0] = dp[i-1][0] + grid[i][0];
    }
    for (int j = 1; j<cols; j++) {
        dp[0][j] = dp[0][j-1] + grid[j][0];
    }
    
    for (int i = 1; i < rows; i++) {
        for (int j = 1; j < cols; j++) {
            dp[i][j] = fmin(dp[i-1][j], dp[i][j-1] + grid[i][j]);
        }
    }
    
    return dp[rows-1][cols-1];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
