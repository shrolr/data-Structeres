//
//  Circular Buffer.swift
//
//
//  Created by samet sahin on 7.03.2017.
//
//

import Foundation


class CircularBuffer<ElemType>
{
    fileprivate var arr : [ElemType?]
    fileprivate var writeIndex : Int = 0
    fileprivate var cur : Int = 0
    fileprivate let size : Int
    
    // initializing array with determined size
    public init(_ size : Int) {
        arr = [ElemType?](repeating: nil, count: size)
        self.size = size
    }
    // Appends Element at writeIndex
    func append (_ T : ElemType)
    {
        writeIndex = writeIndex % size
        arr[writeIndex] = T
        writeIndex += 1
        cur = writeIndex
    }
    
    /*
     I'm assuming array size is 10
     let assume you have array wtih 5 element like this ["e one" ,"e two","e three" ,"e four" ,"five"]
     and therefore variable writeIndex is 5 and cur is 5
     now we're start reading element from Circular buffer by calling getLastAppendedElement()
     now variable cur is 4 
     let's call this method 2 more time 
     okay now cur is 2
     and if we want to override values from ındex we call startAppendingFromLastReadedElementIndex() method
     after that we can call append() method and start appending from cur ındex
     
     if we call append("six") 
     now our array is ["e one" ,"e two","e six" ,"e four" ,"five"]
     
     */
    func startAppendingFromLastReadedElementIndex()
    {
        writeIndex = cur
    }
    
    func isEmpty() -> Bool
    {
        return (arr[0] == nil)
    }
    
    
    func getLastAppendedElement() -> ElemType?
    {
        cur -= 1
        if cur < 0
        {
            cur = size-1
        }
        return arr[cur]
    }
    func undoReading()
    {
        cur += 1
    }
    func getLastReadedElement() -> ElemType?
    {
        return arr[cur]
    }
    
}
