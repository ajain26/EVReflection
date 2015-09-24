//
//  TestObject.swift
//
//  Created by Edwin Vermeer on 4/29/15.
//  Copyright (c) 2015. All rights reserved.
//

import Foundation

/**
First test object where the base class is just an NSObject
*/
public class TestObject: NSObject {
    var objectValue: String = ""
}


/**
Second test object where the base class is an EVObject so that we have support for the protocols NSObject, NSCoding, Printable, Hashable, Equatable plus convenience methods.
*/
public class TestObject2: EVObject {
    var objectValue: String = ""
    var objectValue2: String?
}

/**
Variant of TestObject2 to test that they are not equal
*/
public class TestObject2b {
    var objectValue: String = ""
}

public class TestObject2c: NSObject {
    var objectValue: String = ""
    var _default: String?
}


/**
Third test object where you can see how create a workaround for the swift limitation with setting a value for a key where the property is a nullable type.
*/
class TestObject3: EVObject {
    var objectValue: String = ""
    var nullableType: Int?
    
    // This construction can be used to bypass the issue for setting a nullable type field
    override func setValue(value: AnyObject!, forUndefinedKey key: String) {
        switch key {
        case "nullableType":
            nullableType = value as? Int
        default:
            NSLog("WARNING: setValue for key '\(key)' should be handled.")
        }
    }
}

/**
For testing the automatic conversion from and to string and int
*/
public class TestObject4: EVObject {
    var myString: String = ""
    var myFloat: Float = 0
    var myDouble: Double = 0
    var myBool: Bool = true
    var myDate: NSDate = NSDate()
    var myInt: Int = 0
    var myInt8: Int8 = 0
    var myInt16: Int16 = 0
    var myInt32: Int32 = 0
    var myInt64: Int64 = 0
    var myUInt: UInt = 0
    var myUInt8: UInt8 = 0
    var myUInt16: UInt16 = 0
    var myUInt32: UInt32 = 0
    var myUInt64: UInt64 = 0
    var myNSNumber: NSNumber = NSNumber(int: 0)
    var invalid_character: String?
}


/**
For testing the custom property maping
*/
public class TestObject5: EVObject {
    var Name: String = "" // Using the default mapping
    var propertyInObject: String = "" // will be written to or read from keyInJson
    var ignoredProperty: String = "" // Will not be written or read to/from json 
    
    override public func propertyMapping() -> [(String?, String?)] {
        return [("ignoredProperty",nil), ("propertyInObject","keyInJson")]
    }
}



