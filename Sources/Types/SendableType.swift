//
//  SendableType.swift
//  FireStream
//
//  Created by Pepe Becker on 1/28/20.
//

public class SendableType: BaseType {

    static let Message = "message"
    static let DeliveryReceipt = "receipt"
    static let TypingState = "typing"
    static let Presence = "presence"
    static let Invitation = "invitation"

    public static func message() -> SendableType {
        return SendableType(Message)
    }

    public static func deliveryReceipt() -> SendableType {
        return SendableType(DeliveryReceipt)
    }

    public static func typingState() -> SendableType {
        return SendableType(TypingState)
    }

    public static func presence() -> SendableType {
        return SendableType(Presence)
    }

    public static func invitation() -> SendableType {
        return SendableType(Invitation)
    }

}
