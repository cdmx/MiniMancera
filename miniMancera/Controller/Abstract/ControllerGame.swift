import UIKit
import SpriteKit

class ControllerGame:UIViewController
{
    override func loadView()
    {
        let view:SKView = SKView(frame:CGRect.zero)
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let scene:SKScene = SKScene(size:view.bounds.size)
        
        guard
            
            let view:SKView = self.view as? SKView
        
        else
        {
            return
        }
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        view.showsFPS = true
        view.showsNodeCount = true
        view.ignoresSiblingOrder = true
        view.presentScene(scene)
    }
}
