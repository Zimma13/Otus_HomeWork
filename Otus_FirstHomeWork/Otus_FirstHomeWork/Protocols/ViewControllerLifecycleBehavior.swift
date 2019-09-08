import UIKit

protocol ViewControllerLifecycleBehavior {
    func afterLoading(_ viewController: UIViewController)
    
    func beforeAppearing(_ viewController: UIViewController)
    
    func afterAppearing(_ viewController: UIViewController)
    
    func beforeDisappearing(_ viewController: UIViewController)
    
    func afterDisappearing(_ viewController: UIViewController)
    
    func beforeLayingOutSubviews(_ viewController: UIViewController)
    
    func afterLayingOutSubviews(_ viewController: UIViewController)
}

extension ViewControllerLifecycleBehavior {
    func afterLoading(_ viewController: UIViewController) {}
    
    func beforeAppearing(_ viewController: UIViewController) {}
    
    func afterAppearing(_ viewController: UIViewController) {}
    
    func beforeDisappearing(_ viewController: UIViewController) {}
    
    func afterDisappearing(_ viewController: UIViewController) {}
    
    func beforeLayingOutSubviews(_ viewController: UIViewController) {}
    
    func afterLayingOutSubviews(_ viewController: UIViewController) {}
}

//MARK: ProfileVC
struct ChangeBGAndStatusBarBehavior: ViewControllerLifecycleBehavior {
    
    fileprivate enum StatusBarTextColor {
        case black
        case white
    }
    
    fileprivate func changecolor(color: StatusBarTextColor) {
        var bgColor: UIColor = .clear
        switch color {
        case .black: UIApplication.shared.statusBarStyle = .default
        case .white:
            bgColor = .black
            UIApplication.shared.statusBarStyle = .lightContent
        }
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = bgColor
        }
    }
    
    func beforeAppearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = .black
        changecolor(color: .white)
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        changecolor(color: .black)
    }
}

//MARK: - add timer
public final class StartTimerInVCBehavior: ViewControllerLifecycleBehavior {
    var timer = Timer()
    func afterAppearing(_ viewController: UIViewController) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimed), userInfo: nil, repeats: true)
    }
    
    @objc fileprivate func runTimed() {
        print(Date())
    }
    
    func beforeDisappearing(_ viewController: UIViewController) {
        timer.invalidate()
    }
}

extension UIViewController {
    /*
     Add behaviors to be hooked into this view controller’s lifecycle.
     
     This method requires the view controller’s view to be loaded, so it’s best to call
     in `viewDidLoad` to avoid it being loaded prematurely.
     
     - parameter behaviors: Behaviors to be added.
     */
    func addBehaviors(behaviors: [ViewControllerLifecycleBehavior]) {
        let behaviorViewController = LifecycleBehaviorViewController(behaviors: behaviors)
        
        addChild(behaviorViewController)
        view.addSubview(behaviorViewController.view)
        behaviorViewController.didMove(toParent: self)
    }
    
    private final class LifecycleBehaviorViewController: UIViewController {
        private let behaviors: [ViewControllerLifecycleBehavior]
        
        // MARK: - Initialization
        
        init(behaviors: [ViewControllerLifecycleBehavior]) {
            self.behaviors = behaviors
            
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - UIViewController
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.isHidden = true
            
            applyBehaviors { behavior, viewController in
                behavior.afterLoading(viewController)
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.beforeAppearing(viewController)
            }
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.afterAppearing(viewController)
            }
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.beforeDisappearing(viewController)
            }
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            
            applyBehaviors { behavior, viewController in
                behavior.afterDisappearing(viewController)
            }
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            
            applyBehaviors { behavior, viewController in
                behavior.beforeLayingOutSubviews(viewController)
            }
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            
            applyBehaviors { behavior, viewController in
                behavior.afterLayingOutSubviews(viewController)
            }
        }
        
        // MARK: - Private
        
        private func applyBehaviors(body: (_ behavior: ViewControllerLifecycleBehavior, _ viewController: UIViewController) -> ()) {
            guard let parentViewController = parent else { return }
            
            for behavior in behaviors {
                body(behavior, parentViewController)
            }
        }
    }
}
