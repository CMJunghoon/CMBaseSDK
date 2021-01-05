#if os(iOS)
import UIKit
import RxCocoa
import RxSwift
import RxGesture

public extension Reactive where Base: UIViewController {
  var viewDidLoad: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLoad)).map { _ in return Void() }
    return ControlEvent(events: source)
  }
  
  var viewWillAppear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { _ in return Void() }
    return ControlEvent(events: source)
  }
  var viewDidAppear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { _ in return Void() }
    return ControlEvent(events: source)
  }
  
  var viewWillDisappear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { _ in return Void() }
    return ControlEvent(events: source)
  }
  var viewDidDisappear: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { _ in return Void() }
    return ControlEvent(events: source)
  }
  
  var viewWillLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewWillLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }
  var viewDidLayoutSubviews: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.viewDidLayoutSubviews)).map { _ in }
    return ControlEvent(events: source)
  }
  
  var willMoveToParentViewController: ControlEvent<UIViewController?> {
    let source = self.methodInvoked(#selector(Base.willMove)).map { $0.first as? UIViewController }
    return ControlEvent(events: source)
  }
  var didMoveToParentViewController: ControlEvent<UIViewController?> {
    let source = self.methodInvoked(#selector(Base.didMove)).map { $0.first as? UIViewController }
    return ControlEvent(events: source)
  }
  
  var didReceiveMemoryWarning: ControlEvent<Void> {
    let source = self.methodInvoked(#selector(Base.didReceiveMemoryWarning)).map { _ in }
    return ControlEvent(events: source)
  }
  
  /// Rx observable, triggered when the ViewController appearance state changes (true if the View is being displayed, false otherwise)
  var isVisible: Observable<Bool> {
    let viewDidAppearObservable = self.base.rx.viewDidAppear.map { _ in true }
    let viewWillDisappearObservable = self.base.rx.viewWillDisappear.map { _ in false }
    return Observable<Bool>.merge(viewDidAppearObservable, viewWillDisappearObservable)
  }
  
  /// Rx observable, triggered when the ViewController is being dismissed
  var isDismissing: ControlEvent<Bool> {
    let source = self.sentMessage(#selector(Base.dismiss)).map { $0.first as? Bool ?? false }
    return ControlEvent(events: source)
  }
  
}

extension Reactive where Base: UIApplication {
  /**
   Reactive wrapper for `UIApplication.willEnterForegroundNotification`.
   */
  public var applicationWillEnterForeground: Observable<Void> {
    return NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification)
      .map { _ in return Void() }
  }
  
  /**
   Reactive wrapper for `UIApplication.didBecomeActiveNotification`.
   */
  public var applicationDidBecomeActive: Observable<Void> {
    return NotificationCenter.default.rx.notification(UIApplication.didBecomeActiveNotification)
      .map { _ in return Void() }
  }
  
  /**
   Reactive wrapper for `UIApplication.didBecomeActiveNotification`.
   */
  public var applicationDidEnterBackground: Observable<Void> {
    return NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification)
      .map { _ in return Void() }
  }
  
  /**
   Reactive wrapper for `UIApplication.willResignActiveNotification`.
   */
  public var applicationWillResignActive: Observable<Void> {
    return NotificationCenter.default.rx.notification(UIApplication.willResignActiveNotification)
      .map { _ in return Void() }
  }
  
  /**
   Reactive wrapper for `UIApplication.willTerminateNotification`.
   */
  public var applicationWillTerminate: Observable<Void> {
    return NotificationCenter.default.rx.notification(UIApplication.willTerminateNotification)
      .map { _ in return Void() }
  }
}

public extension UIViewController {
  func configureRightBarItem(barButtonSystemItem: UIBarButtonItem.SystemItem) -> Driver<Void> {
    let barButtonItem = UIBarButtonItem(barButtonSystemItem: barButtonSystemItem, target: nil, action: nil)
    barButtonItem.tintColor = .white
    navigationItem.rightBarButtonItem = barButtonItem
    return barButtonItem.rx.tap.asDriver()
  }
  
  func configureRightBarItem(title: String, titleColor: UIColor = .white) -> Driver<Void> {
    let barButtonItem = UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
    barButtonItem.tintColor = titleColor
    navigationItem.rightBarButtonItem = barButtonItem
    return barButtonItem.rx.tap.asDriver()
  }
  
  func addDismissKeyboard() -> Disposable {
    return view.rx
      .tapGesture { gestureRecognizer, _ in
        gestureRecognizer.delegate = nil }
      .subscribe(onNext: { [weak self] _ in
        self?.view.endEditing(true) })
  }
  
  func configureLeftBarItem(title: String, titleColor: UIColor = .white) -> Driver<Void> {
    let item = UIBarButtonItem(title: title, style: .done, target: nil, action: nil)
    item.tintColor = titleColor
    navigationItem.leftBarButtonItem = item
    return item.rx.tap.asDriver()
  }
}

#endif
