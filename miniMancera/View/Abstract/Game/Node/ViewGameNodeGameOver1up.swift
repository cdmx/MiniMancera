import UIKit

class ViewGameNodeGameOver1up<T:MGame>:ViewGameNode<T>
{
    private let kPositionY:CGFloat = 150
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture)
    {
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
        controller.game1up()
    }
}
