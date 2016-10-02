//
//  FSEventUnofficialWrapperStreamCreateFlags.swift
//  EonilFSEventStreamWrapper
//
//  Created by Hoon H. on 2016/10/02.
//
//

import Foundation

public struct FSEventUnofficialWrapperStreamCreateFlags: OptionSet {
    public let rawValue: FSEventStreamCreateFlags
    public init(rawValue: FSEventStreamCreateFlags) {
        self.rawValue = rawValue
    }
    fileprivate init(rawValue: Int) {
        self.rawValue = FSEventStreamCreateFlags(truncatingBitPattern: rawValue)
    }
}

/// Flags that can be passed to `FSEventUnofficialWrapperStream.init`
/// to modify the behavior of the stream being created.
///
/// - Note:
///     Documentation comments are copied from Apple's documentation
///     for convenience.
///
/// - Note:
///     `kFSEventStreamCreateFlagUseCFTypes` is not available because
///     this wrapper designed to be Swift-y interface as much as possible
///     by sacrificing a bit of performance.
///
public extension FSEventUnofficialWrapperStreamCreateFlags {

    /*
     * The default.
     */
    public static var none: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagNone)
    }

    /*
     * The framework will invoke your callback function with CF types
     * rather than raw C types (i.e., a CFArrayRef of CFStringRefs,
     * rather than a raw C array of raw C string pointers). See
     * FSEventStreamCallback.
     */
    internal static var useCFTypes: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagUseCFTypes)
    }

    /*
     * Affects the meaning of the latency parameter. If you specify this
     * flag and more than latency seconds have elapsed since the last
     * event, your app will receive the event immediately. The delivery
     * of the event resets the latency timer and any further events will
     * be delivered after latency seconds have elapsed. This flag is
     * useful for apps that are interactive and want to react immediately
     * to changes but avoid getting swamped by notifications when changes
     * are occurringin rapid succession. If you do not specify this flag,
     * then when an event occurs after a period of no events, the latency
     * timer is started. Any events that occur during the next latency
     * seconds will be delivered as one group (including that first
     * event). The delivery of the group of events resets the latency
     * timer and any further events will be delivered after latency
     * seconds. This is the default behavior and is more appropriate for
     * background, daemon or batch processing apps.
     */
    public static var noDefer: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagNoDefer)
    }

    /*
     * Request notifications of changes along the path to the path(s)
     * you're watching. For example, with this flag, if you watch
     * "/foo/bar" and it is renamed to "/foo/bar.old", you would receive
     * a RootChanged event. The same is true if the directory "/foo" were
     * renamed. The event you receive is a special event: the path for
     * the event is the original path you specified, the flag
     * kFSEventStreamEventFlagRootChanged is set and event ID is zero.
     * RootChanged events are useful to indicate that you should rescan a
     * particular hierarchy because it changed completely (as opposed to
     * the things inside of it changing). If you want to track the
     * current location of a directory, it is best to open the directory
     * before creating the stream so that you have a file descriptor for
     * it and can issue an F_GETPATH fcntl() to find the current path.
     */
    public static var watchRoot: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagWatchRoot)
    }

    /*
     * Don't send events that were triggered by the current process. This
     * is useful for reducing the volume of events that are sent. It is
     * only useful if your process might modify the file system hierarchy
     * beneath the path(s) being monitored. Note: this has no effect on
     * historical events, i.e., those delivered before the HistoryDone
     * sentinel event.  Also, this does not apply to RootChanged events
     * because the WatchRoot feature uses a separate mechanism that is
     * unable to provide information about the responsible process.
     */
    @available(macOS, introduced: 10.6)
    @available(iOS, introduced: 6.0)
    public static var ignoreSelf: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagIgnoreSelf)
    }

    /*
     * Request file-level notifications.  Your stream will receive events
     * about individual files in the hierarchy you're watching instead of
     * only receiving directory level notifications.  Use this flag with
     * care as it will generate significantly more events than without it.
     */
    @available(macOS, introduced: 10.7)
    @available(iOS, introduced: 6.0)
    public static var fileEvents: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagFileEvents)
    }

    /*
     * Tag events that were triggered by the current process with the "OwnEvent" flag.
     * This is only useful if your process might modify the file system hierarchy
     * beneath the path(s) being monitored and you wish to know which events were
     * triggered by your process. Note: this has no effect on historical events, i.e.,
     * those delivered before the HistoryDone sentinel event.
     */
    @available(macOS, introduced: 10.9)
    @available(iOS, introduced: 7.0)
    public static var markSelf: FSEventUnofficialWrapperStreamCreateFlags {
        return FSEventUnofficialWrapperStreamCreateFlags(rawValue: kFSEventStreamCreateFlagMarkSelf)
    }
}
//public enum FSEventUnofficialWrapperStreamCreateFlags: UInt32, OptionSet {
////    public static let none = FSEventUnofficialWrapperStreamCreateFlags([])
//
////    public init(rawValue: UInt32) {
////        self = rawValue
////    }
//
//    /*
//     * The framework will invoke your callback function with CF types
//     * rather than raw C types (i.e., a CFArrayRef of CFStringRefs,
//     * rather than a raw C array of raw C string pointers). See
//     * FSEventStreamCallback.
//     */
//    case useCFTypes = 0x00000001
//
//    /*
//     * Affects the meaning of the latency parameter. If you specify this
//     * flag and more than latency seconds have elapsed since the last
//     * event, your app will receive the event immediately. The delivery
//     * of the event resets the latency timer and any further events will
//     * be delivered after latency seconds have elapsed. This flag is
//     * useful for apps that are interactive and want to react immediately
//     * to changes but avoid getting swamped by notifications when changes
//     * are occurringin rapid succession. If you do not specify this flag,
//     * then when an event occurs after a period of no events, the latency
//     * timer is started. Any events that occur during the next latency
//     * seconds will be delivered as one group (including that first
//     * event). The delivery of the group of events resets the latency
//     * timer and any further events will be delivered after latency
//     * seconds. This is the default behavior and is more appropriate for
//     * background, daemon or batch processing apps.
//     */
//    case noDefer = 0x00000002
//
//    /*
//     * Request notifications of changes along the path to the path(s)
//     * you're watching. For example, with this flag, if you watch
//     * "/foo/bar" and it is renamed to "/foo/bar.old", you would receive
//     * a RootChanged event. The same is true if the directory "/foo" were
//     * renamed. The event you receive is a special event: the path for
//     * the event is the original path you specified, the flag
//     * kFSEventStreamEventFlagRootChanged is set and event ID is zero.
//     * RootChanged events are useful to indicate that you should rescan a
//     * particular hierarchy because it changed completely (as opposed to
//     * the things inside of it changing). If you want to track the
//     * current location of a directory, it is best to open the directory
//     * before creating the stream so that you have a file descriptor for
//     * it and can issue an F_GETPATH fcntl() to find the current path.
//     */
//    case watchRoot = 0x00000004
//
//    /*
//     * Don't send events that were triggered by the current process. This
//     * is useful for reducing the volume of events that are sent. It is
//     * only useful if your process might modify the file system hierarchy
//     * beneath the path(s) being monitored. Note: this has no effect on
//     * historical events, i.e., those delivered before the HistoryDone
//     * sentinel event.  Also, this does not apply to RootChanged events
//     * because the WatchRoot feature uses a separate mechanism that is
//     * unable to provide information about the responsible process.
//     */
//    @available(macOS, introduced: 10.6)
//    @available(iOS, introduced: 6.0)
//    case ignoreSelf = 0x00000008
//
//    /*
//     * Request file-level notifications.  Your stream will receive events
//     * about individual files in the hierarchy you're watching instead of
//     * only receiving directory level notifications.  Use this flag with
//     * care as it will generate significantly more events than without it.
//     */
//    @available(macOS, introduced: 10.7)
//    @available(iOS, introduced: 6.0)
//    case fileEvents = 0x00000010
//
//    /*
//     * Tag events that were triggered by the current process with the "OwnEvent" flag.
//     * This is only useful if your process might modify the file system hierarchy
//     * beneath the path(s) being monitored and you wish to know which events were
//     * triggered by your process. Note: this has no effect on historical events, i.e.,
//     * those delivered before the HistoryDone sentinel event.
//     */
//    @available(macOS, introduced: 10.9)
//    @available(iOS, introduced: 7.0)
//    case markSelf = 0x00000020
//}

extension FSEventUnofficialWrapperStreamCreateFlags: Hashable, CustomStringConvertible, CustomDebugStringConvertible {
    public var hashValue: Int {
        return rawValue.hashValue
    }
    private static func getNameMapping() -> [FSEventUnofficialWrapperStreamCreateFlags: String] {
        return [
            .none: ".none",
            .useCFTypes: ".useCFTypes",
            .noDefer: ".noDefer",
            .watchRoot: ".watchRoot",
            .ignoreSelf: ".ignoreSelf",
            .fileEvents: ".fileEvents",
            .markSelf: ".markSelf",
        ]
    }
    public var description: String {
        return debugDescription
    }
    public var debugDescription: String {
        let map = FSEventUnofficialWrapperStreamCreateFlags.getNameMapping()
        let ns1 = map.filter({ contains($0.key) }).map({ $0.value })
        return "[\(ns1.joined(separator: ","))]"
    }
}

