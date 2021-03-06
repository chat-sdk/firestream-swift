//
//  ContactType.swift
//  FireStream
//
//  Created by Pepe Becker on 1/28/20.
//

import Service

public class ContactType: BaseType {

    public static let Contact = "contact"

    public static func contact() -> ContactType {
        return ContactType(Contact)
    }

    public func data() -> [String: Any] {
        var data = [String: Any]()
        data[Keys.type] = self.get()
        return data
    }

}
