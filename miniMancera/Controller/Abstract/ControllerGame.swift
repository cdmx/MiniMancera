import UIKit
import SpriteKit

class ControllerGame<T:MOptionProtocol>:UIViewController
{
    let model:T
    private(set) weak var dataOption:DOption?
    
    init(dataOption:DOption)
    {
        self.dataOption = dataOption
        model = T()
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    override var prefersStatusBarHidden:Bool
    {
        return true
    }
    
    override func loadView()
    {
        let view:SKView = SKView(frame:UIScreen.main.bounds)
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
        let size:CGSize = view.bounds.size
        
        guard
            
            let scene:SKScene = model.sceneWithSize(controller:self, size:size),
            let view:SKView = self.view as? SKView
        
        else
        {
            return
        }
        
        scene.scaleMode = SKSceneScaleMode.resizeFill
        view.showsFPS = true
        view.showsNodeCount = true
        view.ignoresSiblingOrder = true
        view.presentScene(scene)
    }
    
    //MARK: private
    
    private func asyncShowMenu()
    {
        let alert:UIAlertController = UIAlertController(
            title:nil,
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionResume:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuResume"),
            style:
            UIAlertActionStyle.cancel)
        { [weak self] (action:UIAlertAction) in
            
            self?.resume()
        }
        
        let actionExit:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuExit"),
            style:
            UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.exitGame()
        }
        
        alert.addAction(actionResume)
        alert.addAction(actionExit)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
    
    //MARK: public
    
    func pause()
    {
        guard
        
            let view:SKView = self.view as? SKView
        
        else
        {
            return
        }
        
        view.isPaused = true
    }
    
    func resume()
    {
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.isPaused = false
    }
    
    func showMenu()
    {
        pause()
        
        DispatchQueue.main.async
        { [weak self] in
                
            self?.asyncShowMenu()
        }
    }
    
    func exitGame()
    {
        guard
            
            let parent:UIViewController = UIApplication.shared.keyWindow?.rootViewController
        
        else
        {
            return
        }
        
        parent.dismiss(animated:true, completion:nil)
    }
}
