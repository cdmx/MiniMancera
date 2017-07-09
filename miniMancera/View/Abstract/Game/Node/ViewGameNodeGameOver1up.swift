import UIKit

class ViewGameNodeGameOver1up<T:MGame>:ViewGameNode<T>
{
    private let orientation:UIInterfaceOrientation
    private let kPositionY:CGFloat = 100
    
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
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = orientationSceneWidth()
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        position = CGPoint(x:sceneWidth_2, y:kPositionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        isUserInteractionEnabled = false
        controller.game1up()
    }
    
    //MARK: private
    
    private func orientationSceneWidth() -> CGFloat
    {
        switch orientation
        {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown,
             UIInterfaceOrientation.unknown:
            
            return MGame.sceneSize.width
            
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            
            return MGame.sceneSize.height
        }
    }
}
