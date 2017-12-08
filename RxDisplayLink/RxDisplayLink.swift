//
//  RxDisplayLink.swift
//  RxDisplayLink
//
//  Created by Kyohei Ito on 2017/04/26.
//  Copyright © 2017年 Kyohei Ito. All rights reserved.
//

import RxSwift

extension CADisplayLink {
    public static let maximumFps = 60
}

public extension Reactive where Base: CADisplayLink {
    /**
     Link to the Display.
     - Parameter runloop: It can choose RunLoop to link for display. Default is main.
     - Parameter mode: The RunLoopMode has several modes. Default is commonModes. For details about RunLoopMode, see the [documents](https://developer.apple.com/reference/foundation/runloopmode).
     - Parameter fps: Frames per second. Default and max are 60.
     - Returns: Observable of CADisplayLink.
     */
    public static func link(to runloop: RunLoop = .main, forMode mode: RunLoopMode = .commonModes, fps: Int = Base.maximumFps) -> Observable<CADisplayLink> {
        return RxDisplayLink(to: runloop, forMode: mode, fps: fps).asObservable()
    }
}

public final class RxDisplayLink: ObservableType {
    public typealias E = CADisplayLink
    
    private let runloop: RunLoop
    private let mode: RunLoopMode
    private let fps: Int
    private var observer: AnyObserver<E>?
    
    @objc dynamic private func displayLinkHandler(link: E) {
        observer?.onNext(link)
    }
    
    public init(to runloop: RunLoop, forMode mode: RunLoopMode, fps: Int) {
        self.runloop = runloop
        self.mode = mode
        self.fps = fps
    }
    
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        var displayLink: E? = E(target: self, selector: #selector(displayLinkHandler))
        displayLink?.add(to: runloop, forMode: mode)
        if #available(iOS 10.0, tvOS 10.0, *) {
            displayLink?.preferredFramesPerSecond = fps
        } else {
            displayLink?.frameInterval = max(E.maximumFps / fps, 1)
        }
        
        self.observer = AnyObserver<E>(observer)
        
        return Disposables.create {
            self.observer = nil
            displayLink?.invalidate()
            displayLink = nil
        }
    }
}
