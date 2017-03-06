//
//  LinkedListQueue.swift
//
//
//  Created by samet sahin on 6.03.2017.
//
//
import Foundation

class cellT<ElemType> {
    var value : ElemType?
    var next : cellT?
    init (_ _value : ElemType)
    {
        self.value = _value
    }
}

class LinkedListQueue<ElemType>
{
    
    public typealias Node = cellT<ElemType>
    
    
    fileprivate var head : Node?
    fileprivate var tail : Node?
    
    public init() {}
    
    
    func dequee() -> ElemType!
    {
        
        let returnVal : Node = head!
        head = head!.next
        return returnVal.value
        
        
    }
    
    func enquee(_ newValue : ElemType)
    {
        let newCell = Node(newValue)
        newCell.next = nil
        if isEmpty()
        {
            head  = newCell
            tail = newCell
        }
        else{
            tail?.next = newCell
            tail = newCell
            
        }
    }
    
    func isEmpty() -> Bool
    {
        return head == nil
        
    }
    
}
