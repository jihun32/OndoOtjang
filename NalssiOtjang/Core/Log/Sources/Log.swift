// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import os.log

public enum Log {
    public enum Level {
        case debug
        case info
        case network
        case error
        case custom(category: String)
        
        fileprivate var category: String {
            switch self {
            case .debug:
                return "Debug"
            case .info:
                return "Info"
            case .network:
                return "Network"
            case .error:
                return "Error"
            case .custom(let categoryName):
                return "\(categoryName)"
            }
        }
        
        fileprivate var osLogType: OSLogType {
            switch self {
            case .debug, .custom:
                return .debug
            case .info:
                return .info
            case .network:
                return .default
            case .error:
                return .error
            }
        }
    }
}

public extension Log {
    static func debug(_ message: Any) {
        Log.log(message, level: .debug)
    }
    
    static func info(_ message: Any) {
        Log.log(message, level: .info)
    }
    
    static func network(_ message: Any) {
        Log.log(message, level: .network)
    }
    
    static func error(_ message: Any) {
        Log.log(message, level: .error)
    }
    
    static func custom(_ message: Any, category: String) {
        Log.log(message, level: .custom(category: category))
    }
}

private extension Log {
    static func log(
        _ message: Any,
        level: Level,
        file: String = #fileID,
        function: String = #function,
        line: Int = #line
    ) {
#if DEBUG
        let subsystem = Bundle.main.bundleIdentifier ?? ""
        let logger = Logger(subsystem: subsystem, category: level.category)
        let logMessage = "\(message) \(file) \(function) \(line)"
        let isPreview = ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
        
        if isPreview {
            print(logMessage)
            return
        }
        
        switch level {
        case .debug:
            logger.debug("🔎 \(logMessage, privacy: .public)")
        case .info:
            logger.info("ℹ️ \(logMessage, privacy: .public)")
        case .network:
            logger.log("🌐 \(logMessage, privacy: .public)")
        case .error:
            logger.error("🚨 \(logMessage, privacy: .public)")
        case .custom:
            logger.log("✅ \(logMessage, privacy: .public)")
        }
        logger.log(level: level.osLogType, "\(logMessage, privacy: .public)")
        
#endif
    }
}
