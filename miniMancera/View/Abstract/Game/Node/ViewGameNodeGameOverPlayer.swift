import UIKit

class ViewGameNodeGameOverPlayer<T:MGame>:ViewGameNode<T>
{
    private let orientation:UIInterfaceOrientation
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        orientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait)
    {
        self.orientation = orientation
        
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
        let sceneSize:CGSize = orientationSceneSize()
        let width:CGFloat = sceneSize.width
        let height:CGFloat = sceneSize.height
        let width_2:CGFloat = width / 2.0
        let height_2:CGFloat = height / 2.0
        position = CGPoint(x:width_2, y:height_2)
    }
    
    //MARK: private
    
    private func orientationSceneSize() -> CGSize
    {
        switch orientation
        {
        case UIInterfaceOrientation.portrait,
             UIInterfaceOrientation.portraitUpsideDown,
             UIInterfaceOrientation.unknown:
            
            return MGame.sceneSize
            
        case UIInterfaceOrientation.landscapeLeft,
             UIInterfaceOrientation.landscapeRight:
            
            let size:CGSize = CGSize(
                width:MGame.sceneSize.height,
                height:MGame.sceneSize.width)
            
            return size
        }
    }
}
