import UIKit

class ViewGameNodeMenu<T:MGame>:ViewGameNode<T>
{
    private let orientation:UIInterfaceOrientation
    private let kMargin:CGFloat = 45
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        orientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait)
    {
        self.orientation = orientation
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
        alpha = 0
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
        
        let sceneHeight:CGFloat = orientationSceneHeight()
        let width_2:CGFloat = modelTexture.width_2
        let positionY:CGFloat = sceneHeight - kMargin
        position = CGPoint(x:width_2, y:positionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.showMenu()
    }
    
    //MARK: private
    
    private func orientationSceneHeight() -> CGFloat
    {
        switch orientation
        {
            case UIInterfaceOrientation.portrait,
                 UIInterfaceOrientation.portraitUpsideDown,
                 UIInterfaceOrientation.unknown:
            
                return MGame.sceneSize.height
            
            case UIInterfaceOrientation.landscapeLeft,
                 UIInterfaceOrientation.landscapeRight:
            
                return MGame.sceneSize.width
        }
    }
}
