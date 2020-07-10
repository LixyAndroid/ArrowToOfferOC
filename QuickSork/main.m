//
//  main.m
//  QuickSork
//
//  Created by 李旭阳[产品技术中心] on 2020/7/10.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sort.h"

//快速排序

int getStandard(int array[], int i, int j) {
    //基准数据
    int key = array[i];
    while (i < j) {
        //因为默认基准是从左边开始，所以从右边开始比较
        //当队尾的元素大于等于基准数据 时,就一直向前挪动 j 指针
        while (i < j && array[j] >= key) {
            j--;
        }
        //当找到比 array[i] 小的时，就把后面的值 array[j] 赋给它
        if (i < j) {
            array[i] = array[j];
        }
        //当队首元素小于等于基准数据 时,就一直向后挪动 i 指针
        while (i < j && array[i] <= key) {
            i++;
        }
        //当找到比 array[j] 大的时，就把前面的值 array[i] 赋给它
        if (i < j) {
            array[j] = array[i];
        }
    }
    //跳出循环时 i 和 j 相等,此时的 i 或 j 就是 key 的正确索引位置
    //把基准数据赋给正确位置
    array[i] = key;
    return i;
}

void QuickSort(int array[], int low, int high) {
    //开始默认基准为 low
    if (low < high) {
        //分段位置下标
        int standard = getStandard(array, low, high);
        //递归调用排序
        //左边排序
        QuickSort(array, low, standard - 1);
        //右边排序
        QuickSort(array, standard + 1, high);
    }
}


void display(int array[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        int count = 100;
        NSMutableSet * mutableSet = [NSMutableSet setWithCapacity:count];
        /// 1.1 循环100次
        for (NSInteger i = 0; i < count; i++) {
            NSInteger value = arc4random() % 1000;
            /// 1.2 把随机数添加到MutableSet里，NSMutableSet是不重复添加相同的值的
            [mutableSet addObject:[NSNumber numberWithInteger:value]];
        }
        /// 1.3 把随机数放到一个可变数组里
        NSMutableArray * array = [[NSMutableArray alloc] initWithArray:mutableSet.allObjects];
        NSLog(@"排序前%@",array);
        [Sort quickSort:array low:0 high:(int)array.count-1];
        
        NSLog(@"排序后%@",array);
        
        int array2[] = {5,3,2,1,7,9,34,22,389,214};
        int size = sizeof(array2) / sizeof(int);
        
        printf("原来的数组：");
        display(array2, size);
        QuickSort(array2, 0, size - 1);
        printf("排序后数组：");
        display(array2, size);
        
        
    }
    return 0;
}
