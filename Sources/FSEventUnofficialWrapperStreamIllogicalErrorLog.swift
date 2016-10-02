//
//  FSEventUnofficialWrapperStreamIllogicalErrorLog.swift
//  EonilFSEventStreamWrapper
//
//  Created by Hoon H. on 2016/10/02.
//
//

/// An error that is very unlikely to happen if this library code is properly written.
///
public struct FSEventUnofficialWrapperStreamIllogicalErrorLog {
    public var code: FSEventUnofficialWrapperStreamCriticalErrorCode
    public var message: String?
    init(code: FSEventUnofficialWrapperStreamCriticalErrorCode) {
        self.code = code
    }
    init(code: FSEventUnofficialWrapperStreamCriticalErrorCode, message: String) {
        self.code = code
        self.message = message
    }
    func cast() {
        FSEventUnofficialWrapperStreamIllogicalErrorLog.handler(self)
    }

    /// Can be called at any thread.
    public static var handler: (FSEventUnofficialWrapperStreamIllogicalErrorLog) -> () = { assert(false, "FSEventUnofficialWrapperStream: \($0)") }
}

public enum FSEventUnofficialWrapperStreamCriticalErrorCode {
    case missingContextRawPointerValue
    case unexpectedPathValueType
    case unmatchedEventParameterCounts
}
