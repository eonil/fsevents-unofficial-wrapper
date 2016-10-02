//
//  FSEventUnofficialWrapperStreamError.swift
//  EonilFSEventStreamWrapper
//
//  Created by Hoon H. on 2016/10/02.
//
//

public struct FSEventUnofficialWrapperStreamError: Error {
    public var code: FSEventUnofficialWrapperStreamErrorCode
    public var message: String?
    init(code: FSEventUnofficialWrapperStreamErrorCode) {
        self.code = code
    }
    init(code: FSEventUnofficialWrapperStreamErrorCode, message: String) {
        self.code = code
        self.message = message
    }
}

public enum FSEventUnofficialWrapperStreamErrorCode {
    case cannotCreateStream
    case cannotStartStream
}
