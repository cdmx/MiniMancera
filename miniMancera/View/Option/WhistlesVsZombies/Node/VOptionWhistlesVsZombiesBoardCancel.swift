import UIKit

class VOptionWhistlesVsZombiesBoardCancel:ViewGameNode<MOptionWhistlesVsZombies>
{
    private var touch:UITouch?
    private let kPositionAddY:CGFloat = 50
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.boardCancel
        
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
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat =  kPositionAddY - sceneHeight_2
        position = CGPoint(x:sceneWidth_2, y:positionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touch = touches.first
    }
    
    //MARK: public
    
    func hasTouches() -> Bool
    {
        guard
        
            let _:UITouch = touch
        
        else
        {
            return false
        }
        
        touch = nil
        
        return true
    }
}
