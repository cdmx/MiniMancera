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
