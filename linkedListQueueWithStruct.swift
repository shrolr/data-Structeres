//
//  linkedListQueueWithStruct.swift
//  
//
//  Created by samet sahin on 6.03.2017.
//
//

import Foundation

struct cellT<ElemType> {
    
    var value : ElemType?
    var next : UnsafeMutablePointer<cellT<ElemType>>?
    
}

class linkedListQueueWithStruct<ElemType>
{
    public typealias NodePointer = UnsafeMutablePointer<cellT<ElemType>>
    fileprivate var head : NodePointer?
    fileprivate var tail : NodePointer?
    
    public init() {}
    
    
    func dequee() -> ElemType
    {
        
        let returnVal : ElemType = (head?.pointee.value)!
        
        let next : NodePointer = head!
        head = head?.pointee.next
        next.deallocate(capacity: 1)
        return returnVal
        
        
    }
    
    func enquee(_ value : ElemType)
    {
        let newCell = NodePointer.allocate(capacity: 1)
        newCell.pointee.value = value
        newCell.pointee.next = nil
        if isEmpty()
        {
            head  = newCell
            tail = newCell
        }
        else{
            tail?.pointee.next = newCell
            tail = newCell
            
        }
    }
    
    func isEmpty() -> Bool
    {
        return head == nil
        
    }
    
}



