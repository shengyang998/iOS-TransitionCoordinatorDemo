##  Description

## Animation in transitionCoordinator 
This project demostrate how to use `transitionCoordinator` to animate the view when pushing

The animation is implemented inside `viewWillAppear` and `viewWillDisappear`. 
Inside `transitionCoordinator.animate` block, we set the last status of the view we want to animate and that's it.
All the timing things will automatically been done by the system. We don't need to worry about it. 
