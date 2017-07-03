import UIKit

class ViewGameNodeTouch<T:MGame>:ViewGameNode<T>
{
    private var touch:UITouch?
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        touch = touches.first
    }
    
    //MARK: public
    
    func lastTouch() -> UITouch?
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
