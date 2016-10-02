//
//  FileSystemWatcher.swift
//  EonilFSEventStreamWrapper
//
//  Created by Hoon H. on 2016/10/02.
//
//

import Foundation

/// Use only in main thread.
public struct FileSystemWatch {
    public static func start(for id: ObjectIdentifier, paths: [String], handler: @escaping (FSEventUnofficialWrapperStreamEvent) -> ()) throws {
        assert(Thread.isMainThread)
        assert(watchers[id] == nil)
        // This is convenient wrapper for UI.
        // UI usually needs quicker response rather than maximum throughput.
        // Tuned for quickest response.
        let s = try FSEventUnofficialWrapperStream(pathsToWatch: paths,
                                               sinceWhen: .now,
                                               latency: 0,
                                               flags: [.noDefer],
                                               handler: handler)
        s.setDispatchQueue(DispatchQueue.main)
        try s.start()
        watchers[id] = s
    }
    public static func stop(for id: ObjectIdentifier) {
        assert(Thread.isMainThread)
        assert(watchers[id] != nil)
        guard let s = watchers[id] else { return }
        s.stop()
        s.invalidate()
        watchers[id] = nil
    }
}
private var watchers = [ObjectIdentifier: FSEventUnofficialWrapperStream]()
