//
//  main.m
//  GetIntersectionNode52
//
//  Created by Xuyang Li on 2020/7/16.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

//两个链表的第一个公共节点

#import <Foundation/Foundation.h>
#import "ListNode.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}

///可以理解为两条链表最后都指向了同一个 null （None）节点，代替了不相交的特殊情况。 非常的巧妙。
ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    ListNode *node1 = headA;
    ListNode *node2 = headB;
    while (node1 != node2) {
        node1 = node1 != nil? node1.next : headB;
        node2 = node2 != nil? node2.next : headA;
    }
    
    return node1;
}


