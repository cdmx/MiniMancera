import UIKit

class ViewGameNodeMenu<T:MGame>:ViewGameNode<T>
{
    private let kMargin:CGFloat = 45
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        alpha:CGFloat = 0)
    {
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
        self.alpha = alpha
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let modelTexture:MGameTexture = modelTexture
            
        else
        {
            return
        }
        
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = modelTexture.width_2
        let positionY:CGFloat = sceneHeight - kMargin
        position = CGPoint(x:width_2, y:positionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.showMenu()
    }
}
