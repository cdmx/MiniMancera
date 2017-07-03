import UIKit

class VOptionWhistlesVsZombiesBoardCancel:ViewGameNodeTouch<MOptionWhistlesVsZombies>
{
    private let kPositionAddY:CGFloat = 50
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.boardCancel
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat =  kPositionAddY - sceneHeight_2
        position = CGPoint(x:0, y:positionY)
    }
}
