import SpriteKit

class ViewGame:SKView
{
    init(controller:ControllerGame)
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
        
        let startScene:ViewGameScene = startSceneType.init(controller:controller)
        presentScene(startScene)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
