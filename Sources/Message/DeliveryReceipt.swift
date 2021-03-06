//
//  DeliveryReceipt.swift
//  FireStream
//
//  Created by Pepe Becker on 1/29/20.
//

import Types

public class DeliveryReceipt: Sendable {

    public static let MessageId = "id"

    public required init() {
        super.init()
        self.type = SendableType.DeliveryReceipt
    }

    public convenience init(type: DeliveryReceiptType, messageUid: String) {
        self.init()
        self.setBodyType(type)
        self.body?[Self.MessageId] = messageUid
    }

    public func getMessageId() throws -> String {
        return try! self.getBodyString(Self.MessageId)
    }

    public func getDeliveryReceiptType() -> DeliveryReceiptType {
        return DeliveryReceiptType(super.getBodyType())
    }

    public static func fromSendable(_ sendable: Sendable) -> DeliveryReceipt {
        return super.fromSendable(sendable)
    }

}
