//
//  main.m
//  CopyRandomList35
//
//  Created by Xuyang Li on 2020/8/2.
//  Copyright © 2020 李旭阳[产品技术中心]. All rights reserved.
//  剑指 Offer 35. 复杂链表的复制

#import <Foundation/Foundation.h>
#import "Node.h"

Node* copyRandomList(Node *head){
    if (!head) {
        return nil;
    }
    Node *p1 = head;
    Node *p2 = head;
    NSMutableDictionary<Node *,Node *> *map = [[NSMutableDictionary alloc] init];
    
    while (p1) {
        Node *newNode = [[Node alloc] initWithData:p1.val];
        [map setValue:newNode forKey: p1];
        p1 = p1.next;
    }
    
    //处理指针
    while (p2) {
        if (p2.next) {
            [map objectForKey:p2].next = [map objectForKey:p2.next];
        }else{
            [map objectForKey:p2].next = nil;
        }
        
        [map objectForKey:p2].random = [map objectForKey:p2.random];
        p2 = p2.next;
    }
    return head;
}

Node* copyRandomList2(Node *head){
    if (!head) {
        return nil;
    }
    Node *cur = head;
    
    //1，拷贝链表，并且把链表链接起来
    while (cur) {
        Node *cloneNode = [[Node alloc] initWithData:cur.val];
        Node *nextNode = cur.next;
        cur.next = cloneNode;
        cloneNode.next = nextNode;
        cur = nextNode;
    }
    
    cur = head;
    
    //2，原生链表的节点的指向任意节点，使复制的节点也都指向某一任意节点
    
    while (cur) {
        cur.next.random = cur.random? cur.random : nil;
        cur = cur.next.next;
    }
    
    cur = head;
    Node *pCloneHead = head.next;
    while (cur) {
        Node *cloneNode = cur.next;
        cur.next = cloneNode.next;
        //拷贝节点的下一个结点指向下一个原结点的下一个结点
        cloneNode.next == cloneNode.next? cloneNode.next.next : nil;
        //将当前节点指向下一个原结点
        cur = cur.next;
    }
    return pCloneHead;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
