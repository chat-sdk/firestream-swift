//
//  BaseType.swift
//  FireStream
//
//  Created by Pepe Becker on 1/28/20.
//

public class BaseType {

    internal var type = ""

    public init(_ type: String) {
        self.type = ""
    }

    public init(_ type: BaseType) {
        self.type = type.get()
    }

    public func get() -> String {
        return self.type
    }

    public func equals(_ type: BaseType) -> Bool {
        return self.get() == type.get()
    }

    public static func none() -> BaseType {
        return BaseType("")
    }

}
