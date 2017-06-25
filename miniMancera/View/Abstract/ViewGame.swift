import SpriteKit

class ViewGame<T:MGame>:SKView
{
    init(controller:ControllerGame<T>)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        showsFPS = false
        showsNodeCount = false
        ignoresSiblingOrder = true
        translatesAutoresizingMaskIntoConstraints = false
        
        guard
            
            let startSceneType:ViewGameScene.Type = controller.model.startSceneType
        
        else
        {
            return
        }
        
        let startScene:ViewGameScene<T> = startSceneType.init(controller:controller)
        presentScene(startScene)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
