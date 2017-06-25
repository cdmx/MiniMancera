import SpriteKit

extension ControllerGame
{
    var scene:ViewGameScene<T>?
    {
        get
        {
            guard
                
                let view:SKView = self.view as? SKView
                
            else
            {
                return nil
            }
            
            let scene:ViewGameScene<T>? = view.scene as? ViewGameScene<T>
            
            return scene
        }
    }
    
    func playSound(actionSound:SKAction)
    {
        if playSounds
        {
            scene?.run(actionSound)
        }
    }
}
