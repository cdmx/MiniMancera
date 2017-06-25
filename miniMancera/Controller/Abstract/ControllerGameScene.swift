import SpriteKit

extension ControllerGame
{
    var scene:ViewGameScene?
    {
        get
        {
            guard
                
                let view:SKView = self.view as? SKView
                
            else
            {
                return nil
            }
            
            let scene:ViewGameScene? = view.scene as? ViewGameScene
            
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
    
    //MARK: scene delegate
    
    func update(_ currentTime:TimeInterval, for scene:SKScene)
    {/*
         
         if controller.model.gameActive
         {
         if let lastUpdateTime:TimeInterval = self.lastUpdateTime
         {
         let deltaTime:TimeInterval = currentTime - lastUpdateTime
         elapsedTime += deltaTime
         
         updateNodes()
         }
         
         lastUpdateTime = currentTime
         }
         
         */
    }
}
