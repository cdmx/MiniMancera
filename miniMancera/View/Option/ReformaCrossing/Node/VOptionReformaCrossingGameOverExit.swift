import UIKit

class VOptionReformaCrossingGameOverExit:ViewGameNode<MOptionReformaCrossing>
{
    private let kPositionY:CGFloat = 50
    
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let texture:MGameTexture = controller.model.textures.gameOverExit
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        position = CGPoint(x:sceneWidth_2, y:kPositionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        isUserInteractionEnabled = false
        
        guard
            
            let controller:COptionReformaCrossing = self.controller as? COptionReformaCrossing
            
        else
        {
            return
        }
        
        controller.gamePlayNoMore()
    }
}
