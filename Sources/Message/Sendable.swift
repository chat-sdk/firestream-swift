//
//  Sendable.swift
//  FireStream
//
//  Created by Pepe Becker on 1/28/20.
//

import Foundation
import Service
import Types

extension String: Error {}

public class Sendable: BaseMessage {

    internal var id: String?

    public required override init() {
//        self.from = Fire.Stream.currentUserId();
    }

    public init(id: String, data: [String: Any]) {
        super.init()
        self.id = id

        if let from = data[Keys.From] as? String {
            self.from = from
        }
        if let date = data[Keys.Date] as? Date {
            self.date = date
        }
        if let body = data[Keys.Body] as? [String: Any] {
            self.body = body
        }
        if let type = data[Keys.type] as? String {
            self.type = type
        }
    }

    public func valid() -> Bool {
        return from != nil && date != nil && body != nil && type != nil
    }

    public func setBodyType(_ type: BaseType) {
        self.body?[Keys.type] = type.get()
    }

    public func getBodyType() -> BaseType {
        if let type = self.body?[Keys.type] as? String {
            return BaseType(type)
        }
        return BaseType.none()
    }

    public func getBodyString(_ key: String) throws -> String {
        if let value = self.body?[key] as? String {
            return value
        }
        throw "Body doesn't contain key: " + key
    }

    public func copyTo(_ sendable: Sendable) {
        sendable.setId(self.id)
        sendable.setFrom(self.from)
        sendable.setBody(self.body)
        sendable.setDate(self.date)
    }

    public func toBaseMessage() -> BaseMessage {
        let message = BaseMessage()
        message.from = self.from
        message.body = self.body
        message.date = self.date
        message.type = self.type
        return message
    }

    public func toData() -> [String: Any] {
        var data = [String: Any]()
        data[Keys.From] = self.from
        data[Keys.Body] = self.body
//        data[Keys.Date] = Fire.privateApi().getFirebaseService().core.timestamp()
        data[Keys.type] = self.type
        return data
    }

//    public static class Converter<T extends Sendable> {
//
//        protected Class<T> clazz;
//
//        public Converter(Class<T> clazz) {
//            this.clazz = clazz;
//        }
//
//        public T convert(Sendable s) {
//            try {
//                T instance = clazz.newInstance();
//                s.copyTo(instance);
//                return instance;
//            } catch (Exception e) {
//                return null;
//            }
//        }
//    }
//
//    public Message toMessage() {
//        return new Converter<>(Message.class).convert(this);
//    }
//
//    public TypingState toTypingState() {
//        return new Converter<>(TypingState.class).convert(this);
//    }
//
//    public DeliveryReceipt toDeliveryReceipt() {
//        return new Converter<>(DeliveryReceipt.class).convert(this);
//    }
//
//    public Invitation toInvitation() {
//        return new Converter<>(Invitation.class).convert(this);
//    }
//
//    public Presence toPresence() {
//        return new Converter<>(Presence.class).convert(this);
//    }
//
//    public TextMessage toTextMessage() {
//        return new Converter<>(TextMessage.class).convert(this);
//    }

    public func setId(_ id: String?) {
        self.id = id
    }

    public func getId() -> String? {
        return self.id
    }

    public func equals(sendable: Sendable) -> Bool {
        return self.getId() == sendable.getId()
    }

    public static func fromSendable<T: Sendable>(_ sendable: Sendable) -> T {
        let message = T.init()
        sendable.copyTo(message)
        return message
    }

}
