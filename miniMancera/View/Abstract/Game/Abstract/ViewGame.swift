import SpriteKit

class ViewGame<T:MGame>:SKView, ViewProtocol
{
    weak var layoutLeft:NSLayoutConstraint!
    weak var layoutRight:NSLayoutConstraint!
    weak var layoutTop:NSLayoutConstraint!
    weak var layoutBottom:NSLayoutConstraint!
    weak var pushBackground:VPushBackground?
    
    init(controller:ControllerGame<T>)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        showsFPS = false
        showsNodeCount = false
        ignoresSiblingOrder = true
        translatesAutoresizingMaskIntoConstraints = false
        showsPhysics = true
        
        guard
            
            let startSceneType:SKScene.Type = controller.model.startSceneType,
            let sceneGameType:ViewGameScene<T>.Type = startSceneType as? ViewGameScene<T>.Type
        
        else
        {
            return
        }
        
        let startScene:ViewGameScene = sceneGameType.init(controller:controller)
        presentScene(startScene)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
