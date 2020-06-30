//
//  main.m
//  ReverseLinkList
//
//  Created by Xuyang Li on 2020/6/30.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkNode.h"

/**
 翻转链表
 */
LinkNode *reverseLinkList(LinkNode *head){
    //只有自身一个
    if(!head.data||!head.next){
        //直接返回自身
        return head;
    }
    
    //超过一个的，子链表递归翻转
    LinkNode *result = reverseLinkList(head.next);
    
    //头结点的next这时已经指向的是，反转后的result链表的尾部节点
    //让尾部节点的next指向原头节点
    head.next.next = head;
    
    //原头节点作为尾部节点
    head.next = nil;
    
    //返回反转后的头节点
    
    return result;
    
}

/** 分组并翻转链表 */
LinkNode *groupAndReverseLinkList(LinkNode *linkList, NSInteger groupSize) {
    //声明头指针
    LinkNode *head = linkList;
    
    //取出一组
    for(NSInteger index = 1; index < groupSize && head; index += 1 ){
        head = head.next;
    }
    
    if (!head) {
        //不足一组（不足groupSize,当前node已经为空）
        //不做反转，直接返回
        return linkList;
    }
    
    //够一组，将此组与后面链表分隔
    //后面的字表
    LinkNode *tail = head.next;
    
    //原满足的组作为单独组
    head.next = nil;
    
    //将满足的组进行反转
    LinkNode *resultHead = reverseLinkList(linkList);
    
    //字表继续递归操作
    LinkNode *result = groupAndReverseLinkList(tail, groupSize);
    
    //连接两部分（反转后的满足组，尾部节点为原头节点）
    linkList.next = result;
    
    return resultHead;
    
}





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        // 创建链表
        
        // 链表头结点
        LinkNode *head = [LinkNode new];
        
        LinkNode *nextNode = nil;
        for (NSInteger index = 8; index > 0; index -= 1) {
            LinkNode *node = [LinkNode new];
            node.data = index;
            // 指向下一个node
            node.next = nextNode;
            
            // 当前node标记为nextNode
            nextNode = node;
        }
        
        head.next = nextNode;
        NSLog(@"%@", head.next);
        
        // 翻转链表
        head.next = reverseLinkList(head.next);
        NSLog(@"翻转后的链表");

        NSLog(@"%@", head.next);
        
        // 从前向后进行分组翻转
        LinkNode *result = groupAndReverseLinkList(head.next, 3);
        
        // 翻转链表（得到从后向前的分组结果）
        head.next = reverseLinkList(result);
        NSLog(@"从前向后进行分组翻转");
        NSLog(@"%@", head.next);
        
    }
    return 0;
}
