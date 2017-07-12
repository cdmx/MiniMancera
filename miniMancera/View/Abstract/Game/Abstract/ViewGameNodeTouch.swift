import UIKit

class ViewGameNodeTouch<T:MGame>:ViewGameNode<T>
{
    private var touch:UITouch?
    
    override init(controller:ControllerGame<T>)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = true
    }
    
    override init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        colour:UIColor = UIColor.clear)
    {
        super.init(
            controller:controller,
            texture:texture,
            colour:colour)
        isUserInteractionEnabled = true
    }
    
    override init(
        controller:ControllerGame<T>,
        size:CGSize,
        zPosition:CGFloat,
        colour:UIColor = UIColor.clear)
    {
        super.init(
            controller:controller,
            size:size,
            zPosition:zPosition,
            colour:colour)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touch = touches.first
    }
    
    //MARK: public
    
    @discardableResult func lastTouch() -> UITouch?
    {
        guard
            
            let touch:UITouch = self.touch
            
        else
        {
            return nil
        }
        
        self.touch = nil
        
        return touch
    }
}
