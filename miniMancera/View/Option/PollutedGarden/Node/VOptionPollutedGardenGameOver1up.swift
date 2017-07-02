import UIKit

class VOptionPollutedGardenGameOver1up:ViewGameNode<MOptionPollutedGarden>
{
    private let kPositionY:CGFloat = 150
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let texture:MGameTexture = controller.model.textures.gameOver1up
        
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
            
            let controller:COptionPollutedGarden = self.controller as? COptionPollutedGarden
            
        else
        {
            return
        }
        
        controller.game1up()
    }
}
