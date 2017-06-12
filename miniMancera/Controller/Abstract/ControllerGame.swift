import UIKit
import SpriteKit

class ControllerGame<T:MOptionProtocol>:UIViewController
{
    let model:T
    
    init()
    {
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
    
    //MARK: public
    
    final func pause()
    {
        guard
        
            let view:SKView = self.view as? SKView
        
        else
        {
            return
        }
        
        view.isPaused = true
    }
    
    final func resume()
    {
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.isPaused = false
    }
}
